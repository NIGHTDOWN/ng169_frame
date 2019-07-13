<?php


namespace ng169\model\admin;
use ng169\Y;


checktop();
class census extends Y{
	private $ctype=[
		'1'=>'阅读',2=>'转发',3=>'邀请好友',4=>'好友3天任务',5=>'好友10天任务',6=>'佣金',7=>'兑换现金',8=>'系统','9'=>'新人奖励',10=>'每日分润'
	];
	public function getday($day){
		
		if($day>=date("Ymd")){
			return false;
		}
		if($data=T('day_coin')->get_one(['indate'=>$day])){
			return $data;
		}
		$count['install']=	T('installlog')->get_count(['indate'=>$day]);
		$count['reg']=T('user')->get_count(['indate'=>$day]);
		$count['sharereg']=	T('user')->set_where('indate='.$day.' and pid!=0')->get_count();
		$count['newsread']=	T('articlelog')->get_count(['indate'=>$day]);
		$count['newsreads']=T('readlog')->get_count(['adddate'=>$day,'flag'=>1]);	
		$count['rate']=$count['newsreads']==0?0:$count['newsreads']/	$count['newsreads'];
		$count['zfnum']=T('share_article')->get_count(['date'=>$day]);
		$count['zfreadnum']=T('readlog')->get_count(['adddate'=>$day,'uid'=>0]);
		$count['zfreads']=T('readlog')->get_count(['adddate'=>$day,'uid'=>0,'flag'=>1]);
		$count['zfreadrate']=$count['zfreadnum']==0?0:$count['zfreads']/	$count['zfreadnum'];
		$count['taskcoin']=	T('coinlog')->set_where("adddate=$day and ctype in (1,2)")->set_field("sum(coin) as tol")->get_one();
		$count['taskcoin']=$count['taskcoin']['tol'];
		$count['regcoin']=	T('coinlog')->set_where("adddate=$day and ctype =9")->set_field("sum(coin) as tol")->get_one();
		$count['regcoin']=$count['regcoin']['tol'];
		$count['txcoin']=	T('coinlog')->set_where("adddate=$day and type=1")->set_field("sum(coin) as tol")->get_one();
		$count['txcoin']=$count['txcoin']['tol'];
		$count['indate']=$day;
		$count['inmouth']=date("Ym",strtotime($day));
		T('day_coin')->add($count);
		return $count;
	}
	public function getmouth($mouth){
		if($mouth>=date("Ym")){
			return false;
		}
		if($data=T('mouth_coin')->get_one(['inmouth'=>$mouth])){
			return $data;
		}
		$count['install']=	T('installlog')->get_count(['indate'=>$day]);
		$count['reg']=T('user')->get_count(['indate'=>$day]);
		$count['sharereg']=	T('user')->set_where('indate='.$day.' and pid!=0')->get_count();
		$count['newsread']=	T('articlelog')->get_count(['indate'=>$day]);
		$count['newsreads']=T('readlog')->get_count(['adddate'=>$day,'flag'=>1]);	
		$count['rate']=$count['newsreads']==0?0:$count['newsreads']/	$count['newsreads']*100;
		$count['zfnum']=T('share_article')->get_count(['date'=>$day]);
		$count['zfreadnum']=T('readlog')->get_count(['adddate'=>$day,'uid'=>0]);
		$count['zfreads']=T('readlog')->get_count(['adddate'=>$day,'uid'=>0,'flag'=>1]);
		$count['zfreadrate']=$count['zfreadnum']==0?0:$count['zfreads']/	$count['zfreadnum']*100;
		$count['taskcoin']=	T('coinlog')->set_where("adddate=$day and ctype in (1,2)")->set_field("sum(coin) as tol")->get_one();
		$count['taskcoin']=$count['taskcoin']['tol'];
		$count['regcoin']=	T('coinlog')->set_where("adddate=$day and ctype =9")->set_field("sum(coin) as tol")->get_one();
		$count['regcoin']=$count['regcoin']['tol'];
		$count['txcoin']=	T('coinlog')->set_where("adddate=$day and type=1")->set_field("sum(coin) as tol")->get_one();
		$count['txcoin']=$count['txcoin']['tol'];
	/*	$count['indate']=$day;*/
		$count['inmouth']=$mouth;
		T('mouth_coin')->add($count);
		return $count;
	}
}
?>
