<?php



namespace ng169\sock;

use ng169\Y;
use ng169\lib\Socket;
use ng169\lib\Lang;



checktop();
class systemSock extends Socket{
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
	public $tid="";//
	public $recv="";//
	public $tcid="";//接收方clientid
	public $tosip='';
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

		$this->action=$recv['action'];
		Lang::sockload('system',$this->action);//加载语言包
		$this->socket=$socket;
		$this->data=$recv['data'];
		$this->recv=$recv;
		$this->fun=isset($recv['fun'])?$recv['fun']:'run';		
		$this->tcid=$recv['cid'];		
		/*$this->data=$recv;*/
		$this->time=time();
		return  1;	
	}	
	public function is_this(){
		list($sip,$num)=explode('SIP',$this->tcid);
		$this->tosip=$sip;
		if($sip==self::$sid){
			return true;
		}return false;
	}
}

?>
