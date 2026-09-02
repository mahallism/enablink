<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Aquery {
    public $data = array();
    public $result = array();
    public $meta_data = array();

    function __construct()
    {
        $this->CI =& get_instance();
    }

    public function prepar($data)
    {
        $this->data = $data;
        $this->result = $data;
        return $this;
    }
    
    public function gets(){
        return $this->result;
    }

    public function set_meta_data($meta_key, &$meta_data){
        $this->meta_data[$meta_key] =& $meta_data;
        return $this;
    }

    public function add_column($column, $query = false)
    {
        $this->result = array_map(function($item) use ($column, $query){
            if (is_array($column)) {
                foreach ($column as $key => $query) {
                    // echo '$item["' . $key . '"] = ' . $query . ';';
                    eval('$item["' . $key . '"] = ' . $query . ';');
                }
            }else{
                eval('$item["' . $column . '"] = ' . $query . ';');
            }
            return $item;
        }, $this->data);
        return $this;
    }
}