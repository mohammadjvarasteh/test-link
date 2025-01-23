<?php

namespace lib\Controller;

use lib\Helper\QueryBuilder;



 class BaseController
 {
    use QueryBuilder;
    protected $db;

    protected static $instance = null;
    public static function getInstance()
    {
        if(is_null(self::$instance))
        {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function __construct()
    {
        $this->db = new \database(DB_TYPE);
        $isConnected = (object)$this->db->connect(false,DB_HOST,DB_USER,DB_PASS,DB_NAME);
        if (!$isConnected->status) 
        {
            throw new \Exception($isConnected->dbms_msg);
        }
    }
 }