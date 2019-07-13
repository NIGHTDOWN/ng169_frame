<?php



namespace ng169\control;
use ng169\control\general;
use ng169\Y;
use ng169\TPL;
use ng169\tool\Out as YOut;
use ng169\tool\Out;
use ng169\tool\Request as YRequest;
use ng169\tool\Cookie as YCookie;
use ng169\tool\Url as YUrl;
use ng169\service\Input ;
use ng169\lib\Lang ;
use ng169\cache\Rediscache ;
checktop();
im(CONTROL.'public/night.php');
class apibase extends general{
	private $pagesize = 15;
	public $tpl_path = 'tpl/api/';
	public $head= '';
	public $redis= '';
	public $countryid= '';
	protected $noNeedLogin = [];//默认全部要登入
	public function _getuserid(){
		$userid = parent::$wrap_user['uid'];
		if($userid == null){
            
		}
		return $userid;
	}  
	public function __construct(){

		$c=D_MEDTHOD;	$a=D_FUNC;
		$this->init_head();
		$this->init_country();//初始化国家
		$this->redis=Rediscache::getRedis();
		if(!in_array('*',$this->noNeedLogin)){
			
			if(!in_array($a,$this->noNeedLogin)){
			
				$login = $this->checkLogin(); 
			}  
		}  
		$var_array = array(
			'user'  => parent::$wrap_user,
			'time'  => time(),
			'indextpl'=>PATH_URL.$this->tpl_path,
			'realindextpl'=>ROOT.$this->tpl_path,
		);
		TPL::assign($var_array);
	}
	private function init_head(){
		$data=getallheaders();
    	
		//    	$key=['mobileos','mobiletype','ip','appversion','language','token'];
		$key=array_keys($data);
		$ret=new Input(array('string'=>$key),[],$data);
		$this->head=$ret->get();
		foreach($this->head as $i=>$v){
			$this->head[strtolower($i)]=$v;
		}
	}
	private function init_country(){
		
		$lang=strtolower(@$this->head['language']);
		/*$lang='En';
		$lang=strtolower($lang);
		d($lang);*/
		if($lang){
			$country=T('country')->get_one(['alias'=>$lang,'flag'=>0]);
			if($country){
				$this->countryid=$country['countryid'];
				parent::$wrap_city=$country['countryid'];
			}			
		}
		Lang::init($lang);
		Lang::load();
		return false;
	}
    
	public function checkLogin(){
		$get=get(array(['string'=>['token'],'int'=>['uid']]));
		$token=@$this->head['token'];
		$uid=@$this->head['uid'];
		if(M('user','im')->checktoken($uid,$token)){
			$wrap_user=M('user','im')->getuser($uid);
			
			if(!$wrap_user)Out::jerror('用户不存在');
			
			if($wrap_user['flag']==1){
				Out::jerror('用户被锁定，请联系管理员');
			}
			Y::$wrap_user=$wrap_user;
			return true;	
		}
		Out::jerror('请重新获取登入令牌');

	}
	public function webLogin(){
		$get=get(['string'=>['token'],'int'=>['uid']]);
		$token=$get['token'];
		$uid=$get['uid'];
		if(M('user','im')->checktoken($uid,$token)){
			$wrap_user=M('user','im')->getuser($uid);
			
			if(!$wrap_user)Out::jerror('用户不存在');
			
			if($wrap_user['flag']==1){
				Out::jerror('用户被锁定，请联系管理员');
			}
			Y::$wrap_user=$wrap_user;
			return true;	
		}
		Out::jerror('请重新获取登入令牌');

	}
	public function isvip(){
		$vip=parent::$wrap_user['vip'];
		if(!$vip){
			Out::jerror('未开通过VIP');
		}
		$viptime=parent::$wrap_user['viptime'];
		if($viptime<time()){
			T('user')->update(['vip'=>0],['uid'=>$this->get_userid()]);
			Out::jerror('VIP已经到期，请续费');
		}
	}
  
}

?>
