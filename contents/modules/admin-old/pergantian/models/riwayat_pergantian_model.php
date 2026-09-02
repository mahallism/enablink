<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class riwayat_pergantian_model extends Aplego_Model {
	public $table_name 		= "app_pergantian";
	public $primary_key 	= "s_id";

	protected $table_view_name 	= 'app_riwayat_pergantian_view';
	
	protected $created_at 	= false;


	public function filter_by_penerima($user_id)
{
    return $this->db->from($this->table_view_name)
                    ->where('s_penerima', $user_id)
					->order_by('waktu_pengajuan', 'DESC')  
                    ->get()
                    ->result();
}
}