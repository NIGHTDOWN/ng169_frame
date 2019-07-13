<?php



namespace ng169\sock\user;
use ng169\sock\userSock;

checktop();

class rtc extends userSock{
  
	public
	function run(){
		$id=$this->getparam('touid');  		
		$msg=$this->getparam('msg');
		/*if(!$id){
			$this->sendsys($this->clientid,__('接收方ID不能为空'));
			return false;
		}*/
		$this->sendsys($this->clientid,__('发送成功'));			
		$this->send($id,$msg);			
//		d($this->clientid);
		/*$this->socksend($this->socket,$msg);*/
		return true;

	}




}

?>
