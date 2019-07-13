<?php
/**
* 本服务接收两个参数  IP 端口   
* 列子 ：php opsock 192.168.1.1 8080
*/
/*
header('Access-Control-Allow-Origin:*'); 
// 响应类型 
header('Access-Control-Allow-Methods:POST'); 
// 响应头设置 
header('Access-Control-Allow-Headers:x-requested-with,content-type');*/


define('ROOT',dirname(__FILE__).'/');
#相对URL路径

if(!defined('PATH_URL'))define('PATH_URL','/');

require_once ROOT.'source/core/enter.php';
use \ng169\lib;
function udpGet($sendMsg = '', $ip = '103.115.66.149', $port = '53'){
    $handle = stream_socket_client("udp://{$ip}:{$port}", $errno, $errstr);
    if( !$handle ){
        die("ERROR: {$errno} - {$errstr}\n");
    }

    $sendMsg='87490100000100000000000003676d6106616c6963646e03636f6d0000010001';
    $sendMsg=hex2bin($sendMsg);
    fwrite($handle, $sendMsg);
    $result = fread($handle, 1024);
    fclose($handle);
    return $result;
}
 
$result = udpGet('Hello World');
echo $result;




?>
