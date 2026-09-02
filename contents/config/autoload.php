<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

$autoload['libraries'] = array('session', 'database', 'aquery', 'fcontrol', 'validation');

$autoload['helper'] = array('url', 'array', 'function', 'template', 'auth',);

$autoload['config'] = array('app', 'content');

$autoload['model'] = array('option_model', 'user/user_model', 'user/user_meta_model');