<?php


namespace ng169\model\admin;
use ng169\Y;
use ng169\tool\Request;


checktop();
class task extends Y{
	
	private $data='';
	private $time='';
	private $taskinfo='';
	//每次1000条入队列
	//邀新任务
	/**
	* 
	* @param undefined $uid 子用户
	* 
	* @return
	*/
	public function tk($uid){
		/*	被邀请者完成以下操作：下载--登入--阅读或分享获得金币。
		邀请者+500金币=0.5元，被邀请者+800金币=0.8元*/
		if(!$uid)return false;
		$isdo=$this->isdo($uid,1);
		if(!$isdo){
			$user=T('user')->set_field('taskcoin,coin,pid,username')->get_one(['uid'=>$uid,'flag'=>0]);	
			if(!$user)return false;
			if($user['taskcoin']>0){
				$coin1=Y::$conf['coin_1']*100;
				$coin2=Y::$conf['coin_parent_1']*100;
				M('coin','am')->add($uid,$coin1,9,'下载--登入--阅读或分享获得金币');	
				M('coin','am')->add($user['pid'],$coin2,3,$user['uid']);
				$time=time();
				$day2=intval(Y::$conf['coin_time_2'])*G_DAY+$time;
				$day3=intval(Y::$conf['coin_time_3'])*G_DAY+$time;
				return T('usertask')->update(['task1'=>1,'task1time'=>$time,'task2time'=>$day2,'task3time'=>$day3],['uid'=>$uid]);
			}
		}
		return false;
	}
	//任务1 3天任务
	public function tk1($uid){
		if(!$uid)return false;
		$isdo=$this->isdo($uid,2);
		if(!$isdo){
			$time=$this->taskinfo['task2time'];
			$now=time();
			if($now>$time){
				T('usertask')->update(['task2'=>2],['uid'=>$uid]);
			}
			
			$user=T('user')->set_field('taskcoin,coin,pid,username')->get_one(['uid'=>$uid,'flag'=>0]);	
			if(!$user)return false;
			$coin1=Y::$conf['coin_2']*100;
			$coin2=Y::$conf['coin_parent_2']*100;
			if($user['taskcoin']>$coin1){	
				M('coin','am')->add($user['pid'],$coin2,4,$user['uid']);
				return T('usertask')->update(['task2'=>1],['uid'=>$uid]);
			}
		}
		return false;
	}
	//任务2 10天任务 
	public function tk2($uid){
		if(!$uid)return false;
		$isdo=$this->isdo($uid,3);
		if(!$isdo){
			$time=$this->taskinfo['task3time'];
			$now=time();
			if($now>$time){
				T('usertask')->update(['task3'=>2],['uid'=>$uid]);
			}
			$user=T('user')->set_field('taskcoin,coin,pid,username')->get_one(['uid'=>$uid,'flag'=>0]);	
			if(!$user)return false;
			$coin1=Y::$conf['coin_3']*100;
			$coin2=Y::$conf['coin_parent_3']*100;
			if($user['taskcoin']>$coin1){	
				M('coin','am')->add($user['pid'],$coin2,4,$user['uid']);
				return T('usertask')->update(['task3'=>1],['uid'=>$uid]);
			}
		}
		return false;
	}
	//任务3 每日分润
	public function tk3($uid){
		if(!$uid)return false;
		$isdo=$this->isdo($uid,4);
		if(!$isdo){
			$count=M('coin','am')->getlastdaycount($uid);
			
			if(!$count){
				T('usertask')->update(['task4'=>2,'task4date'=>date('Ymd'),'task4lock'=>0],['uid'=>$uid]);
				return false;
			}
			$rate=intval(Y::$conf['coin_parent_rate']);
			$coin=$rate*$count/100;
			$user=T('user')->set_field('taskcoin,coin,pid,username')->get_one(['uid'=>$uid,'flag'=>0]);	
			if(!$user)return false;
			if(!$user['pid'])return false;
			M('coin','am')->add($user['pid'],$coin,10,$user['uid']);
			return T('usertask')->update(['task4'=>1,'task4date'=>date('Ymd'),'task4lock'=>0],['uid'=>$uid]);
		}
		return false;
	}
	/**
	* 判断用户是否已经执行该任务
	* @param undefined $uid
	* @param undefined $taskid
	* 
	* @return
	*/
	private function isdo($uid,$taskid){
		if(!$uid)return true;
		$in=T('usertask')->get_one(['uid'=>$uid]);
		if(!$in){
			
			T('usertask')->add(['uid'=>$uid,'addtime'=>time()]);
			return false;
		}
		$this->taskinfo=$in;
		switch($taskid){
			case 1:
			if($in['task1'])return true;
			return false;
			break;
			case 2:
			if($in['task2'])return true;
			return false;
			break;
			case 3:
			if($in['task3'])return true;
			return false;
			break;
			case 4:
			if($in['task4'] && $in['task4date']==date('Ymd'))return true;
			return false;
			break;
		}
		return true;
		
	} 
	//创建阅读记录
	public function create_read($uid,$articleid,$sid){
		$time=time();
		if($uid && $uid!=0){
			$where=['uid'=>$uid,'articleid'=>$articleid];
			$read=T('selfread')->get_one($where);
			if(!$read){
				
				T('selfread')->add($where);
			}
			if($read['num']){
				return false;//奖励次数超过上限，直接不奖励
			}
			$endtime=$time+Y::$conf['self_read_time']*60;	
		}else{
		$endtime=$time+Y::$conf['share_read_time']*60;	
		}
		
		$insert=[
			'articleid'=>$articleid,
			'uid'=>$uid,
			'sid'=>$sid,
			'addtime'=>$time,
			'endtime'=>$endtime,
			'adddate'=>date('Ymd'),
			
			'ip'=>Request::getip(),
		];
		return T('readlog')->add($insert);
	}
	public function check_read($readid){
		if(!$readid)return 2;//id空
		$data=T('readlog')->get_one(['logid'=>$readid,'flag'=>0]);
		
		if(!$data)return 3;//记录不存在或者已经结束
		
		if(Request::getip()!=$data['ip'])return 4;//ip跟记录不相同
		
		if($data['endtime']>time())return 5;//没到达阅读时间长度
		
		if($data['uid']){
			//自己阅读
			if($data['uid']!=parent::$wrap_user['uid'])return 6;//uid不是这个用户的
			$this->endselfread($data['uid'],$readid,$data['articleid']);
			
		}else{
			//匿名用户阅读
			
			$this->endanonymousread($data['sid'],$readid);
		}
		
		
		return 1;
	}
	private function endselfread($uid,$readid,$articleid){
		$up=['readloog'=>time(),'flag'=>1];
		$bool=T('readlog')->update($up,['logid'=>$readid,'uid'=>$uid]);
		if($bool){
			$where=['uid'=>$uid,'articleid'=>$articleid];
			$read=T('selfread')->get_one($where);
			if($read['num']>=Y::$conf['aword_num'])return false;
			T('selfread')->update(['num'=>$read['num']+1],$where);
			$article=T('article')->set_field('coin')->get_one(['articleid'=>$articleid]);
			if($article['coin']){
			$coin=$article['coin']*100	;
			}else{
			$coin=Y::$conf['self_read_coin']*100;
			}
			return M('coin','am')->add($uid,$coin*100,1,'阅读任务');
		}
		
		return true;
	}
	private function endanonymousread($sid,$readid){
		//同一个ip只有一次机会
		/*$up=['readloog'=>time(),'flag'=>1];
		$bool=T('readlog')->update($up,['logid'=>$readid]);*/
		$where=['logid'=>$readid];
		$where=['flag'=>0];
		$data=T('readlog')->get_one($where);
		if(!$data)return false;
		$share_article=T('share_article')->get_one(['sid'=>$sid]);
		if(!$share_article)return false;
		$if['shareuid']=$share_article['uid'];
		$if['articleid']=$share_article['articleid'];
		$if['readip']=Request::getip();
		if(!T('anonread')->get_one($if)){
			$up=['readloog'=>time(),'flag'=>1];
			$bool=T('readlog')->update($up,['logid'=>$readid]);
			if($bool){
				T('share_article')->update(['hit'=>$share_article['hit']+1],['sid'=>$sid]);
				T('anonread')->add($if);
				M('coin','am')->add($share_article['uid'],Y::$conf['share_read_coin']*100,2,'分享阅读');
			}
		}
		return true;
		
	}
}
?>
