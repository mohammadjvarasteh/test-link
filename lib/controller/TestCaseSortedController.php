<?php

namespace lib\Controller;

use Slim\Psr7\Request;
use Slim\Psr7\Response;



 class TestCaseSortedController
 {
    private $db;
    private static $instance = null;

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

    }

    public function sort(Request $request, Response $response, $args)
    {
        $response->getBody()->write(json_encode(['message' => 'test api']));
        return $response->withHeader('Content-Type', 'application/json');
    }
 }
