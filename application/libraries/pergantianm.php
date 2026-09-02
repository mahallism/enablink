<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class pergantianm
{
    public function tarik($id, $cekRespon, $model)
    {
        try {
            if ($cekRespon($id)) {
                $data = [
                    'respon' => 'Ditarik',
                    'waktu_respon' => date('Y-m-d H:i:s')
                ];
                $where = ['s_jd_id' => $id];
                $model->update($data, $where);
                return 'success|Ajuan berhasil ditarik';
            } else {
                return 'error|Ajuan telah direspon, cek kembali ';
            }
        } catch (\Exception $e) {
            return 'error|' . $e->getMessage(); // Tangani error di sini
        }
    }

    public function tolak($id, $cekRespon, $model)
	{
		try {
		

            if ($cekRespon($id)) {
				$data = [
					'respon' => 'Ditolak',
					'waktu_respon' => date('Y-m-d H:i:s')
				];
				$where = [
					's_id' => $id
				];
				$model->update($data, $where);
				return 'success|Ajuan berhasil ditolak';
			} else {
				return 'error|Ajuan telah ditarik oleh yang mengajukan';
			}

		} catch (Exception $e) {
			return 'error|' . $e->getMessage();
		}
	}
    public function cari($recom, $user_id)
{
    if (!empty($recom)) {
        $data['recom'] = $recom;
        $data['user_id'] = $user_id;
        return 'Data Ditemukan';
    }
    return 'Tidak ada data volunteer ditemukan.';
}

 public function ajukan($data,$model1){
    $masukan = [
        's_jd_id' => $data['id_jadwal'],
        's_pengaju' => $data['pengaju'],
        's_penerima' => $data['penerima'],
        'email'=>$data['email'],
        'waktu_pengajuan' => date('Y-m-d'),
    ];

    $insert = $model1->create($masukan);
    return $insert ? "Berhasil mengajukan pergantian volunteer." : "Gagal mengajukan pergantian.";
 }

    
}
