<?php



namespace ng169\sock\user;
use ng169\sock\userSock;
use \ng169\lib\Socket;
checktop();

class cheat extends userSock{
  	private $userlist=[];
	public
	function run(){
		
		$id=$this->getparam('chatid');  		
		$content=$this->getparam('msg');
		$type=$this->getparam('type');
		$url=$this->getparam('url');
		$resid=$this->getparam('resid');
		$murl=$this->getparam('msgThumbnailUrl');
		if(!$id){
			$this->sendsys($this->clientid,__('会话ID不能为空'));
			return false;
		}
		/*$this->_writedb();*/
		$ret=$this->_writedb($id,$type,$content,$murl,$url,$resid);
		if($ret && is_array($ret)){
			$userlist=$this->_getchatlist($id);
			$msg=[
				'msgTime'=>$this->time,
				'msgType'=>$ret['type'],
				'sender'=>$this->uid,
				'receiver'=>'',
				'msgId'=>$ret['msgid'],
				'msgStatus'=>$ret['readflag'],
				'msgContent'=>$ret['content'],
				'msgUrl'=>$ret['url'],
				'msgThumbnailUrl'=>$ret['url'],
				'msgResid'=>$ret['resid'],
				/*'isSelf'=>'',
				'lifetime'=>'',
				'identify'=>'',
				'msgLevel'=>'',
				'msgOtherUrl'=>'',
				'duration'=>'',
				'fileSize'=>'',
				'filePath'=>'',
				'isVip'=>'',
				'downloadFlag'=>'',
				'tipsType'=>'',
				'tips'=>''*/
			];
			
			foreach($userlist as $uid){
				if($uid!=$this->uid){
					$msg['receiver']=$uid;
					$this->send($uid,$msg);
				}
				
			}
			
			$this->sendsys($this->clientid,__('发送成功'));			
				
		}				
		//		d($this->clientid);
		/*$this->socksend($this->socket,$msg);*/
		return true;

	}
	//这里写发送消息逻辑
	private function _writedb($chatid,$type,$content,$murl,$url,$resid){
		//不在会话退出，会话由api创建
		if(!$this->_inchat($chatid))return false;
		$insert=['chatid'=>$chatid,'comeid'=>$this->uid,'sendtime'=>$this->time,'readflag'=>0,'type'=>$type,
			'content'=>$content,'url'=>$url,'resid'=>$resid
		];
		$msgid= T('chat_msg')->add($insert);
		$insert['msgid']=$msgid;
		return $insert;
	
		
		//把消息记录到会话
	
	
	}
	private function _inchat($chatid){
		$index=$this->uid.'_inchat'.$chatid;
		$type=self::$redis->get($index);
		//1表示在会话中
		if($type==1){
			return true;
		}
		//2表示在会话中
		if($type==2){
			return false;
		}
		//缓存无纪律，读库在写缓存
		$bool=T('chat_user')->set_field('uid')->get_one(['uid'=>$this->uid,'chatid'=>$chatid]);
		if($bool){
			self::$redis->set($index,1);
			return true;
		}else{
			self::$redis->set($index,2);
			return false;
		}
	}
	//获取收信用户列表
	private function _getchatlist($chatid){
		$index='chatlist'.$chatid;
		$userlist=self::$redis->get($index);
		if(!$userlist){
			$userlists=T('chat_user')->set_field('uid')->get_all(['chatid'=>$chatid]);
			$userlist=array_column($userlists,'uid');
			self::$redis->set($index,$userlist);
		}
		return $userlist;
		
	}

}




?>
