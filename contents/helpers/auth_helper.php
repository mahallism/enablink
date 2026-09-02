<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function current_user_session($key = false, $value = false)
{
	$CI =& get_instance();
	return $CI->user_model->current_user_session($key, $value);
}

function protected_item($roles = false)
{
	$CI =& get_instance();
	if (!is_array($roles)) {
		$roles = func_get_args();
	}
	return $CI->user_model->protected_item($roles);
}