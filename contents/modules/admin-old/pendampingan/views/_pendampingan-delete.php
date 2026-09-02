<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Master <?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<form class="card" method="post" enctype="multipart/form-data">
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">
					<a href="<?php echo $group.$module_main; ?>" class="text-muted"><i class="fa fa-angle-left mr-2"></i></a>
					Delete Multi <?php echo ucwords($module_name); ?>
				</h4>
			</div>
			<?php echo $errors; ?>
			<div class="card-body">
				<?php $this->fcontrol->show(); ?>
			</div>
			<div class="card-footer text-right">
				<button class="btn btn-primary" type="submit">Delete Multi <?php echo ucwords($module_name); ?></button>
			</div>
		</form>
	</div>
</div>