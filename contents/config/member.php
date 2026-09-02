<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$config['app_name'] = 'Enablink';

// auth
$config['auth_session_name'] = 'volunteer_app_member_h4k3h4iu3rh4iurh34i_session';
#$config['auth_session_name'] = 'volunteer_app_admin_h4k3h4iu3rh4iurh34i_session';


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
		'capability'    => $config['user_group']['member'],
		'url'           => 'dashboard',
	),
	'jadwal_difabel' => array(
		'label'         => 'Jadwal',
		'icon'			=> 'fas fa-calendar-alt',
		'capability'    => $config['user_group']['difabel'],
		'submenu'       => array(
			'jadwal' => array(
				'label' => 'Jadwal Kuliah',
				'url' 	=> 'jadwal',
			),
            'revisi' => array(
                'label' => 'Revisi Jadwal Kuliah',
                'url' 	=> 'jadwal/revisi',
            ),
            'jadwal_ujian' => array(
                'label' => 'Jadwal Kegiatan Lain/Ujian',
                'url' 	=> 'jadwal/ujian',
            )
		),
	),
	'jadwal_volunteer' => array(
		'label'         => 'Jadwal',
		'icon'			=> 'fas fa-calendar-alt',
		'capability'    => $config['user_group']['volunteer'],
		'submenu'       => array(
			'jadwal' => array(
				'label' => 'Jadwal Kegiatan',
				'url' 	=> 'jadwal',
			),
            'revisi' => array(
                'label' => 'Revisi Jadwal Kuliah',
                'url' 	=> 'jadwal/revisi',
            ),
            'jadwal_ujian' => array(
                'label' => 'Jadwal Kegiatan Lain/Ujian',
                'url' 	=> 'jadwal/ujian',
            ),
		),
	),
    'pendampingan' => array(
        'label'         => 'Pendampingan',
        'icon'			=> 'fas fa-user-friends',
        'capability'    => $config['user_group']['member'],
        'url'           => 'jadwal/pendampingan',
    ),
	// 'izin' => array(
	// 	'label'         => 'Surat Izin',
	// 	'icon'			=> 'fas fa-calendar-times',
	// 	'capability'    => $config['user_group']['member'],
	// 	'url'           => 'izin',
	// ),
//	'pendampingan' => array(
//		'label'         => 'Pendampingan',
//		'icon'			=> 'fas fa-user-friends',
//		'capability'    => $config['user_group']['member'],
//		'url'           => 'pendampingan',
//	),
    'izin' => array(
        'label' => 'Izin',
        'capability'=> $config['user_group']['member'],
        'icon'		=> 'fa-envelope far',
        'submenu'       => array(
            'izin_pendampingan' => array(
                'label' => 'Izin Pendampingan',
                'url' 	=> 'izin',
            ),
            // 'izin_tgl' => array(
            //     'label' => 'Izin Cuti',
            //     'url' 	=> 'izin/permission',
            // )
        ),
    ),
// 	'payout' => array(
// 		'label'         => 'Payout',
// 		'icon'			=> 'fas fa-credit-card',
// 		'capability'    => $config['user_group']['volunteer'],
// 		'url'           => 'payout',
// 	),
);

$config['second_menu'] = array(
	'register' => array(
		'label'         => 'Register',
		'icon'			=> 'fas fa-user-plus',
		'capability'    => false,
		'url'           => 'user/register',
	),
	'login' => array(
		'label'         => 'Login',
		'icon'			=> 'fas fa-sign-in-alt',
		'capability'    => false,
		'url'           => 'user/login',
	),
);
