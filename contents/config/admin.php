<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// auth
$config['auth_session_name'] = 'volunteer_app_admin_h4k3h4iu3rh4iurh34i_session';

$config['user_group'] = array(
	'all' 			=> array('volunteer', 'difabel', 'staf', 'admin', false),
	'member' 		=> array('volunteer', 'difabel'),
	'volunteer' 	=> array('volunteer',),
	'difabel' 		=> array('difabel',),
	'admin' 		=> array('staf', 'admin'),
	'admin_master' 	=> array('admin'),
	'denied' 		=> array('denied'),
);

// template
$config['main_menu'] = array(
	'dashboard' => array(
		'label'         => 'Dashboard',
		'icon'			=> 'fas fa-tachometer-alt',
		'capability'    => $config['user_group']['admin'],
		'url'           => 'dashboard',
	),
	$config['user_group']['admin'],
	'active' => array(
		'label'         => 'Mahasiswa Aktif',
		'icon'			=> 'fas fa-graduation-cap',
		'capability'    => $config['user_group']['admin'],
		'submenu'       => array(
			'active_difabel' => array(
				'label'         => 'Mahasiswa Difabel',
				'url'           => 'active/difabel',
			),
			'active_volunteer' => array(
				'label'         => 'Mahasiswa Volunteer',
				'url'           => 'active/volunteer',
			),
			'active_register'	=> array(
				'label' 	=> 'Seluruh Mahasiswa',
				'url'   	=> 'active/register',
			),
		),
	),
	'jadwal_madif' => array(
		'label'         => 'Jadwal Madif',
		'icon'			=> 'fas fa-wheelchair',
		'capability'    => $config['user_group']['admin'],
		'submenu'       => array(
			'jadwal_difabel' => array(
				'label'         => 'Jadwal Kuliah',
				'url'           => 'jadwal/difabel',
			),
//            'jadwal_difabel_ujian' => array(
//                'label'         => 'Jadwal Lain/Ujian',
//                'url'           => 'jadwal/difabel/ujian',
//            ),
            'jadwal_difabel_kegiatan' => array(
                'label'         => 'Jadwal Kuliah/Ujian',
                'url'           => 'jadwal/difabel_ujian',
            ),
		),
	),
    'jadwal_volunteer' => array(
        'label'         => 'Jadwal Volunteer',
        'icon'			=> 'fas fa-calendar-alt',
        'capability'    => $config['user_group']['admin'],
        'submenu'       => array(
            'jadwal_volunteer' => array(
                'label'         => 'Jadwal Kuliah',
                'url'           => 'jadwal/volunteer',
            ),
            'jadwal_volunteer_kegiatan' => array(
                'label'         => 'Jadwal Kuliah/Ujian',
                'url'           => 'jadwal/volunteer_ujian',
            ),
        ),
    ),
	$config['user_group']['admin'],
	'pendampingan' => array(
		'label'         => 'Jadwal Pendampingan',
		'icon'			=> 'fas fa-calendar-check',
		'capability'    => $config['user_group']['admin'],
		'submenu'       => array(
			'pendampingan' => array(
				'label'         => 'Pendampingan Mahasiswa',
				'url'           => 'pendampingan',
			),
			// 'pendampingan_ganti' => array(
			// 	'label'         => 'Riwayat Ganti Pendamping',
			// 	'url'           => 'pendampingan_ganti',
			// )
			'izin' => array(
				'label'         => 'Izin Pendampingan',
				'icon'			=> 'fas fa-calendar-times',
				'capability'    => $config['user_group']['admin'],
				'url'           => 'izin',
			),
            'permission' => array(
                'label'         => 'Izin Cuti',
                'icon'			=> 'fas fa-calendar-times',
                'capability'    => $config['user_group']['admin'],
                'url'           => 'izin/permission',
            ),
		),
	),

	'pendampingan_report' => array(
		'label'         => 'Riwayat Pendampingan',
		'icon'			=> 'fas fa-user-friends',
		'capability'    => $config['user_group']['admin'],
		'submenu'       => array(
			'report_pendampingan' => array(
				'label'         => 'Pendampingan Mahasiswa',
				'url'           => 'report/pendampingan',
			),
			'report_volunteer' => array(
				'label'         => 'Kehadiran Volunteer',
				'url'           => 'report/volunteer',
			)
		),
	),

	'pergantian'=>array(
		'label'         => 'Riwayat Pergantian',
		'icon'			=> 'fas fa-sync-alt',
		'capability'    => $config['user_group']['admin'],
		'submenu'       => array(
			'pergantian_volunteer' => array(
				'label'         => 'Pergantian Volunteer',
				'url'           => 'pergantian/riwayat_pergantian',
			),
		),
	),
// 	'payout' => array(
// 		'label'         => 'Payout',
// 		'icon'			=> 'fas fa-credit-card',
// 		'capability'    => $config['user_group']['admin'],
// 		'url'           => 'payout',
// 	),
	$config['user_group']['admin'],
	'user' => array(
		'label'         => 'Users',
		'icon'			=> 'fas fa-users',
		'capability'    => $config['user_group']['admin_master'],
		'submenu'       => array(
			'mahasiswa' => array(
				'label'         => 'Mahasiswa',
				'url'           => 'mahasiswa',
			),
			'admin'	=> array(
				'label' 	=> 'Administrator',
				'url'   	=> 'admin',
			),
		),
	),
	'master' => array(
		'label'         => 'Master',
		'icon'			=> 'fas fa-database',
		'capability'    => $config['user_group']['admin_master'],
		'submenu'       => array(
			'semester' => array(
				'label'         => 'Semester',
				'url'           => 'semester',
			),
			'fakultas' => array(
				'label'         => 'Fakultas dan Jurusan',
				'url'           => 'fakultas',
			),
			'difabel' => array(
				'label'         => 'Jenis Difabel',
				'url'           => 'difabel',
			),
			'preferensi' => array(
				'label'         => 'Jenis Preferensi',
				'url'           => 'preferensi',
			),
		),
	),
	'setting_global' => array(
		'label'         => 'Settings',
		'icon'			=> 'fas fa-cog',
		'capability'    => $config['user_group']['admin_master'],
		'submenu'       => array(
			'setting_global' => array(
				'label'         => 'Settings Global',
				'url'           => 'setting',
			),
			'setting_app' => array(
				'label'         => 'Settings App',
				'url'           => 'setting/app',
			),
		),
	),
);
