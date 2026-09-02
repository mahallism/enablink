<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function get_app_config($key)
{
    $CI =& get_instance();
    return $CI->config->item($key);
}

function get_option($key)
{
    $CI =& get_instance();
    return $CI->option_model->get_value($key);
}

function is_assoc($array)
{
    return array_keys($array) !== range(0, count($array) - 1);
}

function is_json($data)
{
	@json_decode($data);
	return (json_last_error() === JSON_ERROR_NONE);
}