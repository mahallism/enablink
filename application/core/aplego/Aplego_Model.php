<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Super Class Model/Master Class Model
 *
 * @author      Hayyi
 * @version 	1.0
 */
Class Aplego_Model extends CI_Model
{
	public $table_name 			= false;
	public $primary_key 		= false;
	protected $table_view_name 	= false;
	protected $timestamp 		= false;
	protected $created_at 		= false;
	protected $author			= false;
	protected $slug				= false; // just for create and update not create_bulk

	protected $result_array		= true;

	protected $meta_table		= array();

	protected $meta_triple_name	= false;
	protected $meta_triple		= array();

	protected $filter_field		= array();
	protected $search_field		= array(); // values = before after both

	protected $middleware		= array();

	public function __call($method, $param)
	{
		if (strpos($method, 'midd_') !== false) {
			$method = substr($method, 5);
			if (method_exists($this, $method)) {
				if (isset($middleware[$method])) {
					call_user_func_array(array($this, $middleware[$method]), array());
				}
				return call_user_func_array(array($this, $method), $param);
			}
		}else if (method_exists($this->db, $method)) {
			call_user_func_array(array($this->db, $method), $param);
			return $this;
		}
		log_message('error', "Method failed to run: {$method}");
		show_error("Method failed to run: {$method}");
	}

	public function create($data){
		if($this->timestamp || $this->created_at){
			$data['created_at'] = date('Y-m-d H:i:s');
		}
		if ($this->author) {
			$data[$this->author] = current_user_session('user_id');
		}
		if ($this->slug) {
			$data[$this->slug] = $this->get_slug($data);
		}
		$this->db->trans_start();
		$this->db->insert($this->table_name, $data);
		$insert_id = $this->db->insert_id();
		$this->db->trans_complete();
		return $insert_id;
	}

	public function create_bulk($data){
		if($this->timestamp || $this->created_at){
			$created_at = date('Y-m-d H:i:s');
		}
		if ($this->author) {
			$author = current_user_session('user_id');
		}
		for ($i=0; $i < count($data); $i++) {
			if($this->timestamp || $this->created_at){
				$data[$i]['created_at'] = $created_at;
			}
			if ($this->author) {
				$data[$i][$this->author] = $author;
			}
		}

		return $this->db->insert_batch($this->table_name, $data);
	}

	public function gets(){
		$this->db->from($this->table_name);
		$query = $this->db->get();
		return $this->result_array ? $query->result_array() : $query->result();
	}

	public function get($id = false){
		$this->db->from($this->table_name);
		if ($id) {
			$this->db->where(array($this->primary_key => $id));
		}
		$query = $this->db->get();
		if ($row = $query->row()) {
			return $this->result_array ? (array)$row : $row;
		}
		return false;
	}

	public function gets_view($view_name = false){
		$this->db->from($view_name ? $view_name : $this->table_view_name);
		$query = $this->db->get();
		return $this->result_array ? $query->result_array() : $query->result();
	}

	public function get_view($id = false, $view_name = false){
		$this->db->from($view_name ? $view_name : $this->table_view_name);
		$this->db->where(is_array($id) ? $id : array($this->primary_key => $id));
		$query = $this->db->get();
		if ($row = $query->row()) {
			return $this->result_array ? (array)$row : $row;
		}
		return false;
	}

	public function update($id, $data){
		$this->db->where(is_numeric($id) ? array($this->primary_key => $id) : $id);
		if($this->timestamp){
			$data['updated_at'] = date('Y-m-d H:i:s');
		}
		if ($this->slug) {
			$data[$this->slug] = $this->get_slug($data);
		}
		$this->db->update($this->table_name, $data);
		return $this->db->affected_rows();
	}

	public function delete($id){
		$this->db->where(is_numeric($id) ? array($this->primary_key => $id) : $id);
		$this->db->delete($this->table_name);
		return $this->db->affected_rows();
	}

	protected function get_slug($text, $no = false)
	{
		$temp_slug = trim($temp_slug);
		$temp_slug = preg_replace('~[^\pL\d]+~u', '-', $temp_slug);
		$temp_slug = iconv('utf-8', 'us-ascii//TRANSLIT', $temp_slug);
		$temp_slug = preg_replace('~[^-\w]+~', '', $temp_slug);
		$temp_slug = trim($temp_slug, '-');
		$temp_slug = preg_replace('~-+~', '-', $temp_slug);
		$temp_slug = strtolower($temp_slug);
		if (empty($temp_slug)) {
			$temp_slug = 'n-a';
		}
		$temp_slug = $temp_slug.($no? '-'.$no : '');
		if (!$this->check_isset($this->slug, $temp_slug)) {
			return $temp_slug;
		}else{
			if (!$no) {
				return $this->get_slug($text, 2);
			}else{
				return $this->get_slug($text, $no + 1);
			}
		}
	}

	public function check_isset($field, $value = false)
	{
		$this->db->where($value ? array($field => $value) : $field);
		return ($this->get_count() > 0 ? true : false);
	}

    protected function get_table($table_name = false)
    {
    	if ($table_name === false) {
    		$table_name = $this->table_name;
    	}else if ($table_name === true) {
    		$table_name = $this->table_view_name;
    	}
    	return $table_name;
    }

	public function get_count_all($table_name = false){
		return $this->db->count_all($this->get_table($table_name));
	}

	public function get_count($table_name = false){
		return $this->db->count_all_results($this->get_table($table_name));
	}

	public function get_error(){
		if ($error = $this->db->error()) {
			return $error;
		}
		return false;
	}

    public function filter_data($args = array())
    {
    	$filter = elements(array_keys($this->filter_field), array_keys($args));
    	foreach ($filter as $item) {
        	$this->where($this->filter_field[$item], $args[$item]);
    	}
        return $this;
    }

    public function search_data($args = array())
    {
    	foreach ($this->search_field as $field => $wildcard) {
        	$this->like($field, $args[$field], $wildcard);
    	}
        return $this;
    }

    public function join_author($table_name = false)
    {
        $this->select('*, users.username, users.name');
        $this->join('users', 'users.' . $this->author . '=' . $this->get_table($table_name) . '.' . $this->author);
        return $this;
    }

    public function join_meta()
    {
    	foreach ($this->meta_table as $table => $join_data) {
    		if (is_array($join_data)) {
        		$this->join($table, $join_data[0], $join_data[1]);
    		}else{
        		$this->join($table, $join_data);
    		}
    	}
        return $this;
    }

    public function join_meta_triple($table_name = false)
    {
    	$table_name = $this->get_table($table_name);
    	$select = "*";
    	foreach ($this->meta_triple as $key => $value) {
    		if ($value) {
    			$select .= " , (select GROUP_CONCAT(meta_value) from " . $this->meta_triple_name . " where " . $table_name . "." . $this->primary_key . " = " . $this->meta_triple_name . "." . $this->primary_key . ") as " . $key;
    		}else{
    			$select .= " , (select meta_value from " . $this->meta_triple_name . " where " . $table_name . "." . $this->primary_key . " = " . $this->meta_triple_name . "." . $this->primary_key . ") as " . $key;
    		}
    	}
        $this->select($select);
        return $this;
    }

    public function where_mine()
    {
    	$user_id = $this->user_model->current_user_session('user_id');
    	$this->db->where($this->author, $user_id);
    	return $this;
    }

}