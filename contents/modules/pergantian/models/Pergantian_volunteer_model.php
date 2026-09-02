<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class pergantian_volunteer_model extends Aplego_Model {
	public $table_name 		= "app_pergantian";
	public $primary_key 	= "s_id";


	protected $table_view_name 	= 'app_riwayat_pergantian_view';
	
	protected $created_at 	= false;

	public function __construct()
    {
        parent::__construct();
    }

	public function get_Available($hari,$mulai,$selesai,$id,$tanggal){
		$query = $this->db->query("CALL get_available(?,?,?,?,?)",[$hari,$mulai,$selesai,$id,$tanggal]);
		while (mysqli_more_results($this->db->conn_id)) {
			mysqli_next_result($this->db->conn_id);
			mysqli_use_result($this->db->conn_id);
		}
		return $query->result();
	}
	public function get_volunteer($nama,$id){
		$query = $this->db->query("CALL get_volunteer(?,?)",[$nama,$id]);
		while (mysqli_more_results($this->db->conn_id)) {
			mysqli_next_result($this->db->conn_id);
			mysqli_use_result($this->db->conn_id);
		}
	
		return $query->result();
		
	}
	public function create($data) {
		return $this->db->insert($this->table_name, $data); 
	}

public function change_button($user_id, $jadwal_id)
{
    $this->db->where('s_pengaju', $user_id);
    $this->db->where('s_jd_id', $jadwal_id);
	$this->db->where('respon', 'Menunggu Respon');
    $query = $this->db->get('app_pergantian');

    return $query->num_rows() > 0;
}
public function update($data, $where) {
    return $this->db->update($this->table_name, $data, $where);
}

}