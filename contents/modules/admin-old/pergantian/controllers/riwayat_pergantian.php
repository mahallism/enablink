<?php
defined('BASEPATH') or exit('No direct script access allowed');

class riwayat_pergantian extends App_Controller
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
            
            'atas_nama'       => 'Atas Nama',
            'respon'          => 'Respon',
        ),
        'custom' => array(
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
        
        // if (empty($data)) {
        //     $this->data_view['message'] = '<div class="alert alert-info">Tidak ada data riwayat pergantian.</div>';
        // } else {
        //     $this->data_view['list'] = $data;
        // }
        parent::index($id);
    }
    protected function filter()
    {
        // Definisikan aturan form filter
        $rules_form = array(
            'bulan' => array(
                'label' => 'Bulan',
                'type'  => 'select',
                'select_type' => 'key_value',
                'select_data' => $this->get_bulan_list()
            ),
            'tahun' => array(
                'label' => 'Tahun',
                'type'  => 'select',
                'select_type' => 'key_value',
                'select_data' => $this->get_tahun_list()
            ),
        );

        
        $get_data = $this->model->gets_view();

     
        $this->fcontrol->set_data($get_data)->init($rules_form)->generate();

       
        if (!empty($get_data['bulan']) && !empty($get_data['tahun'])) {
            $bulan = (int) $get_data['bulan'];
            $tahun = (int) $get_data['tahun'];

            
            $this->model->where("MONTH(waktu_pengajuan)", $bulan);
            $this->model->where("YEAR(waktu_pengajuan)", $tahun);
        }
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