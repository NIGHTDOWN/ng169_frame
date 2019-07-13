<?php


namespace ng169\tool;

checktop();
class Code{

    
	private $width = 62;
    
	private $height = 20;
    
	private $mykey = 'NG9RDOEMARRYDFCFUV99K98Q7';

    
	private function getRndom(){
		srand((double)microtime() * 1000000);
		while(($authnum = rand() % 100000) < 10000);
		session_start();
		$_SESSION['verfitycode'] = $authnum;
		return $authnum;
	}
	public function getCode(){
		Header("Content-type: image/PNG");
		$im = imagecreate($this->width, $this->height); 
		$black = imagecolorallocate($im, 0, 0, 0); 
		$white = imagecolorallocate($im, 255, 255, 255);
		$gray = imagecolorallocate($im, 200, 200, 200);
		imagefill($im, 0, 0, $gray); 
		$authnum = $this->getRndom();
		imagestring($im, 5, 10, 3, $authnum, $black);
        
        
		for($i = 0; $i < 200; $i++){
			$randcolor = imagecolorallocate($im, rand(0, 255), rand(0, 255), rand(0, 255));
			imagesetpixel($im, rand() % 70, rand() % 30, $randcolor);
		}
		$a = imagepng($im);
		imagedestroy($im);
		return $a;
	}

    
	public function authCode($string, $operation = 'DECODE', $key = '', $expiry = 0){
		if($key == null){
			$key = AUTH_CODE_KEY;
		}
		$ckey_length = 4;
		$key = md5($key ? $key : $this->mykey);
		$keya = md5(substr($key, 0, 16));
		$keyb = md5(substr($key, 16, 16));
		$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) :
			substr(md5(microtime()), -$ckey_length)) : '';
		$cryptkey = $keya . md5($keya . $keyc);
		$key_length = strlen($cryptkey);
		$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) :
		sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb),
			0, 16) . $string;
		$string_length = strlen($string);
		$result = '';
		$box = range(0, 255);
		$rndkey = array();
		for($i = 0; $i <= 255; $i++){
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);
		}
		for($j = $i = 0; $i < 256; $i++){
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;
			$tmp = $box[$i];
			$box[$i] = $box[$j];
			$box[$j] = $tmp;
		}
		for($a = $j = $i = 0; $i < $string_length; $i++){
			$a = ($a + 1) % 256;
			$j = ($j + $box[$a]) % 256;
			$tmp = $box[$a];
			$box[$a] = $box[$j];
			$box[$j] = $tmp;
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}
		if($operation == 'DECODE'){
			if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) &&
				substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)){
             
				return substr($result, 26);
			}else{
				return '';
			}
		}else{
			return $keyc . str_replace('=', '', base64_encode($result));
		}
	}
	//ase 128加密
	public static function encode($str,$key){
		/*$str=Bytes::getBytes($str);*/
		if(!$key)return $str;
		$cipher = "DES-ECB";
		$ivlen = openssl_cipher_iv_length($cipher);
		$iv = openssl_random_pseudo_bytes($ivlen);
		$ciphertext = openssl_encrypt($str, $cipher, $key, $options=0);
		/*d($ciphertext);
		$ciphertext=gzencode($ciphertext);*/	
		return $ciphertext;
	}	
	//ase 128解密
	public static function decode($str,$key){
		//		$str=gzdecode($str);
		if(!$key)return $str;
		$cipher = "DES-ECB";
		$ivlen = openssl_cipher_iv_length($cipher);
		$iv = openssl_random_pseudo_bytes($ivlen);
		$original_plaintext = openssl_decrypt($str, $cipher, $key, $options=0);
		return $original_plaintext;
	}
	 	
}

?>
