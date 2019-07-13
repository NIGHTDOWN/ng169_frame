<?php

namespace ng169\model\admin;
use ng169\Y;
use ng169\tool\Curl;



checktop();
class paypal extends Y{
	private $token;
	private $clientid;
	private $secret;
	
	private $json_body;
	private $batch_header;
	private $item=[];
	private $id=[];
	private $payid;
	private $curl;
	private $apiContext;
	private $payouts;
	private $senderBatchHeader;
	private $senderItem1;
	
	public function init($payid){
		im(API.'/paypal/autoload.php');
		$config=include(CONF.'paypal.inc.php');
		$config['main']['cache.FileName']=DATA.'/cache/'.$config['main']['cache.FileName'];
		/*	$basic=base64_encode($config['main']['ClientID'] . ":" . $config['main']['ClientSecret']);
		$curl = curl_init();

		curl_setopt_array($curl, array(
		CURLOPT_URL => $this->tk_url,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_SSL_VERIFYHOST => false,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "POST",
		CURLOPT_POSTFIELDS => "grant_type=client_credentials",
		CURLOPT_HTTPHEADER => array(
		'accept: application/json',
		'accept-language: en_US',
		'authorization: basic '.$basic,
		'content-type: application/x-www-form-urlencoded'
		),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);
		
		if($err){
		error("cURL Error #:" . $err);
		} else{
		d(json_decode($response,1)); 
		}
		*/
	
		
		$this->apiContext = new \PayPal\Rest\ApiContext(
			new \PayPal\Auth\OAuthTokenCredential(
				$config['main']['ClientID'], $config['main']['ClientSecret']    // ClientID
				// ClientSecret
			)
		);
		$this->apiContext->setConfig($config['main']);

		$credential=$this->apiContext->getCredential();
		
		$this->token=$credential->getAccessToken($this->apiContext->getConfig());
		
		$this->payouts = new \PayPal\Api\Payout();
		$this->senderBatchHeader = new \PayPal\Api\PayoutSenderBatchHeader();
		$this->payid = $payid;
		
		$this->senderBatchHeader->setSenderBatchId($this->payid)->setEmailSubject("You have a payment for".Y::$conf['site_name']);
		$this->payouts->setSenderBatchHeader($this->senderBatchHeader);//设置头参数
		return $this;
	}
	
	public function pay(){

		$request = clone $this->payouts;	
		
		try{
			$output = $this->payouts->create(null, $this->apiContext);
		} catch(\Exception $ex){   
			$msg=json_decode($ex->getData(),1);
			
			$detail=$msg['details'];
			foreach($detail as $key=>$val){
				$i=$val['field'];
				
				
				$da=preg_match('/items\[(\d+?)\]\.*/', $i,$match);
				
				if($da  && isset($this->id[$match[1]])){
					
					T('withdraw')->update(['status'=>2,'admindesc'=>$val['issue'],'soleid'=>$this->item[$match[1]]],['id'=>$this->id[$match[1]]]);	
				}
				
			}
			
			
			error($msg['name']);
		}	

		$link=$output->getLinks();
		
		foreach($link as $key=>$val){

			$href=$val->getHref();
			$up['admindesc']=$href;
			$up['status']=1;
			$up['soleid']=$this->item[$key];
			T('withdraw')->update($up,['id'=>$this->id[$key]]);	
		}

		return true;
		
	
	}
	
	public function urlpay(){
		$curl = curl_init();

		curl_setopt_array($curl, array(
				CURLOPT_URL => "https://api.sandbox.paypal.com/v1/payments/payouts",
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_ENCODING => "",
				CURLOPT_MAXREDIRS => 10,
				CURLOPT_TIMEOUT => 30,
				CURLOPT_SSL_VERIFYPEER => false,
				CURLOPT_SSL_VERIFYHOST => false,
				CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				CURLOPT_CUSTOMREQUEST => "POST",
				CURLOPT_POSTFIELDS => '{
				"sender_batch_header": {
				"email_subject": "You have a payment",
				"sender_batch_id": '.uniqid().'
				},
				"items": [
				{
				"recipient_type": "PHONE",
				"amount": {
				"value": "1.00",
				"currency": "USD"
				},
				"receiver": "3",
				"note": "Payouts sample transaction",
				"sender_item_id": "'.uniqid().'"
				},
				{
				"recipient_type": "EMAIL",
				"amount": {
				"value": "1.00",
				"currency": "USD"
				},
				"receiver": "ps-rec@paypal.com",
				"note": "Payouts sample transaction",
				"sender_item_id": "'.uniqid().'"
				},
				{
				"recipient_type": "PAYPAL_ID",
				"amount": {
				"value": "1.00",
				"currency": "USD"
				},
				"receiver": "FSMRBANCV8PSG",
				"note": "Payouts sample transaction",
				"sender_item_id": "'.uniqid().'"
				}
				]
				}',
				CURLOPT_HTTPHEADER => array(
					'accept: application/json',
					'authorization: Bearer A21AAFs8i2wmhvGM6CWzvH5Lm-lRfDiRHOHoIT1zM1_AsazpTrtJTI4zpxJQbWvaBaH2NRJ35BrCuLRYrcCnsp5GoKZGc7GdQ',
					'content-type: application/json'
				),
			));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if($err){
			echo "cURL Error #:" . $err;
		} else{
			echo $response;
		}
	}
	/**
	* 获取用户账号类型
	* @param undefined $receiver
	* 
	* @return
	*/
	public function get_recipient_type($receiver){
		if(!preg_match('/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/', $receiver)){
			return 'PHONE';
		}
		return 'EMAIL';
	}
	public function additem($receiver,$amount,$currency,$note,$payid){
		
		$sender_item_id=$this->payid.$payid;
		$data= array(
			"recipient_type" => $this->get_recipient_type($receiver),
			"receiver" => $receiver,
			"note" => $note,
			"sender_item_id" => $sender_item_id,
			"amount" => array(
				"value" => $amount,
				"currency" => $currency
			));
		
		$item=new \PayPal\Api\PayoutItem($data);
		array_push($this->id,$payid);
		array_push($this->item,$sender_item_id);

		$this->payouts->addItem($item);

	}
	public function check($payid){
		/*$this->init($payid);
		$curl = curl_init();
		$payid='EVPQVBGEQG9H2';
		curl_setopt_array($curl, array(
		CURLOPT_URL => "https://api.paypal.com/v1/payments/payouts/".$payid,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_SSL_VERIFYHOST => false,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => array(
		'authorization: Bearer '.$this->token,
		'content-type: application/json'
		),
		));
		
		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if($err){
		echo "cURL Error #:" . $err;
		} else{
		
		d(json_decode($response,1),1);
		}*/
		$data=T('withdraw')->get_one(['id'=>$payid]);
		if($data){
		error('数据不存在');	
		}
		if($data['status']==2){
		error($data['admindesc']);	
		}
		
		
		$this->init(0);
		$payoutBatchId=$data['soleid'];
		 
		 
		$output = \PayPal\Api\Payout::get($payoutBatchId, $this->apiContext);
		d($output);
	}
	
}
?>
