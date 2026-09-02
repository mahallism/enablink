<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Payout_model extends Aplego_Model {
	public $table_name 			= "app_payouts";
	public $primary_key 		= "payout_id";
	// protected $table_view_name 	= 'app_permit_view';
	protected $created_at 		= true;
	protected $author			= true;
	
	public $rules = array(
		'payout_label' 		=> array('Payout Label', array('have', 'required')),
		'payout_max_date' 	=> array('Payout Max Date', array('have', 'required')),
	);
}
// payout_label
// payout_max_date
// payout_keterangan
