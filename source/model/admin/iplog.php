<?php


namespace ng169\model\admin;
use ng169\Y;


checktop();
class iplog extends Y{
 
	public function log($uid,$ip=null,$type=0){
		if(!$uid)return false;
		$ip=$ip?$ip:$_SERVER['REMOTE_ADDR'];
		return   T('iplog')->add(array('uid'=>$uid,'ip'=>$ip,'type'=>$type,'addtime'=>$_SERVER['REQUEST_TIME']));
      
	}
	public function check(){
		//ip开关关闭正常
		$ip=$_SERVER['REMOTE_ADDR'];
		if(!Y::$conf['ip_lock'])return false;
		
	if($ip=='127.0.0.1' || $ip=='0.0.0.0')return false;
	   $adminwhere=array('ip'=>$ip,'type'=>1);
	   $info=T('iplog')->get_one($adminwhere);
	   if($info)return false;
	   $userwhere=array('ip'=>$ip,'type'=>0);
	   $info=T('iplog')->set_field('count(distinct uid) as num')->get_one($userwhere);
	   if($info['num']>2){
	   	error('当前ip登入存在问题；禁止登入');
	   }
	} 
}
?>
