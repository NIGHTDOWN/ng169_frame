<?php



namespace ng169\sock\user;
use ng169\sock\userSock;

checktop();

class test extends userSock{
  
	public
	function run($socket,$data){
		/*$sock=socketClass::$sockets[socketClass::getindex($socket)];
		
		$user=$this->login($data->cookie);
		
		$this->broadcast($user['uid']);*/
		
		switch($data->f){
			//获取用户列表
			case 'getlist':
			$this->socksend($socket,serialize(self::$sockets));
				break;
			//发消息给用户
			case 'send':
				break;
			default:
				break;
		}
		
		return true;

	}
public
	function get($data){
		/*$sock=socketClass::$sockets[socketClass::getindex($socket)];
		
		$user=$this->login($data->cookie);
		
		$this->broadcast($user['uid']);*/
		
		$this->socksend($this->socket,sizeof(self::$sockets));
		
		
		return true;

	}

public
	function sendmsg($data){
		/*$sock=socketClass::$sockets[socketClass::getindex($socket)];
		
		$user=$this->login($data->cookie);
		
		$this->broadcast($user['uid']);*/
		
		$client=self::$sockets[$data->num]['resource'];
		
		$this->socksend($client,$data->msg);
		
		$this->socksend($this->socket,$data->msg);
		/*echo $data->msg;
		$msg=\ng169\tool\Code::encode($data->msg,'123');
		echo $msg;
		$msg=\ng169\tool\Code::encode($msg,'123');
		echo $msg;*/
		/*d($this->socket);
		d($client);*/
		
		return true;

	}

}

?>
