<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// Core Master
require APPPATH."core/aplego/Aplego_Controller.php";

// Core Implementais
foreach (glob(APLEGO_PATH . "core/*_*_Controller.php") as $filename)
{
	// var_dump($filename);
    require $filename;
}