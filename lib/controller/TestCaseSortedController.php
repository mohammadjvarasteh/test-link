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
        $query = $this->select('*', 'tcversions')
        ->orderBy('importance','DESC')
        ->getQuery();

        $res = $this->db->exec_query($query);
        $res = $this->db->fetch_all($res);
        $response->getBody()->write(json_encode(['message' =>  $res]));
        return $response->withHeader('Content-Type', 'application/json');
    }
 }
