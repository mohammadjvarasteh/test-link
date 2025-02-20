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
        $data = json_decode(file_get_contents("php://input"), true)['data'];
        $column = $data['typeFilter'] == 'priority' ? 'tc.importance' : 'ex.execution_ts';
        $query = $this->selectDistinct('tc.id', 'tcversions tc')
        ->join('executions ex', 'tc.id = ex.tcversion_id', 'LEFT') 
        ->orderBy($column,$data['arrangement'])
        ->getQuery();
        
        $result = $this->db->exec_query($query);
        $result = $this->db->fetch_all($result);

        $response->getBody()->write(json_encode(['data' =>  $result, 'status' => true ]));
        return $response->withHeader('Content-Type', 'application/json');
    }
 }
