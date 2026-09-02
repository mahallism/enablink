<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

$config['app_name'] = getenv('APP_NAME') ? getenv('APP_NAME') : 'Aplego';
$config['app_vertion'] = getenv('APP_VERTION') ? getenv('APP_VERTION') : '1.0';

$config['main_module'] = "admin/";
$config['main_view_folder'] = "";

// subsystem
// $config['admin_module'] = 'aplego';
// $config['default_subsystem'] = 'aplego';
$config['admin_module'] = 'admin';
$config['default_subsystem'] = 'admin';
$config['subsystem'] = array(
	'admin',
	'app', 
);

// auth
$config['auth_session_name'] = 'volunteer_app_h4k3h4iu3rh4iurh34i_session';

$config['capability'] = array(
	'volunteer',
	'difabel',
	'staf',
	'admin',
);

$config['main_url'] = array(
	'member' 		=> 'dashboard',
	'volunteer' 	=> 'dashboard',
	'difabel' 		=> 'dashboard',
	'staf' 			=> 'admin/dashboard',
	'admin' 		=> 'admin/dashboard',
);

$config['user_group'] = array(
	'all' 			=> array('volunteer', 'difabel', 'staf', 'admin', false), 
	'member' 		=> array('volunteer', 'difabel'), 
	'volunteer' 	=> array('volunteer',), 
	'difabel' 		=> array('difabel',), 
	'admin' 		=> array('staf', 'admin'), 
	'admin_master' 	=> array('admin'), 
	'denied' 		=> array('denied'), 
);

$config['status'] = array(
	'Terjadwal',
	'Dikonfirmasi',
	'Izin',
	'Selesai',
	'Dibatalkan',
);