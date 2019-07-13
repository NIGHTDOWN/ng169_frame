<?php


namespace ng169\model\index;
use ng169\Y;
use ng169\tool\Image as YImage;


checktop();

class domain extends Y{

	public function get(){ 
//		'order by rand() limit 1'
		$thisdomain=$_SERVER['SERVER_NAME'];
		$data= T('domian')->order_by(['s'=>'down','f'=>'rand()'])->set_where(['flag'=>1])->get_one();
		if($data['domian']==$thisdomain)return $this->get();
		return $data['domian'];
	}


}

?>
