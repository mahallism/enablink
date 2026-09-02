<?php
class RiwayatPergantianTest extends App_Controller
{
    public function __construct()
    {
        parent::__construct();
        // Load controller dan library unit_test
        $this->load->controller('riwayat_pergantian');
        $this->load->library('unit_test');
        $this->load->model('riwayat_pergantian_model');
    }

    // Tes untuk method index()
    public function test_index()
    {
        // Simulasi input GET untuk filter bulan dan tahun
        $_GET['bulan'] = 1;
        $_GET['tahun'] = 2025;

        // Mock model jika diperlukan
        $mock_data = array(
            (object)[
                'pengaju' => 'John Doe',
                'penerima' => 'Jane Doe',
                'waktu_pengajuan' => '2025-01-01',
                'waktu_respon' => '2025-01-02',
                'atas_nama' => 'John',
                'respon' => 'Accepted'
            ]
        );

        // Mocking model method gets_view() untuk mengembalikan data dummy
        $this->riwayat_pergantian_model->shouldReceive('gets_view')
            ->andReturn($mock_data);
        
        // Jalankan method index() yang akan memanggil filter() juga
        $this->riwayat_pergantian->index();

        // Verifikasi apakah data telah di-set dengan benar
        $this->unit->run($this->riwayat_pergantian->data_view['list'][0]->pengaju, '==', 'John Doe', 'Pengaju Test');
        $this->unit->run($this->riwayat_pergantian->data_view['list'][0]->respon, '==', 'Accepted', 'Respon Test');
    }

    // Tes untuk method filter()
    public function test_filter()
    {
        // Simulasi input GET untuk filter
        $_GET['bulan'] = 2;  // Februari
        $_GET['tahun'] = 2025;

        // Mocking model method gets_view() untuk mengembalikan data dummy
        $this->riwayat_pergantian_model->shouldReceive('gets_view')
            ->andReturn([]);  // Tidak ada data untuk diuji

        // Memanggil filter() secara langsung dari controller
        $this->riwayat_pergantian->filter();

        // Verifikasi apakah query berdasarkan bulan dan tahun telah diterapkan
        // Misalnya, cek bahwa query untuk bulan dan tahun telah diterapkan dengan benar
        $this->unit->run(
            $this->riwayat_pergantian_model->get_last_query(), // cek query terakhir
            'contains',  // cek apakah ada bulan dan tahun yang disaring
            'Filter Query Test'
        );
    }

    // Menjalankan tes
    public function run_tests()
    {
        $this->test_index();
        $this->test_filter();
    }
}
