<?php


namespace ng169\model\index;
use ng169\Y;
use ng169\tool\Out;
use ng169\cache\Rediscache;
use ng169\tool\Request;


checktop();

class user extends Y{
	private $tokeindex=':ng169tk_';
	private $userindex=':ng169user_';
//	private $tkend_time='604800‬';//token有效时间7天
	private $tkend_time='3672000';//token有效时间7天
	private $time = 0;
	private $end_time = 0;
	public function fbisuser($fbid){
		$user=T('user')->get_one(['openid'=>$fbid]);
		if($user)return $user;
		return false;
	}
	public function newfbuser($fbid,$fb_user_info,$pid){
		$insert=[
			'openid'=>$fbid,
			'regtime'=>time(),
			'regip'=>@$_SERVER['REMOTE_ADDR'],
			'headimg'=>$fb_user_info->getPicture()->getUrl(),
			'pid'=>$pid,
			'indate'=>date('Ymd'),
			'flag'=>2,
			'username'=>$fb_user_info['name'],
			'countryid'=>parent::$wrap_city,
		];
		$uid=T('user')->add($insert);
		$inlog=['mobiletype'=>strtolower($this->head['ostype']),'ip'=>Request::getip(),'indate'=>date("Ymd")];
		T('installlog')->add($inlog);
		
		return $uid;
	}
	private function getredisindex($uid){
		return $this->tokeindex.$uid;
	}
	private function newtoken($uid){
		if(!$uid)return false;
		//获取前台传来的用户账号
		$this->time = time();
		$this->end_time = $this->time+intval($this->tkend_time);
		$info = $uid. '.' .$this->time.'.'.$this->end_time.rand(1000,9999);//设置token过期时间为一天
		$token = hash_hmac('md5',$info,'ng169');
		$insert=['token'=>$token,'uid'=>$uid,'time'=>$this->time,'endtime'=>$this->end_time,'ip'=>@$_SERVER['REMOTE_ADDR']];
		T('token')->del(['uid'=>$uid]);
		T('token')->add($insert);
		$redis=Rediscache::getRedis();
		$index=$this->getredisindex($uid);
		$redis->set($index,$token,intval($this->tkend_time));
		return $token;
	}
	public function gettoken($uid){
		$redis=Rediscache::getRedis();
		$index=$this->getredisindex($uid);
		$tk=$redis->get($index);
		if($tk)return $tk;
		//生成新token
		$tk=$this->newtoken($uid);
		return $tk;
	
	}
	public function checktoken($uid,$token){
		if(!$uid)return false;
		if(!$token)return false;
		$redis=Rediscache::getRedis();
		$index=$this->getredisindex($uid);
		$tk=$redis->get($index);
		/*d($uid);*/
		if($tk && $token==$tk){
			return true;
		}
		Out::jerror('token过期',null,2);
		return false;	
	}
	public function getuser($uid){
		if(!$uid)return false;
		$redis=Rediscache::getRedis();
		$index=$this->userindex.$uid;
		$user=$redis->get($index);
		if($user)return json_decode($user,1);
		$user=T('user')->get_one(['uid'=>$uid]);
		$redis->set($index,json_encode($user),intval($this->tkend_time));
		return 	$user;
	}	
	public function delusercache($uid){
		if(!$uid)return false;
		$redis=Rediscache::getRedis();
		$index=$this->userindex.$uid;
		return $redis->del($index); 	
	}	
}

?>
