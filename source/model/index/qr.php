<?php


namespace ng169\model\index;
use ng169\Y;
use ng169\tool\Image as YImage;


checktop();

class qr extends Y
{

    public function get($url)
    { 
     return   YImage::qr($url);
    }


}

?>
