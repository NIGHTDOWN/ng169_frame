<?php





checktop();

class Sock_a1 extends userSock{

	public
	function run($socket,$data){
	/*socketClass::$sockets;*/
	/*$data=parent::getclient();*/
		YLog::txt('后端登入');
	
		
		$this->socksend($socket,'后端登入');
		$this->broadcast('后端登入');
		return $admininfo;

	}




}

?>
