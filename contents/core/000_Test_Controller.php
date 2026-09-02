<?php error_reporting (E_ALL ^ E_NOTICE); ?> 

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test_Controller extends MX_Controller {
	protected $use_strict = true;
	function __construct()
	{
		parent::__construct();

		$this->load->library('unit_test');
		
		$this->unit->use_strict($this->use_strict);
	}

	public function index()
	{
		$class = new ReflectionClass($this);
        $methods = $class->getMethods(
            ReflectionMethod::IS_PROTECTED
        );
        $this->setup();
        foreach ($methods as $method) {
        	$method_name = $method->name; 
        	echo "Test : " . $method_name;
        	$this->$method_name();
        }
	}

	public function setup(){}
}