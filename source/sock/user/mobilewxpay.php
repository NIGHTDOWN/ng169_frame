<?php





checktop();

class mobilewxpay extends userSock{
  
	public
	function run($socket,$data){
	
		$user=$this->checklogin($data->cookie);
		if(!$user)return false;
		$id=self::getindex($socket);
		$insert['clientid']=$id;
		$insert['uid']=$user['uid'];
		$insert['addtime']=time();
		$insert['data']='wxpay_'.date('ymdH');
		$insert['other']='mobile';
		$insert['desc']='微信手机支付';
		T('event')->add($insert);
		
		return true;

	}




}

?>
