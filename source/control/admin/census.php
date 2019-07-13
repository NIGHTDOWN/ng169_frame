<?php


namespace ng169\control\admin;

use ng169\control\adminbase;

checktop();
class census extends adminbase{
  
	public function control_run(){
		$c=D_MEDTHOD;	$a=D_FUNC;
		$get=get(['string'=>['year','mouth']]);
		
		if($get['year']=='')$get['year']=date('Y');
		if($get['mouth']=='')$get['mouth']=date('m');
		$haveday=$this->daysInmonth($get['year'],$get['mouth']);
		$list=[];
		
		for($i = 1; $i<=$haveday ; $i++){
			if($i<10){
				$d=$get['year'].$get['mouth'].'0'.$i;
			}else{
				$d=$get['year'].$get['mouth'].$i;	
			}
			$listi=M('census','am')->getday($d);if($listi){
				$list[$i]=$listi;
			}
			
		}
		
		
		$this->view(null,['data'=>$list]);
		
	}

	
	private function daysInmonth($year='',$month=''){ 
		if(empty($year)) $year = date('Y'); 
		if(empty($month)) $month = date('m'); 
		if(in_array($month, array(1, 3, 5, 7, 8, '01', '03', '05', '07', '08', 10, 12))){   
			$text = '31';        //月大 
		}elseif($month == 2 || $month == '02'){   
			if( ($year % 400 == 0) || ( ($year % 4 == 0) && ($year % 100 !== 0) ) ){   //判断是否是闰年   
				$text = '29';        //闰年2月 
			} else{   
				$text = '28';        //平年2月 
			}   
		} else{   
			$text = '30';            //月小 
		} 
     
		return $text; 
	} 

}

?>
