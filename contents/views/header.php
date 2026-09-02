<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<base href="<?php echo base_url(); ?>">

	<title><?php echo $title; ?></title>

	<!-- Bootstrap Core CSS -->
	<link href="assets/aplego/css/bootstrap.min.css" rel="stylesheet">

	<!-- vendor -->
	<!-- fontawesome -->
	<link href="assets/aplego/css/style.min.css" rel="stylesheet">
	<!-- dataTables -->
	<link href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="https://cdn.datatables.net/buttons/2.0.0/css/buttons.dataTables.min.css" rel="stylesheet">
	<!-- bootstrap-select -->
<!--	<link href="assets/vendor/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet">-->
    <link href="assets/vendor/select2/css/select2.min.css" rel="stylesheet">

	<!-- custom style -->
	<link href="assets/vendor/fontawesome/css/all.min.css" rel="stylesheet">

	<!-- jQuery -->
	<script src="assets/aplego/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="assets/aplego/js/popper.min.js"></script>
	<script src="assets/aplego/js/bootstrap.min.js"></script>
	<script src="assets/aplego/js/bs-custom-file-input.min.js"></script>
	<!-- vendor -->
	<!-- dataTables -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css" />

	<script type="text/javascript" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>

	<script src="assets/vendor/dataTables/dataTables.rowsGroup.js"></script>
    <script src="assets/vendor/dataTables/dataTables.rowGroup.min.js"></script>
	<!-- <script src="assets/vendor/dataTables/dataTables.bootstrap4.min.js"></script> -->
	<!-- bootstrap-select -->
<!--	<script src="assets/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>-->
    <script src="assets/vendor/select2/js/select2.full.min.js"></script>
	<!-- text editor tinymce -->
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>

	<!-- Chartjs -->
	<script src="assets/vendor/chartjs/chart.bundle.js"></script>
	<script src="assets/vendor/chartjs/utils.js"></script>

    <!-- star rating js -->
    <link rel="stylesheet" type="text/css" href="assets/vendor/star-rating/star-rating.css" />
    <script src="assets/vendor/star-rating/star-rating.min.js"></script>

	<!-- custom script -->
	<script src="assets/aplego/js/script.js"></script>
    <script>
        $(document).ready(function(){
            $("select.select2").select2({});
        });
    </script>
</head>

<body class="sidenav active-sidenav">
	<header>
		<nav class="navbar navbar-dark fixed-top">
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainnav">
				<i class="fas fa-bars"></i>
			</button>
			<a class="navbar-brand" href="<?php echo $group; ?>dashboard"><?php echo get_app_config('app_name'); ?></a>

			<div class="collapsed navbar-collapse" id="mainnav">
				<ul class="navbar-nav mainnav">
					<?php if ($menu = $this->config->item('main_menu')) : ?>
						<?php foreach ($menu as $id => $item) : ?>
							<?php if (is_assoc($item) && protected_item($item['capability'])) : ?>
								<?php if (isset($item['submenu'])) : ?>
									<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle<?php $active_menu(array_keys($item['submenu'])); ?>" href="#" data-toggle="dropdown">
											<i class="<?php echo $item['icon']; ?>"></i><?php echo $item['label']; ?>
										</a>
										<div class="dropdown-menu<?php if ($active_menu(array_keys($item['submenu']), false)) echo " show"; ?>">
											<?php foreach ($item['submenu'] as $subid => $subitem) : ?>
												<a class="dropdown-item<?php $active_menu($subid); ?>" href="<?php echo $group . $subitem['url']; ?>"><?php echo $subitem['label']; ?></a>
											<?php endforeach ?>
										</div>
									</li>
								<?php else : ?>
									<li class="nav-item<?php $active_menu($id); ?>">
										<a class="nav-link" href="<?php echo $group . $item['url']; ?>">
											<i class="fa-fw <?php echo $item['icon']; ?>"></i><?php echo $item['label']; ?>
										</a>
									</li>
								<?php endif; ?>
							<?php elseif (protected_item($item)) : ?>
								<li class="divider"></li>
							<?php endif; ?>
						<?php endforeach; ?>
					<?php endif ?>
				</ul>
				<ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item">
                        <span class="nav-link">
                        	{elapsed_time}s
                        </span>
                    </li> -->
					<!-- <li class="nav-item">
						<a class="nav-link" href="" target="_blank">
							<i class="fa fa-fw fa-globe"></i>
						</a>
					</li> -->
					<?php if ($user_data = current_user_session()) : ?>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<div class="avatar"><?php echo substr($user_data['name'], 0, 1); ?></div>
								<span><?php echo $user_data['name']; ?></span>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="<?php echo $group; ?>user/profile" class="dropdown-item<?php $active_menu('profile'); ?>"><i class="fa fa-fw fa-user"></i> Profile</a>
								<a href="<?php echo $group; ?>user/change_profile" class="dropdown-item<?php $active_menu('change_profile'); ?>"><i class="fa fa-fw fa-user-cog"></i> Change Profile</a>
								<div class="dropdown-divider"></div>
								<a href="<?php echo $group; ?>user/logout" class="dropdown-item"><i class="fa fa-fw fa-sign-out-alt"></i> Logout</a>
							</div>
						</li>
					<?php endif ?>
				</ul>
			</div>
		</nav>
	</header>
	<div class="body">
