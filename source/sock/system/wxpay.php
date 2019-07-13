<?php





checktop();

class wxpay extends systemSock{

	public
	function run($data){
	
		/*YLog::txt($data);*/
		$where['data']=$data['orderid'];
		$where['flag']=0;
		$event=T('event')->get_one($where);
		if(!$event)return false;
		$up=array('flag'=>1,'dealtime'=>time());
		$ob=T('event')->update($up,$where);
		$client=$event['clientid'];
		self::send($client,array('status'=>1,'url'=>geturl(null,null,'order','user')));
		return true;

	}




}

?>
