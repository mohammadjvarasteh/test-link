<?php


namespace lib\Helper;


trait QueryBuilder
{
    private $query;
    private $params = [];

    public function __construct()
    {
        $this->query = '';
    }

    // SELECT query
    public function select($columns = '*', $table)
    {
        $this->query = 'SELECT ' . $columns . ' FROM ' . $table;
        return $this;
    }

    // WHERE clause
    public function where($condition, $params = [])
    {
        $this->query .= ' WHERE ' . $condition;
        $this->params = array_merge($this->params, $params);
        return $this;
    }

    // JOIN clause
    public function join($table, $condition, $type = 'INNER')
    {
        $this->query .= ' ' . strtoupper($type) . ' JOIN ' . $table . ' ON ' . $condition;
        return $this;
    }

    // INSERT query
    public function insert($table, $data)
    {
        $columns = implode(", ", array_keys($data));
        $placeholders = implode(", ", array_fill(0, count($data), "?"));
        $this->query = 'INSERT INTO ' . $table . ' (' . $columns . ') VALUES (' . $placeholders . ')';
        $this->params = array_values($data);
        return $this;
    }

    // UPDATE query
    public function update($table, $data)
    {
        $set = '';
        foreach ($data as $column => $value) {
            $set .= $column . ' = ?, ';
        }
        $set = rtrim($set, ', ');
        $this->query = 'UPDATE ' . $table . ' SET ' . $set;
        return $this;
    }

    // DELETE query
    public function delete($table)
    {
        $this->query = 'DELETE FROM ' . $table;
        return $this;
    }

    // Get the final query
    public function getQuery()
    {
        return $this->query;
    }

    // Get parameters for prepared statements
    public function getParams()
    {
        return $this->params;
    }

    public function orderBy($column, $direction = 'ASC')
    {
        if (empty($this->query)) 
        {
            throw new \Exception("No query started. Use select() or another method first.");
        }
    
        // Add to ORDER BY clause
        $query = ' ORDER BY ' . $column . ' ' . strtoupper($direction);
        if (strpos($this->query, 'ORDER BY') != false)
        {
            $query = ', ' . $column . ' ' . strtoupper($direction);
        } 

        $this->query .= $query;


        return $this;
    }
    

    // Execute query
    public function execute($db)
    {
        $stmt = $db->prepare($this->getQuery());
        return $stmt->execute($this->getParams());
    }
}