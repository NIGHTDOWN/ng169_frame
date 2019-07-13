<?php





checktop();

class wxpay extends userSock{
  
	public
	function run($socket,$data){
	
		$user=$this->checklogin($data->cookie);
		if(!$user)return false;
		$id=self::getindex($socket);
		$insert['clientid']=$id;
		$insert['uid']=$user['uid'];
		$insert['addtime']=time();
		$insert['data']=$data->orderid;
		$insert['desc']='微信扫码支付通知';
		T('event')->add($insert);
		
		return true;

	}




}

?>
