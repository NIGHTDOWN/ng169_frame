<?php
namespace ng169\sock;
use \ng169\Y;
use \ng169\lib\Socket;
use \ng169\tool\Code;
use ng169\sock\out;
use ng169\service\Input;
use ng169\cache\Rediscache;
use ng169\lib\Lang ;


class userSock extends Socket{
	public $uid='';
	public $socket;
	public $data;
	public $out;
	public $token;
	public $time;
	public $action;
	public $fun;
	public $redis_pre_c=":tokenCid_";
	public $redis_pre_u=":tokenUid_";
	public $clientid="";
	public $tid="";//记录标识
	/**
	* 初始化连接
	* @param undefined $socket 连接sock
	* @param undefined $recv 	接收的数据	
	* @param undefined $action	
	* @param undefined $fun
	* 
	* @return
	*/
	public function init($socket,$recv){
		//初始化
//		$action=$recv['action'];
		$this->action=$recv['action'];
		Lang::sockload('user',$this->action);//加载语言包
		$this->socket=$socket;
		$this->data=$recv['data'];
		$this->fun=$recv['fun'];		
		$this->tid=$recv['tid'];		
		$this->clientid=Socket::getindex($this->socket);		
		if($this->action!='login'){
			//检测连接登入状态
			$this->islogin();
		}	
		$this->time=time();
		return  1;	
	}	
	/**
	* 检查登入状态；并初始化token
	* 
	* @return
	*/
	private function islogin(){		
		$clientid=$this->clientid;

		$token=isset(Socket::$sockets[$clientid]['token'])?Socket::$sockets[$clientid]['token']:'';
		if(!$token){
			//这里是测试用的
			/*$this->send($this->socket);*/			
			/*$this->token='123456789';	*/
			//重新登入,更新token
			
			$this->sendsys($clientid,__('请先登入'));
			return false;
		
		}else{
			
			if(!Socket::$redis->get($this->redis_pre_c.$clientid)){
				$this->sendsys($clientid,__('token过期，请重新登入'));
				Socket::kick($clientid);
				unset(Socket::$sockets[$clientid]['token']);
			
				return false;
			}
			/*Socket::$redis->close();		*/
			$this->token=	$token;		
		}	
		$this->uid=Socket::$sockets[$clientid]['uname'];
		return true;	
	}

	
	public function login($name){
		
		$clientid=$this->clientid;		
		
		if(!empty(Socket::$sockets[$clientid]['uname']) ){
			$this->sendsys($clientid,__('已经成功登入连接了'));
			return  false;
		}
		Socket::$sockets[$clientid]['uname']=$name;
		Socket::$sockets[$clientid]['check']=1;	
		$userislogin=T('sock_client')->get_one(array('uname'=>$name,'online'=>1,'check'=>1,'handshake'=>1));//其他地方登入	
		$where=array('clientid'=>$clientid,'online'=>1);
		if($userislogin){
			//这里是测试用的
			/*$this->send($this->socket);*/			
			/*$this->token='123456789';*/
		
			//用户已经登入其他客户端；
			$this->token=	$userislogin['token'];
			Socket::$redis->set($this->redis_pre_c.$this->clientid,$this->token);			
			Socket::$redis->set($this->redis_pre_u.$name,$this->token);
//			$upte=array('uname'=>$name,'check'=>1);
			T('sock_client')->del(['clientid'=>$userislogin['clientid']]);	
			$this->sendsys($userislogin['clientid'],__('已经在其他地方登入'));
			unset(self::$sockets[$userislogin['clientid']]);
		}
			$token=T('user')->get_one(['uid'=>$name]);
			$this->token=$token['token'];
			Socket::$redis->set($this->redis_pre_c.$this->clientid,$this->token);			
			Socket::$redis->set($this->redis_pre_u.$name,$this->token);			
			//重新登入,更新token
			Socket::$sockets[$clientid]['token']=$this->token;
			/*$upte=array('uname'=>$name,'check'=>1,'token'=>$this->token);*/
			$tmp=Socket::$sockets[$clientid];
			$tmp['resource']=intval($tmp['resource']);
			$where=['clientid'=>$clientid];
			if(T('sock_client')->get_one($where)){
				T('sock_client')->update($tmp,$where);
			}else{
				T('sock_client')->add($tmp);
			}
			
			Socket::$sockets[$clientid]['token']=$this->token;
			return true;			
		//上线提醒广播到好友列表		
		/*if($login){
		//广播登入信息；
		$data['uid']=$user['uid'];
		$data['username']=$user['username'];
		if(Socket::reflash($user['uid'])){
		$this->broadcast($data);
		}	
		}*/
				 
	}
	//解密
	public function decode($str,$key){
		$data=Code::decode($str,$key);
		return $data;
	}
	public function encode($str,$key){
		$data=Code::encode($str,$key);
		return $data;
	}
	/**
	* 获取加密数据的解密
	* @param undefined $name 参数名
	* 
	* @return string
	*/
	public function getparam($name='',$alias=null){
		if(!$name)return false;		
		$decode=$this->decode($this->data,$this->token);		
		$data = json_decode($decode,1);
		if(!$data)return false;
		//这里过滤
		$res=new Input(array('string'=>array($name)),array($name=>$alias),$data);
		return $res->get()[$name];
	}
	/**
	* 获取非加密数据的解密
	* @param undefined $name
	* 
	* @return string
	*/
	public function getparams($name=''){
		if(!$name)return false;		
		$data = json_decode($decode,1);
		if(!$data)return false;
		$res=new Input(array('string'=>array($name)),array($name=>$alias),$data);
		return $res->get()[$name];
	}
	public function getargs(){
		return $this->data;
	}
	public function send($uid,$msg){
		if($this->out==''){			
			$this->out=new out();					
		}
		/*$this->out->settoken($this->token);	*/		
		$this->out->setcome(USERMSG,$this->action,$this->fun,$this->tid);	
		$this->out->sendtext($uid,$msg);
		return 1;	
	}
	public function sendsys($client,$msg){
		if($this->out==''){			
			$this->out=new out();					
		}
		/*$this->out->settoken($this->token);		*/	
		$this->out->setcome(SYSMSG,$this->action,$this->fun,$this->tid);
		$this->out->csendtext($client,$msg);
		return 1;
	}
	
}

?>
