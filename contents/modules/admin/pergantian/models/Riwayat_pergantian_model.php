<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Riwayat_pergantian_model extends Aplego_Model {
	public $table_name 		= "app_pergantian";
	public $primary_key 	= "s_id";

	protected $table_view_name 	= 'app_riwayat_pergantian_view';
	
	protected $created_at 	= false;

// public function get_filtered($bulan = null, $tahun = null)
// {
//     if ($bulan && $tahun) {
//         $this->db->where('MONTH(waktu_pengajuan)', $bulan);
//         $this->db->where('YEAR(waktu_pengajuan)', $tahun);
//     }

//     return $this->db->get('nama_tabel')->result();
// }
}