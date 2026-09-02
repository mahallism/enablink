<?php
defined('BASEPATH') OR exit('No direct script access allowed');

Class Option_model extends Aplego_Model
{
	public $table_name 		= 'aplego_options';
	public $primary_key 	= 'option_id';

	private $option_data 	= array();
	private $options_data 	= array();
	private $option_value 	= array();

	public function gets_in($key)
	{
		$data = $this
			->where_in('option_key', $key)
			->gets();
		$temp_data = array();
		foreach ($data as $item) {
			$this->option_data[$item['option_key']] = $temp_data[$item['option_key']] = $item['option_value'];
		}
		foreach ($key as $item) {
			if (!isset($temp_data[$item])) {
				$this->option_data[$item] = $temp_data[$item] = false;
			}
		}
		return $temp_data;
	}

	public function get_data($key, $id = false)
	{
		if ($id && isset($this->option_data[$key][$id])) {
			return $this->option_data[$key][$id];
		}else if (isset($this->option_data[$key])) {
			return $this->option_data[$key];
		}else{
			if (!$id) {
				$data = $this
					->where('option_key', $key)
					->get();
				$this->option_data[$key] = $data;
			}else{
				$data = $this
					->where('option_id', $id)
					->where('option_key', $key)
					->get();
				$this->option_data[$key][$id] = $data;
			}
			return $data;
		}
	}

	public function gets_data($key)
	{
		if (isset($this->options_data[$key])) {
			return $this->options_data[$key];
		}else{
			$data = $this
				->where('option_key', $key)
				->gets();
			$this->options_data[$key] = $data;
			return $data;
		}
	}
	
	public function get_value($key)
	{
		if (isset($this->option_value[$key])) {
			return $this->option_value[$key];
		}else{
			$data = $this
				->where('option_key', $key)
				->get();
			if ($data) {
				$this->option_value[$key] = $data['option_value'];
				return $data['option_value'];
			}else{
				$this->option_value[$key] = false;
				return false;
			}
		}
	}

	function set( $option_key, $option_value )
	{
		$data = array(
			'option_key'	=> $option_key,
			'option_value'	=> $option_value,
		);
		return $this->create($data);
	}

	function change( $id, $option_value )
	{
		$data = array('option_value' => $option_value);
		if (is_int($id)) {
			$this->update($id, $data);
		}else{
			$this->update(array('option_key' => $id), $data);
		}
	}

	function remove( $id )
	{
		if (is_int($id)) {
			return $this->delete($id);
		}else{
			return $this->where('option_key', $id)->delete();
		}
	}
}
