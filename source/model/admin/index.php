<?php


namespace ng169\model\admin;
use ng169\Y;
use ng169\tool\Request as YRequest;


checktop();
class index extends Y {
    
    
    public function isFunc($funname) {
        if (!empty($funname)) {
            if (function_exists($funname)) {
                return '<font color="green">√</font>';
            }
            else {
                return '<font color="red">×</font>';
            }
        }
        else {
            return '<font color="red">函数错误</font>';
        }
    }
    
    
    public function getVar($varName) {
        switch ($result = get_cfg_var($varName)){
            case 0:
                return '<font color="red">×</font>';
                break;
            case 1:
                return '<font color="green">√</font>';
                break;
            default:
                return $result;
                break;
        }
    }

    
    public function getServerIP() {
        return $_SERVER['SERVER_ADDR'];
    }
    
    
    public function getClientIP() {
        return YRequest::getip();
    }
    
    
    public function getWebEngine() {
        return $_SERVER['SERVER_SOFTWARE'];
    }
    
    
    public function getOs() {
        $os = explode(' ', php_uname());
        return $os[0];
    }
    
    
    public function getPhpVersion() {
        return PHP_VERSION;
    }
    
    
    public function getGD() {
        if (function_exists('gd_info')) {
            $gd_info = @gd_info();
	        return $gd_info['GD Version'];
        }
        else {
            return "<font color='red'>×</font>";
        }
    }
     public function getSock() {
        if (extension_loaded('sockets')) {
	         return true;
        }
        else {
            return false;
        }
    }
     public function getSockflag() {
        if (extension_loaded('sockets')) {
        	
		$ip=$_SERVER['SERVER_ADDR']?$_SERVER['SERVER_ADDR']:$_SERVER['LOCAL_ADDR'];
		$port=DB_SOCKPOST;
	  	$bool=\ng169\lib\Socket::check_sock_open($ip,$port);
	         return $bool;
        }
        else {
            return false;
        }
    }
    public function doGetSysData() {
       
        $data = array(
            'serverip'=>$this->getServerIP(),
            'clientip'=>$this->getClientIP(),
            'os'=>$this->getOs(),
            'webengine'=>$this->getWebEngine(),
            'time'=>time(),
            'phpversion'=>$this->getPhpVersion(),
            'curl'=>$this->isFunc('curl_init'),
            'gd'=>$this->getGD(),
            'iconv'=>$this->isFunc('iconv'),
//            'sock'=>$this->getSock(),
            'urlopen'=>$this->getVar('allow_url_fopen'),
//            'sockflag'=>$this->getSockflag(),
            /*'ununum'=>$this->getuser_unchecknum(),
            'unmnum'=>$this->getmerchant_unchecknum(),
            'unpnum'=>$this->getproduct_unchecknum(),
            'ungnum'=>$this->getgroupon_unchecknum(),
            'unum'=>$this->getuser_num(),
            'shnum'=>$this->getdeal_shnum(),
            'tknum'=>$this->getdeal_tknum(),
            'txnum'=>$this->get_txnum(),
            'onum'=>$this->getorder_num(),
            'mnum'=>$this->getmerchant_num(),
            'pnum'=>$this->getproduct_num(),
            'osum'=>$this->getorder_sum(),*/
            
        );
        return $data;
    }
public function getuser_unchecknum(){
//	return T('user_rz')->get_count(array('ckflag'=>0));
}
public function getmerchant_unchecknum(){
//	return T('merchant_rz')->get_count(array('status'=>0));
}
public function getproduct_unchecknum(){
//	return T('product')->get_count(array('pflag'=>0));
}
public function getgroupon_unchecknum(){
//	return T('groupon')->get_count(array('gflag'=>0));
}
public function getdeal_tknum(){
//	return T('order_refund')->get_count(array('stype'=>0,'jr'=>array(0,1)));
}
public function getdeal_shnum(){
//	return T('order_refund')->get_count(array('stype'=>1,'jr'=>array(0,1)));
}
public function get_txnum(){
//	return T('withdraw')->get_count(array('status'=>0));
}
public function getuser_num(){
	
//	return T('user')->get_count();
}
public function getorder_num(){
//	return T('order')->get_count();
}
public function getmerchant_num(){
//	return T('merchant')->get_count();
}
public function getproduct_num(){
//	return T('product')->get_count();
}
public function getorder_sum(){
/*	$data= T('order')->set_field('sum(totals) as allm')->get_one();
	return $data['allm'];*/
}
}
?>
