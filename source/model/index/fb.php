<?php


namespace ng169\model\index;
use ng169\Y;
use ng169\tool\Out;


checktop();

class fb extends Y{
	
	private $fbconf='';
	private $fbobj='';
	private function init(){
		//加载facebook类库
		im(API.'/Facebook/autoload.php');
		//开启session
		if(!session_id()){ 
			session_start(); 
		}
		$this->fbconf=include(CONF.'facebook.inc.php');
		$this->fbobj = new \Facebook\Facebook([
				'app_id' => $this->fbconf['main']['app_id'], // Replace {app-id} with your app id
				'app_secret' => $this->fbconf['main']['app_secret'],
				'default_graph_version' => 'v3.2',
			]);
			
	}
	
	
	//获取facebook链接
	public function geturl(){
		$this->init();
		$helper = $this->fbobj->getRedirectLoginHelper();
		$permissions = ['email']; // Optional permissions
		$loginUrl = $helper->getLoginUrl($this->fbconf['main']['LoginUrl'], $permissions); 	
		return $loginUrl;
	}
	//获取facebook token
	public function getfbtoken(){
		$this->init();
		$helper = $this->fbobj->getRedirectLoginHelper();

		try{

			$accessToken = $helper->getAccessToken();
	
		} catch(\Facebook\Exceptions\FacebookResponseException $e){
			
			Out::jerror('Graph returned an error: ' . $e->getMessage());
		} catch(\Facebook\Exceptions\FacebookSDKException $e){
			
			Out::jerror('Facebook SDK returned an error: ' . $e->getMessage());
		}

		if(! isset($accessToken)){
			if($helper->getError()){
				
				$str='';
				$str.= "Error: " . $helper->getError() . "\n";
				$str.= "Error Code: " . $helper->getErrorCode() . "\n";
				$str.= "Error Reason: " . $helper->getErrorReason() . "\n";
				$str.= "Error Description: " . $helper->getErrorDescription() . "\n";
				Out::jerror($str);
			} else{
			
				Out::jerror('Bad request');
			}
			exit;
		}

		
		return $accessToken->getValue();
		
		
		
	}
	//获取facebook 用户信息
	public function getinfo($token){
		$this->init();
		
		try{
			// Returns a `Facebook\FacebookResponse` object
			
			$response = $this->fbobj->get('/me?fields=id,name,email,age_range,first_name,last_name,birthday,link,gender,locale,picture,timezone,updated_time,verified', $token);
			
		} catch(\Facebook\Exceptions\FacebookResponseException $e){
			Out::jerror('Graph returned an error: ' . $e->getMessage());
			
		} catch(\Facebook\Exceptions\FacebookSDKException $e){
			Out::jerror('Graph returned an error: ' . $e->getMessage());
			
		}
		$userinfo = $response->getGraphUser();//用户资料
//		$userinfo->getName();
		$fbuid=$userinfo['id'];//用户id
		return $userinfo;
		/*d($userinfo);*/
		/*if(!M('user','im')->fbisuser($fbuid)){
			//注册用户
			M('user','im')->newfbuser($fbuid,$userinfo);
		}*/
	}
	
	
	
	
}

?>
