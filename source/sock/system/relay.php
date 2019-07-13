<?php

//此处为消息转发，勿修改

namespace ng169\sock\system;
use ng169\sock\systemSock;

checktop();

class relay extends systemSock{
  
	public
	function run(){
		 //是不是自己的客户端，是就直接发，不是就连接在发	
		//发送数据到对应的sip用户端
		if($this->is_this()){
			self::socksend($this->tcid,$this->data);
		}else{				
			self::phpsend_live($this->tosip,$this->recv);
		}
		return true;

	}




}

?>
