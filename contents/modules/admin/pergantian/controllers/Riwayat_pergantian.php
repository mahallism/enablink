<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Riwayat_pergantian extends App_Controller
{

   
	protected $module_main = 'riwayat_pergantian';
	protected $module_name = 'riwayat_pergantian';
	protected $gets_view = true;
	
    protected $list_field = array(
        'field' => array(
            'pengaju'         => 'Pengaju',
            'penerima'        => 'Penerima',
            'waktu_pengajuan' => 'Waktu Pengajuan',
            'waktu_respon'    => 'Waktu Respon',
            'waktu_damping'=> 'Waktu Damping',
            'atas_nama'       => 'Atas Nama',
            'respon'          => 'Respon',
        ),
        'custom' => array(
            'waktu_damping' => '$item["tanggal"] === null ? "-" : $item["tanggal"].", ". $item["mulai"]." - ".  $item["selesai"]',
            'waktu_respon' => '$item["waktu_respon"] === null ? "-" : $item["waktu_respon"]',
            'respon'       => '$item["respon"] === null ? "-" : ucfirst($item["respon"])',
        ),
    );

    function __construct(){
        parent::__construct();
        
    }


    public function index($id = false)
    {
        $this->filter();
        
        parent::index($id);
    }
    protected function filter()
    {
        $rules_form = array(
            'bulan' => array(
                'label' => 'Bulan',
                'type'  => 'select',
                'select_type' => 'key_value',
                'select_data' => $this->get_bulan_list(),
            ),
            'tahun' => array(
                'label' => 'Tahun',
                'type'  => 'select',
                'select_type' => 'key_value',
                'select_data' => $this->get_tahun_list(),
            ),
        );
    
        
        $get_data = array(
            'bulan' => '',
            'tahun' => '',
        );
    
        
        if ($get = $this->input->get()) {
            $get_data = array_merge($get_data, $get);
        }
    
        
        $this->fcontrol->set_data($get_data)->init($rules_form)->generate();
    
        
        if (!empty($get_data['bulan'])) {
            $this->model->where('MONTH(waktu_pengajuan)', (int) $get_data['bulan']);
        }
    
        if (!empty($get_data['tahun'])) {
            $this->model->where('YEAR(waktu_pengajuan)', (int) $get_data['tahun']);
        }
        $this->model->order_by('waktu_pengajuan', 'DESC');
    }
    

    private function get_bulan_list()
    {
        return array(
            '' => 'Pilih Bulan',
            '1'  => 'Januari',
            '2'  => 'Februari',
            '3'  => 'Maret',
            '4'  => 'April',
            '5'  => 'Mei',
            '6'  => 'Juni',
            '7'  => 'Juli',
            '8'  => 'Agustus',
            '9'  => 'September',
            '10' => 'Oktober',
            '11' => 'November',
            '12' => 'Desember'
        );
    }

    private function get_tahun_list()
    {
        $tahun_sekarang = date('Y');
        $tahun_awal = 2020; 
        $tahun_list = array('' => 'Pilih Tahun');
        for ($i = $tahun_awal; $i <= $tahun_sekarang; $i++) {
            $tahun_list[$i] = $i;
        }
        return $tahun_list;
    }

    //----------------------------------------------------//
    
    
}