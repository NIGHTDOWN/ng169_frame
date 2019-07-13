<?php



namespace ng169\sock;
use \ng169\lib\Socket;
use \ng169\tool\Code;
checktop();
define('TEXT',1);
define('IMG',2);
define('GIF',3);
define('VOICE',4);
define('VIDEO',5);
define('LOOK',6);
define('URL',7);
define('GIFT',8);
class out extends  Socket{
	
	private $come;
	private $fun;
	private $control;	
	private $token;  
	private $tid;  
	private $clientid;  
	private $uid;  
	/**
	* 设置加密token
	* @param undefined $token
	* 
	* @return
	*/ 	
	public 	 function settoken($token){
		$this->token=$token;
	} 
	/**
	* 设置来源
	* @param undefined $type user system admin
	* @param undefined $c control
	* @param undefined $a function 
	* 
	* @return
	*/
	public 	 function setcome($type,$c,$a,$id){
		$this->come=$type;
		$this->control=$c;
		$this->fun=$a;
		$this->tid=$id;
	} 

	private function encode($datas){
		$code=json_encode($datas);
		$token=self::gettk($this->clientid);
		if(!$token && $this->uid){
			
			$token=self::getuidtk($this->uid);
			
		}
		$code=Code::encode($code,$token);
		
		return $code;
	}
	private function bulid($msg){
		$data=['from'=>$this->come,'fun'=>$this->fun,'control'=>$this->control,'tid'=>$this->tid,'data'=>$msg];
		return $data;
	}
	private function _sendclient($id,$code){		
		return $this->socksend($id,$code);	
		return false;
	}
	public
	function sendtext($user,$data){					
		//Rediscache
		//写缓存避免重复读库，
		//这里有给问题，其他客户端下线的用户还会被记录到历史缓存中
		if(!isset(self::$sips[$user])){
			$tousers=T('sock_client')->set_field('clientid,sid,uname')->get_one(['uname'=>$user,'online'=>1]);
			if(!$tousers){
				//用户不在线
				return false;
			}
			self::$sips[$user]=$tousers;
		}else{
			$tousers=self::$sips[$user];
		}
		$this->clientid=$tousers['clientid'];
		$this->uid=$user;	
		//$msg=['type'=>TEXT,'msg'=>$data];	
		//判断客户端是否在线，不在线直接不发，避免超时
		//判断客户端是否连线本机		
		$data=$this->encode($data);			
		$data=$this->bulid($data);		
		if($tousers['sid']!=self::$sid){
			//$index=':sid_'.$tousers['sid'];
			/*$servinfo=isset(self::$sip[$tousers['sid']])?self::$sip[$tousers['sid']]:'';
			if(!$servinfo){*/
				/*$servinfo=T('sockserver')->get_one(['sid'=>$tousers['sid'],'flag'=>1]);
				if($servinfo){
					self::$sip[$tousers['sid']]=$servinfo;
				}else{
					return false;
				}*/
			/*}*/
			//转发到对应server执行发送操作
			$data=['action'=>'relay','cid'=>$tousers['clientid'],'data'=>$data];			
			
			//如果当前server不是master就转发给master，是master	
			if(self::$is_master['sid']==self::$sid){
				self::phpsend_live($tousers['sid'],$data);//尽量先传master，没master就直接传对应sip
			}else{			
				self::phpsend_live(self::$is_master['sid'],$data);//尽量先传master，没master就直接传对应sip
			}	
			return 1;
		}		
		return  $this->_sendclient($this->clientid,$code);
	}
	public
	function csendtext($cliendid,$data){	
		$this->clientid=$cliendid;	//加密token
		$msg=['type'=>TEXT,'msg'=>$data];		
		$msg=$this->encode($msg);		
		$code=$this->bulid($msg);		
		return  $this->_sendclient($cliendid,$code);
	}

}

?>

