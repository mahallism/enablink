<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Member_Controller extends Front_Controller {

    public function __construct()
    {
        parent::__construct();

        if ($capability = current_user_session('capability')) {
        	$this->param_header['group'] = $this->param['group'] = $this->group = $capability;
        }
    }

	protected function build($view)
	{
		$this->show_header();
		$this->param_header['member_menu'] = $this->config->item($this->group.'_menu');
		$this->load->view($this->folder_view.'member-header', $this->param_header);
		$this->load->view($this->folder_view_primary.$view, $this->param);
		$this->load->view($this->folder_view.'member-footer', $this->param_footer);
		$this->show_footer();
	}
}
