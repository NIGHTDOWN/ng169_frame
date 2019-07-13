<?php

namespace ng169\sock\user;
use ng169\sock\userSock;


checktop();

class login extends userSock{
  
	public 
	function run($data){		
		/*$code=$this->getparam();*/
		$this->token='123456789';
		$name=$this->getparam('uid',__('用户ID'));
		if(self::$sockets[$this->clientid]['check']==1){
			$this->sendsys($this->clientid,__('已经登入'));
			return false;
		}	
		if(!$name){
			$this->sendsys($this->clientid,__('请输入用户ID'));
			return false;
		}	
		$bool=$this->login($name);		
		if($bool){
			$this->sendsys($this->clientid,__('连接成功'));
		}else{
			$this->sendsys($this->clientid,__('连接失败'));
			$this->disconnect($this->socket);
		}
		return true;
	}
	//登入

}

?>
