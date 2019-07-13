<?php


namespace ng169\model\admin;
use ng169\Y;


checktop();
class coin extends Y{
	private $ctype=[
		'1'=>'阅读',2=>'转发',3=>'邀请好友',4=>'好友3天任务',5=>'好友10天任务',6=>'佣金',7=>'兑换现金',8=>'系统','9'=>'新人奖励',10=>'每日分润'
	];
	public function add($uid,$coin,$ctype,$desc){
		if(!$uid)return false;
		$coinold=$this->getcoin($uid);
		if($coin>0){
			$type=0;
			$up['intotal']=$coinold['intotal']+$coin;
			if($ctype==1 || $ctype==2){
				//记录任务金币记录
			$this->addtaskcoin($uid,$coin);
			
			}
		}else{
			$type=1;
		}
		
		$insert=[
			'uid'=>$uid,
			'addtime'=>time(),
			'coin'=>(int)$coin,
			'desc'=>$desc,
			'type'=>$type,
			'ctype'=>$ctype,
			'oldcoin'=>$coinold['coin'],
			'adddate'=>date('Ymd'),
			'adminid'=>@parent::$wrap_admin['adminid'],
		];
		
		$now=$coinold['coin']+$coin;
		if($now<0)return false;
		if(T('coinlog')->add($insert)){
			
			$up['coin']=$now;
			
			return T('user')->update($up,['uid'=>$uid]);
		}
		return false;
	}
	private function addtaskcoin($uid,$coin){
		$data=T('user')->set_field('taskcoin')->get_one(['uid'=>$uid]);
		$taskcoin=$data['taskcoin']+$coin;
		//触发成长任务
		if($taskcoin>0){
			M('task','am')->tk($uid);
		}
		if($taskcoin>=Y::$conf['coin_2']){
			M('task','am')->tk1($uid);
		}
		if($taskcoin>=Y::$conf['coin_3']){
			M('task','am')->tk2($uid);
		}
		
		return T('user')->update(['taskcoin'=>$taskcoin],['uid'=>$uid]);
	}
	public function getcoin($uid){
		if(!$uid)return false;
		$data=T('user')->set_field('coin,intotal')->get_one(['uid'=>$uid]);
		return $data;
	}
	public function getlog($uid){
		/*if(!$uid)return false;*/
		$data=T('coinlog')->order_by(['s'=>'down','f'=>'addtime'])->get_all(['uid'=>$uid]);
		return $data;
	}
	public function gettype(){
		
		
		return $this->ctype;
	}
	/**
	* 获取用户昨天总收益
	* @param undefined $uid
	* 
	* @return
	*/
	public function getlastdaycount($uid){
		$last=date('Ymd',strtotime('last day'));
		$data=T('coinlog')->set_field('sum(coin) as total')->get_one(['uid'=>$uid,'type'=>0,'adddate'=>$last]);
		return $data['total'];
	}
}
?>
