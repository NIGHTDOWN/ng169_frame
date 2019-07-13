<?php


namespace ng169\control\admin;

use ng169\control\adminbase;

checktop();
class domian extends adminbase
{
  
	public function control_run(){
		$c=D_MEDTHOD;	$a=D_FUNC;
		$model=T('domian')->order_by(array('s'=>'down','f'=>'id'));        
		$this->init_like(['domian']);  
		$model=$this->init_where($model);  
		$model=$this->init_order($model);     
		$page=$this->make_page($model);  	
		
		$data= $model->set_limit($this->get_page_limit())->get_all(); 	
		$var_array=array('domian'=>$data,'page'=>$page);
		
		$this->view(null,$var_array);
	}

	public function control_add(){
		$c=D_MEDTHOD;	$a=D_FUNC;
		$var_array=[];        
		if($_POST){
			$insert=get(array('string'=>array('domian'=>'1','flag'=>1,'lock','ip'=>1)));
			$w=['domian'=>$insert['domian']];
			if(T('domian')->get_one($w)){
				error('域名存在');
			}
			$insert['addtime']=time();
			$f=T('domian')->add($insert);
			if($f)out('添加成功',geturl(null,null,'domian','admin'));
			error('添加失败');
		}
		$this->view('',$var_array);       
	}
   
	public function control_del(){
		$c=D_MEDTHOD;	$a=D_FUNC;
		$model=T('domian');
		$f=$insert=get(array('array'=>array('id'=>1)));
		$model->del($insert);
		if($f)out('删除成功');
		error('删除失败');
	}
	public function control_edit(){
		$c=D_MEDTHOD;	$a=D_FUNC;     
		$model=T('domian');
		$where=get(array('int'=>array('id')));
		if($_POST){
			$f=$insert=get(array('string'=>array('domian'=>1,'lock','flag'=>1,'ip'=>1)));
			$model->update($insert,$where);
			if($f)out('修改成功');
			error('修改失败');
		}else{
			$info=$model->get_one($where);
			if(!$info){
				error('ID丢失');
			}
		}
		$this->view('',['domian'=>$info]);
       
	}
}

?>
