<?php
 namespace ng169\model\admin;
use ng169\Y;

checktop();
  
class ip extends Y{
	private $db='ip';
	private $add=array('province'=>'','city'=>'');
	public function getip($ip){
		$info=$this->sqlinfo($ip);
		if(!$info)return $ip;
		return $info;
	}
	public function gethost($host){
		$ip=gethostbyname($ip);   
		return $this->getip($ip);	
	}
	public function getaddress($ip){
		$info=$this->getip($ip);
		if(is_array($info)){
			return $info['province'].$info['city'];}
		// else{
		// 	return $this->getsina($ip);
		// }
		return $info;
	}
	private function sqlinfo($ip){
		
		$sql="select  *  from ".DB_PREFIX.$this->db." where INET_ATON(\"{$ip}\") between INET_ATON(start_ip) and INET_ATON(end_ip)";
		$info= T($this->db)->get_one(null,null,$sql);
		/*d($info,1);*/
		if(!$info){
			$info= $this->getsina($ip);
		}
		
		if($info && $info['province_city']){
		$add=@implode('省',$info['province_city']);
		$this->add=array('province'=>$add[0],'city'=>$add[1]);
		}
		return $this->add;
		
	}
	
	public function getsina($ip){
       //加载延迟太高；丢弃
	return false;
		$url = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=' .$ip;
		$info = @file_get_contents($url);
		$info = json_decode($info);
	
		$this->add=array('province'=>$info->province,'city'=>$info->city);
		$insert['start_ip']=$ip;
		$insert['end_ip']=$ip;
		$insert['province_city']=$info->province;
		$insert['area']=$info->province.$info->city;

		T('ip')->add($insert);
		return $this->add;
	}
} 
?>
