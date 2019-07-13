<?php


namespace ng169\control\admin;

use ng169\control\adminbase;

checktop();
class articlecategory extends adminbase
{
    private $db_name = 'article_category';
    private $key='catid';
    private $allkey=array(
        'int'=>array('elite','flag','parentid','orders'),
         'string'=>array('alias','catname'=>1,'detailtpl','indextpl','listtpl','metadesc','metakeyword','metatitle'),
	
	);
    public function control_run()
    {
        $c=D_MEDTHOD;	$a=D_FUNC;
        
        $model=T($this->db_name);
     	
        $data= $model->get_child($this->key);
        $page='';
	    $var_array=array($c=>$data,'page'=>$page);
        $this->view(null,$var_array);
    }
    public function control_add_view(){
        $c=D_MEDTHOD;	$a=D_FUNC;
        
        $where=G(array('int'=>array($this->key)))->get();
        
        $var_array=(array('select'=>$where));
        
        $this->view(null,$var_array); 
    }
    public function control_show()
    {
        $c=D_MEDTHOD;	$a=D_FUNC;
        
        $where=G(array('int'=>array($this->key=>1)))->get();
        
        $mod=T($this->db_name);
        
        
        $data=$mod->get_one($where);
        
        if(!$data){
            YOut::page404();
        }
        
        M('log','am')->log($data,$where);
        
        
        
        $var_array=array($c=>$data);
        $this->view(null,$var_array);

    }
    public function control_add()
    {
        
        $mod=T($this->db_name);
        $insert=G($this->allkey)->get();
        if($insert['parentid']){
            $depth=array($this->key=>$insert['parentid']);
            $depth=$mod->get_tree_depth($insert['parentid'],$this->key);
            $insert['depth']=$depth+1;
            
        }else{
            $insert['depth']='1';
        }
        
        
        $more=array('addtime'=>time(),'creatid'=>$this->get_adminid());
        $insert=array_merge($insert,$more);
        
        $flag=$mod->add($insert);
        
        M('log','am')->log($flag,null,$insert);
        
        
        if($flag){
            upcache($this->db_name);
            out('添加成功');
        }else{
            out('添加失败',null,0);
        }
    }
    public function control_save()
    {
        
        $mod=T($this->db_name);
        $tmp=T($this->db_name)->set_field(array('catid','depth','catname'));
        
        
        $where=G(array('int'=>array($this->key=>1)))->get();
        
        
        
        $insert=G($this->allkey)->get();
      
        
        
        
        if($insert['parentid']){
            $depth=array($this->key=>$insert['parentid']);
            $depth=$tmp->set_field(array('depth'))->get_one($depth);
            $insert['depth']=$depth['depth']+1;
          
        }else{
            $insert['parentid']=0;
            $insert['depth']='1';
        }
        $mod->change_tree($where[$this->key],$insert['parentid'],$this->key);
        
        
        
        $flag=$mod->updata(array('v'=>$insert,'w'=>$where));
        
        M('log','am')->log($flag,null,$insert);
        
        
        if($flag){
            upcache($this->db_name);
            out('保存成功');
        }else{
            out('保存失败',null,0);
        }
    }
    public function control_del()
    {
        $w = array($this->key => 1);
        $where = G(array('array' => $w))->get();
        if (sizeof($where) == 0) {
            $where = G(array('int' => $w))->get();
        }
        $where[$this->key]=T($this->db_name)->get_all_tree_id($where[$this->key]);
        $model = T($this->db_name)->del($where,'in');
       
        upcache($this->db_name);
    
        out('删除成功',null,$model);
    }      
}
?>
