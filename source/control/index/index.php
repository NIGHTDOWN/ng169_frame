<?php
namespace ng169\control\index;
use ng169\control\indexbase;
use ng169\tool\Url as YUrl;
use ng169\service\Output;
use ng169\cache\Rediscache;
use ng169\tool\Out;
use ng169\Y;
checktop();
class index extends indexbase{

	protected $noNeedLogin = ['*'];
	
	public function control_run(){
		$url=geturl('','run','login','admin');
		Out::redirect($url);
	}
}
?>
