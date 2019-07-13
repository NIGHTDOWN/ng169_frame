<?php





checktop();

class wxbuy extends systemSock{

	public
	function run($data){
		
		$order=T('pay')->get_one(array('soleid'=>$data['data']['orderid']));
		
		
		if(!$order)return false;
		if($order['paystatus']!=1)return false;
		if($order['payduan']!='web')return false;
		$where['data']='wxpay_'.date('ymdH');;
		$where['flag']=0;
		$where['uid']=$order['uid'];
		
		$events=T('event')->get_all($where);
		
		if(!sizeof($events))return false;
		foreach($events as $event ){
			$up=array('flag'=>1,'dealtime'=>time());
			$ob=T('event')->update($up,$where);
			$client=$event['clientid'];
			self::send($client,array('status'=>1,'url'=>geturl(null,null,'order','user')));
		}
		
		return true;

	}




}

?>
