<?php


namespace ng169\model\admin;
use ng169\Y;
checktop();
class options extends Y
{

  private $mod = null;
  private function  _load()
  {
    $this->mod = T('options')->order_by(array('f'=>array('htmltype','orders'),'s'=>'up'));
  }
  public function get_siteinfo()
  {
    $this->_load();

    $info = $this->mod->get_all(array('identify'=>
        'siteset','flag'    =>0));

    return $info;
  }
  public function get_order()
  {
    $this->_load();

    $info = $this->mod->get_all(array('identify'=>
        'order','flag'    =>0));

    return $info;
  }
  public function get_seoset()
  {
    $this->_load();
    $info = $this->mod->get_all(array('identify'=>
        'seo','flag'    =>0));

    return $info;
  }
  public function get_withdraw()
  {
    $this->_load();

    $info = $this->mod->order_by(array('f' => array('v.orders')))->get_all(array('identify'=>
        'withdraw','flag'    =>0));

    return $info;
  }
  public function get_smsset()
  {
    $this->_load();

    $info = $this->mod->order_by(array('f' => array('v.orders')))->get_all(array('identify'=>
        '4','flag'    =>0));

    return $info;
  }
  public function get_mailset()
  {
    $this->_load();

    $info = $this->mod->order_by(array('f' => array('v.orders')))->get_all(array('identify'=>
        '5','flag'    =>0));

    return $info;
  }
  public function get_upset()
  {
    $this->_load();

    $info = $this->mod->order_by(array('f' => array('v.orders')))->get_all(array('identify'=>
        'upset','flag'    =>0));

    return $info;
  }
  public function save()
  {
    $this->_load();
    $table = $this->mod;
    $ar    = Y::$dao->t('options',array('optionname','htmltype'))->s(0);
    $b = array();
    $img = array();
   
    foreach ($ar as $key => $v) {
      array_push($b, $v['optionname']);
    }
    $get = G(array('string'=> $b))->get();
    /*foreach ($get as $key => $value) {
      if (!$key) {
        break;
      }
      
      $where = array('optionname'=> $key);
      $bool = $table->get_one($where);
      if ($bool) {

        $bool = $table->updata(array('v' => array('optionvalue'=> $value),'w'=> $where));

      }
      else {

        $bool = $table->add(array('optionvalue'=> $value,'optionname' => $key));

      }
    }*/
   foreach($_POST as $k=>$v){
   	
   	if(in_array($k,$b)){
		$get=get(array('string'=>array($k)));
		$where = array('optionname'=> $k);
		$up=array('optionvalue'=> $get[$k]);

		$bool = $table->updata(array('v' => $up,'w'=> $where));
		
	}
   }

    upcache();

    return true;
  }


}
?>
