<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_Controller extends Aplego_Controller {
	protected $folder_view = 'default/';

	protected $option_data = array(
		'site_name',
		'site_tagline',
		'site_description',
		'site_logo',
		'site_favicon',
	);
	protected $other_option_data = array();

	protected $footer_option = array(
		'footer_information',
	);
	protected $other_footer_option = array();

	public function __construct()
	{
		parent::__construct();

		$this->admin_group = $this->config->item('admin_group');
		$this->param_header['admin_group'] = $this->param['admin_group'] = $this->admin_group;

		$this->option = $this->option_model->gets_in(array_merge($this->option_data, $this->other_option_data));
		$this->param_header['option'] = $this->param['option'] = $this->option;
		$this->param_footer['option'] = $this->option_model->gets_in($this->footer_option);

		$this->load->library($this->admin_group."media/media_plugin");
		$this->param_header['favicon'] = $this->media_plugin->get_url($this->option['site_favicon'], false);
		$this->param_header['logo'] = $this->media_plugin->get_url($this->option['site_logo'], false);

		$this->load->library($this->admin_group."widget/widget_plugin");

		$this->load->model($this->admin_group."menu/menu_model");
		$this->param_header['main_menu'] = $this->menu_model->get_menu('main-menu');
		
		$this->load->model($this->admin_group.'post/post_model');
	}

	protected function get_title()
	{
		if ($this->active_menu == "home") {
			return $this->param['option']['site_name'] . " &middot; " . $this->param['option']['site_tagline'];
		}else{
			return ($this->title ? $this->title . " &middot; " : "") . $this->param['option']['site_name'];
		}
	}
}
