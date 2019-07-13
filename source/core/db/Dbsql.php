<?php


namespace ng169\db;
use  \PDO;
use \ng169\Y;
class Dbsql
{
  var $querynum = 0;
  var $link;
  var $charset;
  public function __construct($dbhost, $dbuser, $dbpw, $dbname = '', $dbcharset =
    'utf8', $pconnect = 1, $halt = true)
  {
    $dsn = G_DB_TYPE.":host=$dbhost;dbname=$dbname;charset=$dbcharset";
    try {
     /* $this->link = new PDO($dsn, $dbuser, $dbpw,
        array(PDO::ATTR_PERSISTENT=> true)); */  
         $this->link = new PDO($dsn, $dbuser, $dbpw, array(
                                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                                PDO::ATTR_TIMEOUT => 3
                        ));     
    } catch (Exception $e) {
      error("Unable to connect: " . $e->getMessage());
    }
  }
  /**
  * 执行查询
  * @param string $sql
  * @return data
  */
  public function  query($sql,$cache = false,$time = 0)
  {
    try {
      if ($cache) {
        $index = md5($sql);
        $cache =&Y::$cache;
        list($bool,$data) = $cache->get($index);
        if ($bool)return $data;
      }

      $this->link->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      try{
      
	  	$pdostream = $this->link->query($sql);
	  } catch (\Error $e) {
	  	error($e->getMessage().'【'.$sql.'】');
	  	/*error($e);*/
	  }
      catch (\Exception $e) {
      	 	error($e->getMessage().'【'.$sql.'】');	  	
	  	/*error($e);*/
	  }
      $data      = $pdostream->fetchAll(PDO::FETCH_ASSOC);
      if ($cache) {
        $cache->set($index,$data);
      }
    } catch (\Exception $e) {
      error($e);
    }
    return $data;
  }
  /**
  * 执行查询
  * @param string $sql
  *
  * @return data
  */
  public function  getone($sql,$cache = false,$time = 0)
  {

    try {
      if ($cache) {
        $index = md5($sql);
        $cache =&Y::$cache;
        list($bool,$data) = $cache->get($index);
        if ($bool)return $data;
      }
      $this->link->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
      //      $this->link->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, 3);
      
      $pdostream = $this->link->query($sql);
      
      $pdostream->setFetchMode(PDO::FETCH_ASSOC);
      $data      = $pdostream->fetch();
      if ($cache) {
        //设置缓存
        $cache->set($index,$data);
      }


    } catch (\Exception $e) {

      error($e->getMessage().'【'.$sql.'】');
    }

    return $data;
  }
  /**
  * 执行删
  * @param string $sql
  *
  * @return int row受影响的行数
  */
  public function  exec($sql)
  {

    $this->starttransaction();
    try {
      $this->link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      
      $row = $this->link->exec($sql);
      /*if($row)*/
      // 提交事务
      $this->commit();
    } catch (\Exception $e) {
      $this->rollback();
      /*throw $e;*/
      error($e);
    }


    return $row;

  }
  /**
  * 执行增
  * @param string $sql
  *
  * @return int 插入的主键ID
  */
  public function  insert($sql)
  {

    $this->starttransaction();
    try {
      $this->link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $row = $this->link->exec($sql);
      $id  = $this->link->lastInsertId();
      /*if($row)*/
      // 提交事务
      $this->commit();
    } catch (\Exception $e) {
      $this->rollback();
      /*throw $e;*/
      error($e);
    }


    return $id;

  }
  /**
  * 开启事务
  *
  * @return void
  */
  public function starttransaction()
  {
    $this->link->beginTransaction();
  }
  /**
  * 提交事务
  *
  * @return void
  */
  public function commit()
  {
    $this->link->commit();
  }
  /**
  * 回滚事务
  *
  * @return void
  */
  public function rollback()
  {
    $this->link->rollback();
  }
}











?>
