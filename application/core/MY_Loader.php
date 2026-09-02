<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH."third_party/MX/Loader.php";

class MY_Loader extends MX_Loader {
	public function __construct()
	{
		parent::__construct();

		$this->_ci_library_paths = array(APPPATH, APLEGO_PATH, BASEPATH);
		$this->_ci_helper_paths = array(APPPATH, APLEGO_PATH, BASEPATH);
		$this->_ci_model_paths = array(APPPATH, APLEGO_PATH);
		$this->_ci_view_paths = $this->_ci_view_paths + array(APLEGO_PATH .'/views/' => TRUE);
	}

	public function initialize($controller = NULL)
	{
		$this->_custom_autoloader();

		return parent::initialize($controller);
	}

	public function _custom_autoloader(){
		$this->config->_config_paths = array(APPPATH, APLEGO_PATH);

		if (file_exists(APLEGO_PATH.'config/autoload.php')){
			include(APLEGO_PATH.'config/autoload.php');
		}
		if (!isset($autoload)){
			return FALSE;
		}
		$this->_autoloader($autoload);
	}
}
