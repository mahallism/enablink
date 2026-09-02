<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fakultas extends App_Controller {

	protected $module_main = 'fakultas';
	protected $gets_view = true;
	
	protected $list_size  	= 'lg';

	protected $list_field  	= array(
		'field' 	=> array(
			'faculty_name' 	=> 'Nama Fakultas',
			'majors_name' 	=> 'Nama Jurusan',
		),
		'custom' 	=> array(
			'majors_name' 	=> '$item["majors_id"] === null ? "-" : $item["majors_name"]',
		),
	);
	protected $input_field  = array(
		'faculty_name' => array(
			'label' => 'Nama Fakultas',
			'required' => true,
		),
	);

	function __construct()
	{
		parent::__construct();

		foreach (array('duplicate', 'edit', 'delete') as $item) {
			$this->action_url[$item]['id'] = 'majors_id';
			$this->action_url[$item]['url'] = $this->group.$this->module_main.'/jurusan/'.$item;
		}
		$custom_field_faculty_name = '"{$item["faculty_name"]}';
		$custom_field_faculty_name .= '<div class=\"float-sm-right\">';
		$custom_field_faculty_name .= '<a href=\"' . $this->group . $this->module_main . '/jurusan/input/{$item["faculty_id"]}\"><i class=\"fas fa-plus-circle\"></i></a>';
		$custom_field_faculty_name .= ' &nbsp; <a href=\"' . $this->group . $this->module_main . '/duplicate/{$item["faculty_id"]}\" class=\"text-muted\"><i class=\"far fa-copy\"></i></a>';
		$custom_field_faculty_name .= ' &nbsp; <a href=\"' . $this->group . $this->module_main . '/edit/{$item["faculty_id"]}\"><i class=\"fas fa-pencil-alt\"></i></a>"';
		if ($this->user_model->protected_item($this->user_group[$this->protected_page['delete']])) {
			$custom_field_faculty_name .= ' . ($item["majors_id"] === null ? " &nbsp; <a href=\"' . $this->group . $this->module_main . '/delete/{$item["faculty_id"]}\" onclick=\"return confirm(\'Apakah anda yakin akan menghapus data?\')\" class=\"text-danger\"><i class=\"fa fa-trash\"></i></a>" : "" )';
		}
		$custom_field_faculty_name .= ' . "</div>"';
		$this->list_field['custom']['faculty_name'] = $custom_field_faculty_name;
	}

	public function index($id = false)
	{
		$this->model->order_by('faculty_name, majors_name');
		parent::index($id);
	}
}
