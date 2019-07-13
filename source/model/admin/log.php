<?php

namespace ng169\model\admin;
use ng169\Y;



checktop();

class log extends Y {
    private $db_name='admins_log';
    
    public function log($status,$where=null,$params=null,$userid=null,$info=null){
    	return false;
        $c=D_MEDTHOD;	$a=D_FUNC;
        if($userid==null){
            $userid=parent::$wrap_admin['adminid'];
        }
        $log_arr=array();
        if(is_array($where)){
            $where=serialize($where);
        }
        if(is_array($params)){
            $params=serialize($params);
        }
        if(is_array($info)){
            $info=serialize($info);
        }
        
        $log_arr['opuser']=$userid;
        $log_arr['addtime']=time();
        $log_arr['ip']=YRequest::getip();
        $log_arr['mod']=$c;
        $log_arr['action']=$a;
        $log_arr['status']=(bool)($status);
        $log_arr['update']=$params;
        $log_arr['where']=$where;
        $log_arr['info']=($info);
        $log_arr['url']="https://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
        return  T($this->db_name)->add($log_arr);
        
    }
    private  function Loginfo($db,$userid,$flag,$message){
  	    $c=D_MEDTHOD;	$a=D_FUNC;
  	     if(is_array($message)){
            $message=serialize($message);
        }
        $where=serialize($_POST);
        $log_arr=array();
        $log_arr['opuser']=$userid;
        $log_arr['addtime']=time();
        $log_arr['ip']=YRequest::getip();
        $log_arr['mod']=$c;
        $log_arr['action']=$a;
        $log_arr['status']=(bool)($flag);
        $log_arr['update']=base64_encode(serialize($_SERVER));
        $log_arr['where']=base64_encode($where);
        $log_arr['info']=($message);
        $area=M('ip','am')->getaddress($log_arr['ip']);
        $log_arr['area']=($area?$area:'未知地址');
        $log_arr['url']="https://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
        return  T($db)->add($log_arr);
  }
public function logtxt($message,$flag=true){
	$m=D_GROUP;
	if($m=='admin'){
		$db='admins_log';
		$userid=parent::$wrap_admin['adminid'];
	}else{
		$db='users_log';
		 $userid=parent::$wrap_user['uid'];
	}
	return $this->Loginfo($db,$userid,$flag,$message);
}
}
?>
