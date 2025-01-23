<?php

namespace lib\Controller;

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use lib\Controller\BaseController;
use lib\Helper\QueryBuilder;




 class TestCaseSortedController extends BaseController
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
        parent::__construct();
    }

    public function sort(Request $request, Response $response, $args)
    {
        $query = $this->select('*', 'tcversions tc')
        ->join('executions ex', 'tc.id = ex.testcase_id', 'INNER') 
        ->orderBy('tc.importance','DESC')
        ->orderBy('ex.execution_ts', 'DESC')
        ->getQuery();
        
        $result = $this->db->exec_query($query);
        $result = $this->db->fetch_all($result);
        $response->getBody()->write(json_encode(['message' =>  $result]));
        return $response->withHeader('Content-Type', 'application/json');
    }
 }
