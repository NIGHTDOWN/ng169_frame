<?php
namespace ng169;

header('Access-Control-Allow-Origin:*'); 
// 响应类型 
header('Access-Control-Allow-Methods:POST'); 
// 响应头设置 
header('Access-Control-Allow-Headers:x-requested-with,content-type');
header('Access-Control-Allow-Headers:token,uid');
/*header('Access-Control-Allow-Headers:');*/
define('ROOT',__DIR__.'/');

if(!file_exists('lock.php')){
//	\ng169\tool\Out::redirect('/install.php');
	header("Location:/install.php");
}
require_once 'source/core/enter.php';
APP::run();
die();
?>
