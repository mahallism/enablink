<?php
defined('BASEPATH') OR exit('No direct script access allowed');

date_default_timezone_set("Asia/Jakarta");

$config['route'] = array(
    'default_controller'    => 'welcome',
    '404_override'          => 'errordocument/show',
    'translate_uri_dashes'  => FALSE,
);

$config['modules_locations'] = array(
	APLEGO_PATH . 'modules/' => APLEGO_OFFSET . 'modules/',
    // APPPATH.'modules/' => '../modules/',
);

$config['migration'] = array(
    'migration_enabled'     => false,
    'migration_type'        => 'sequential',
    'migration_table'       => 'aplego_migrations',
    'migration_version'     => 6,
    'migration_path'        => APLEGO_PATH.'migrations/',
);

$config['upload_folder'] = './uploads/';
$config['database_folder'] = './db/';
