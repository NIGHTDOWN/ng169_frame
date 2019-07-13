<?php





checktop();

class close extends systemSock{

	public
	function run($data){
	
		socket_close(self::$master);
		self::$stop=true;
		unset(self::$sockets);
		unset($this);
		
	}




}

?>
