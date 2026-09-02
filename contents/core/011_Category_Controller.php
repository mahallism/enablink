<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Category_Controller extends App_Controller {
	protected $module_name  = 'post category';
	protected $module_main  = 'post/category';

	protected $single_page  = true;
	protected $gets_view  = true;
	protected $load_model  = false;

	public function __construct()
	{
		parent::__construct();

		$this->load->model($this->group.'post/post_category_model', 'model');
		if ($this->module_main != 'post/category') {
			$temp = explode('/', $this->module_main);
			$this->model->category_type = $temp[0];
		}

		$this->param['category_parent'] = $this->model->prepar()->where('category_parent_id is null')->gets();
		$this->model->prepar()->join_author($this->gets_view)->order_by('order_data');
	}
}