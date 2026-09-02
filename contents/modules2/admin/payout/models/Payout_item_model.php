<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payout_item_model extends Aplego_Model {
	public $table_name 			= "app_payout_items";
	public $primary_key 		= "item_id";
	// protected $table_view_name 	= 'app_permit_view';
	
	public $rules = array(
		// 'payout_id'		=> array('Payout', array('have', 'required')),
		'volunteer_id'	=> array('Volunteer', array('have', 'required')),
		'payout_value'	=> array('Value', array('have', 'required')),
		'pertemuan'		=> array('Pertemuan', array('have', 'required')),
	);
}
// payout_id
// volunteer_id
// payout_value
// pertemuan
// paid_confirm_id