<?php
namespace ng169\model\index;
use ng169\Y;
use ng169\tool\Request as YRequest;
checktop();

class vlog extends Y
{
    private $db = "visit_log";
    private function get_os()
    {
        $agent = $_SERVER['HTTP_USER_AGENT'];
        $os = false;

        if (stripos($agent, 'win') > 0 && stripos($agent, 'nt 6.0') > 0) {
            $os = 'Windows Vista';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, 'nt 6.1') > 0) {
            $os = 'Windows 7';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, 'nt 6.2') > 0) {
            $os = 'Windows 8';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, 'nt 5.1') > 0) {
            $os = 'Windows XP';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, 'nt 5') > 0) {
            $os = 'Windows 2000';
        } else if (stripos($agent, 'linux') > 0) {
            $os = 'Linux';
        } else if (stripos($agent, 'unix') > 0) {
            $os = 'Unix';
        } else if (stripos($agent, 'sun') > 0 && stripos($agent, 'os') > 0) {
            $os = 'SunOS';
        } else if (stripos($agent, 'ibm') > 0 && stripos($agent, 'os') > 0) {
            $os = 'IBM OS/2';
        } else if (stripos($agent, 'Mac') > 0 && stripos($agent, 'PC') > 0) {
            $os = 'Macintosh';
        } else if (stripos($agent, 'PowerPC') > 0) {
            $os = 'PowerPC';
        } else if (stripos($agent, 'FreeBSD') > 0) {
            $os = 'FreeBSD';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, '95') > 0) {
            $os = 'Windows 95';
        } else if (stripos($agent, 'win 9x') > 0 && stripos($agent, '4.90') > 0) {
            $os = 'Windows ME';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, '98') > 0) {
            $os = 'Windows 98';
        } else if (stripos($agent, 'win') > 0 && stripos($agent, '32') > 0) {
            $os = 'Windows 32';
        } else if (stripos($agent, 'iPhone') > 0) {
            preg_match("/CPU ([^)]+) like Mac OS X/", $agent, $matches);
            $os = isset($matches[1]) ? $matches[1] : 'iPhone';
        } else if (stripos($agent, 'iPad') > 0) {
            $os = 'iPad';
        } else if (stripos($agent, 'Mac OS') > 0) {
            $os = 'Mac OS';
        } else if (stripos($agent, 'Android') > 0) {
            $os = 'Android';
        } else {
            $os = 'unknown';
        }
        return $os;
    }
    private function get_client_browser($glue = null)
    {
        $browser = array();
        $agent = $_SERVER['HTTP_USER_AGENT']; //获取客户端信息
        /* 定义浏览器特性正则表达式 */
        $regex = array(
            'ie' => '/(MSIE) (\d+\.\d)/',
            'chrome' => '/(Chrome)\/(\d+\.\d+)/',
            'firefox' => '/(Firefox)\/(\d+\.\d+)/',
            'opera' => '/(Opera)\/(\d+\.\d+)/',
            'safari' => '/Version\/(\d+\.\d+\.\d) (Safari)/',
        );
        foreach ($regex as $type => $reg) {
            preg_match($reg, $agent, $data);
            if (!empty($data) && is_array($data)) {
                $browser = $type === 'safari' ? array($data[2], $data[1]) : array($data[1], $data[2]);
                break;
            }
        }
        $data = empty($browser) ? false : (is_null($glue) ? $browser : implode($glue, $browser));
        if (is_array($data)) {
            return json_encode($data);
        }

        return $data;
    }

//通过pid获取商户id
    public function getpromuid($pid)
    {
        $id = T('product')->set_field('muid')->set_where(array('productid' => $pid), '=')->get_one();
        return $id['muid'];
    }

    public function log($uid, $muid, $pid)
    {
       
       
        $insert['uid'] = $uid;
        $insert['a'] = D_FUNC;
        $insert['c'] = D_MEDTHOD;
        $insert['g'] = D_GROUP;
        $insert['muid'] = $muid;
        $insert['usertype'] = $this->get_os();
        $insert['browtype'] = $this->get_client_browser();
        $insert['date'] = date('Ymd');
        $insert['addtime'] = time();
        $insert['ip'] = YRequest::getip();

        // $insert['address'] = M('ip', 'am')->getaddress($insert['ip']);
        $insert['postinfo'] = json_encode(YRequest::getPost());
        $insert['getinfo'] = json_encode(YRequest::getGet());
        $insert['serverinfo'] = json_encode(YRequest::getService());
        $insert['soururl'] = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '';
        $insert['url'] = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
       
        $logid = T($this->db)->add($insert);
        return $logid;

    }
//获得页面停留时间
    public function settime($logid,$type)
    {
        $where=array('logid'=>$logid);
     $log=T($this->db)->get_one($where);
     
     if(!$log)return false;
    
     if($log['lktime'])return false;
    
     $up['lktime']=time();
     $up['outtype']=$type;
     $up['intime']=$up['lktime']- $log['addtime'];

     if($up['intime']>0){
         T($this->db)->update( $up,$where);
         return true;
     }
     return false;
    }

}
