<?php



namespace ng169\sock\system;
use ng169\sock\systemSock;
use ng169\Y;
use ng169\lib\Log;
use ng169\tool\File;

checktop();

class udp extends systemSock{
	private $frame='';
	private $TTL='0000003c';//秒,转16进制；补0
	private static $dnsserver='8.8.8.8';//中继dns服务器
	private static $alltozj=false;//全部中继
	private static $log=false;//全部中继
	public static $dnslist=false;//全部中继
	private $request=[
		'id'=>'',//标识ID 2byte
		'QR'=>'',//查询/响应标志，0为查询，1为响应（1bit）
		'opcode'=>'',//（4bit）0表示标准查询，1表示反向查询，2表示服务器状态请求
		'AA'=>'',//（1bit）表示授权回答
		'TC'=>'',//（1bit）表示可截断的
		'RD'=>'',//（1bit）表示期望递归
		'RA'=>'',//（1bit）表示可用递归
		'zero'=>'',//（3bit）3位保留
		'rcode'=>'',//（4bit）表示返回码，0表示没有差错，3表示名字差错，2表示服务器错误（Server Failure）
		'Questions'=>'',//查询总数
		'Answer'=>'',//回答总数
		'Authority'=>'',//权威记录
		'Additional'=>'',//额外记录
		'Queries'=>'',//请求内容主体
		'Answers'=>'',//回复内容主体
	];
	private $Queries=[
		'domainhex'=>'',
		'domain'=>'',
		'domainpre'=>'',
		'type'=>'',
		'class'=>'',
	];
	
	private $ret='';
	private $peer='';
	private $Answers=[];
	public static function  init_udp($socket,$data){
		$obj=new self();
		self::$alltozj=Y::$conf['zj'];
		self::$dnsserver=Y::$conf['dnsserver'];
		self::$log=Y::$conf['log'];
		
		
		$obj->run($socket,$data);
	}
	public 
	function  run($socket,$data){
		$this->frame=$data;
		$this->peer=$socket;
		$this->decode($data);//报文解码
		$this->query();//查询
		$this->answer();
		
	}
	private function decode($data){
		$hex=bin2hex($data);
		
		$this->request['id']=substr($hex,0,4);
		$aim=substr($hex,4,4);
		$aim=hexdec($aim);
		$aim=$this->decto_bin($aim,2);
		$this->request['QR']=substr($aim,0,1);
		$this->request['opcode']=substr($aim,1,4);
		$this->request['AA']=substr($aim,5,1);
		$this->request['TC']=substr($aim,6,1);
		$this->request['RD']=substr($aim,7,1);
		$this->request['RA']=substr($aim,8,1);
		$this->request['zero']=substr($aim,9,3);
		$this->request['rcode']=substr($aim,12,4);
		$this->request['Questions']=substr($hex,8,4);
		$this->request['Answer']=substr($hex,12,4);
		$this->request['Authority']=substr($hex,16,4);
		$this->request['Additional']=substr($hex,20,4);
		$this->request['Queries']=substr($hex,24);
		$this->Queries['Queries']=$this->request['Queries'];
		$this->Queries['domainhex']=substr($this->request['Queries'],0,strlen($this->request['Queries'])-8);
		
		$this->Queries['domainpre']=substr($this->Queries['domainhex'],0,2);
		$this->Queries['domainhex']=substr($this->Queries['domainhex'],2);
		//这里查询域名列表00分割
		$len=strlen($this->Queries['domainhex']);
		$dhex=$this->Queries['domainhex'];
		$step=(int)$len/2;
		$points=['01','02','03','04','05','06','07','08','09'];//点号
		$dlist=[];
		$domain='';
		for($i = 0; $i < $len; $i=$i+2){
			$byte=substr($dhex,$i,2);
			if($byte!='00'){
				if(in_array($byte,$points)){
					$byte='2e';
				}
				$domain.=$byte;
			}else{
				if($domain){
					array_push($dlist,hex2bin($domain));
					
					$domain='';
				}
				
			}
			
		}
		$this->Queries['domain']=$dlist;
		$this->Queries['type']=substr($this->request['Queries'],-8,4);
		$this->Queries['class']=substr($this->request['Queries'],-4);
		return true;
	}
	//解码
	//有数据回复无数据转发请求，在回复
	//10进制转其他进制
	private function decto_bin($datalist,$bin){
		static $arr=array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F');
		if($bin==10)return $datalist; //相同进制忽略
		$bytelen=ceil(16/$bin); //获得如果是$bin进制，一个字节的长度
		
		$num=$datalist;
		$t="";
		$num=intval($num);
		
		while($num>0){
			$t=$arr[$num%$bin].$t;
			$num=floor($num/$bin);
		}
		$tlen=strlen($t);
		if($tlen%$bytelen!=0){
			$pad_len=$bytelen-$tlen%$bytelen;
			$t=str_pad("",$pad_len,"0",STR_PAD_LEFT).$t; //不足一个字节长度，自动前面补充0
		}
		
		return $t;
	} 
	private function bin_todec($datalist,$bin){
		static $arr=array('0'=>0,'1'=>1,'2'=>2,'3'=>3,'4'=>4,'5'=>5,'6'=>6,'7'=>7,'8'=>8,'9'=>9,'A'=>10,'B'=>11,'C'=>12,'D'=>13,'E'=>14,'F'=>15);
		
		if($bin==10)return $datalist; //为10进制不转换
		$aOutData=array(); //定义输出保存数组
		
		$num=$datalist;
		$atnum=str_split($num); //将字符串分割为单个字符数组
		$atlen=count($atnum);
		$total=0;
		$i=1;
		foreach($atnum as $tv){
			$tv=strtoupper($tv);
             
			if(array_key_exists($tv,$arr)){
				if($arr[$tv]==0)continue;
				$total=$total+$arr[$tv]*pow($bin,$atlen-$i);
			}
			$i++;
		}
		
		return $total;
	}
	//查询
	private function query(){
		if(self::$alltozj){
			return $this->zj();
		}
		$this->Answers=[];
		foreach($this->Queries['domain'] as $k=>$domain){
			$ret['domain']=$domain;
	//		$ret['ip']=$this->querydomain($domain);
//			$ret['ip']='192.168.6.69';
			if(isset(self::$dnslist[$domain])){
				$data['ip']=self::$dnslist[$domain];
				$data['domian']=$domain;
				$data['flag']=0;
			}else{
				$data=T('domian')->get_one(['domian'=>$domain]);
			}
			
			if(!$data){
				//无记录就转发
			return $this->zj();	
			}
			if($data['flag']==1){
				$ret['ip']='127.0.0.1';//禁用就为空
			}
			$ret['ip']=$data['ip'];
			array_push($this->Answers,$ret);
		}	
		if(sizeof($this->Answers)>1){
			return $this->zj();
		}
		$this->request['QR']=1;
		$this->request['RA']=1;
		$this->request['RD']=1;
		$this->request['Answer']='0001';
		//内容主体
		$ans='';
		foreach($this->Answers as $domian){
		$ansframe=[];
		$ansframe['pyl']='c00c';//默认头偏移量
		$ansframe['type']=$this->Queries['type'];
		$ansframe['class']=$this->Queries['class'];
		$ansframe['timetolive']=$this->TTL;
		
		$ips=explode('.',$domian['ip']);
		$hexip='';
		foreach($ips as $ip){
			$ip=dechex($ip);
			$hexip.=str_pad($ip,2,'0',STR_PAD_LEFT);
		}
		$ansframe['data']=($hexip);
		$ansframe['length']=str_pad(dechex(sizeof($ips)),4,'0',STR_PAD_LEFT);
		
		$ans.=$ansframe['pyl'].$ansframe['type'].$ansframe['class'].$ansframe['timetolive'].$ansframe['length'].$ansframe['data'];
		}
		
		$aim=$this->request['QR'].$this->request['opcode'].$this->request['AA'].$this->request['TC'].$this->request['RD'].$this->request['RA'].$this->request['zero'].$this->request['rcode'];
	
		$aim=base_convert($aim, 2, 16);
		
		$ret=$this->request['id'].$aim.$this->request['Questions'].$this->request['Answer'].$this->request['Authority'].$this->request['Additional'].$this->request['Queries'].$ans;
		$this->ret=hex2bin($ret);
		return $ret;
	}
	//这里需要重写
	private function querydomain($domain){
		return gethostbyname($domain);
	}
	//中继
	private function zj(){
		$data=$this->udpGet($this->frame,self::$dnsserver);
		$this->ret=$data;
		return $data;
	}
	private function udpGet($sendMsg = '', $ip = '8.8.8.8', $port = '53'){
    $handle = stream_socket_client("udp://{$ip}:{$port}", $errno, $errstr); 
    if( !$handle ){
        d("ERROR: {$errno} - {$errstr}\n");
    }
    fwrite($handle, $sendMsg);
    $result = fread($handle, 1024);   
    fclose($handle);
    return $result;
}
	private function answer(){
		$ret=$this->ret;
		if(self::$log){
			Log::txt($this->peer."\n".implode('|',$this->Queries['domain']));
		}
		if($ret && $this->peer  ){
			$this->socksend(self::getindex($this->peer),$ret);
		}
		
	}
}

?>
