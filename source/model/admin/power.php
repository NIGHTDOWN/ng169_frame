<?php
namespace ng169\model\admin;
use ng169\Y;
checktop();
class power  extends Y{
	public function listall($m='admin'){
		$ar=load_mod($m);
		
		return $ar;
	}
	public function listmy($m='admin'){
		if(Y::$wrap_admin['super']){
			return $this->listall();
		}
		$roles=T('admins_roles')->get_one(array('roleid'=>Y::$wrap_admin['roleids']));
		if($roles){
			$power=$roles['profiles'];
			$power=explode(',',$power);
			return $power;
		}
		return true;
	}
	public function check($power){
		if(Y::$wrap_admin['super']){
			return $power;
		}
		return 	array_intersect($power,$this->listmy());
	}
	public function checkuser($power=null){
	
		if($power=='1+1')return true;
		if(!$power)return true;
		if(Y::$wrap_admin['super']){
			return true;
		}
		
		$index='role'.Y::$wrap_admin['adminid'];
		list($bool,$list)=Y::$cache->get($index);
		
		
		if($bool){
			$list=json_decode($list,1);
		}
		else{
			$arrey=$this->listall();
		
			if(!$power){
		
				$power=D_MEDTHOD.'+'.D_FUNC;
				if(!$arrey[D_MEDTHOD]['alias'])return true;
				if(!$arrey[D_MEDTHOD]['action'][D_FUNC]['alias'])return true;
			}
			$list=explode(',',Y::$wrap_admin['profiles']);
			Y::$cache->set($index,json_encode($list));
		}
		

		if(!in_array($power,$list))return false;
		return true;
	}
	/*public function checkuid($array){
	
	d($array);
	if($array['power']=='1+1')return true;
		
	$arrey=$this->listall();
	if(!$array['power']){
		
	$power=D_MEDTHOD.'+'.D_FUNC;
	if(!$arrey[D_MEDTHOD]['alias'])return true;
	if(!$arrey[D_MEDTHOD]['action'][D_FUNC]['alias'])return true;
	}
	$profiles=T('admins_roles')->get_one(array('roleid'=>$array['$array']));
	if(!$profiles)return false;
	$list=explode(',',$profiles['profiles']);
	if(!in_array($power,$list))return false;
	return true;
	}*/



}

?>