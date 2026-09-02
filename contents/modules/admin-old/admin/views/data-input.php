<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Master <?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<form class="card" method="post" enctype="multipart/form-data" <?php if (isset($form_action) && $form_action) echo 'action="' . $form_action . '"'; ?>>
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">
					<a href="<?php echo $group.$module_main; ?>" class="text-muted"><i class="fa fa-angle-left mr-2"></i></a>
					<?php echo ($mode_add === true ? 'Input ' : 'Edit ') . ucwords($module_name); ?>
				</h4>
				<?php if ($mode_add === false): ?>
					<div>
						<?php if (isset($action_url['duplicate'])): ?>
							<a href="<?php echo $action_url['duplicate']['url'] . '/' . current($post); ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-copy"></i> Duplicate</a>
						<?php endif ?>
						<?php if (isset($action_url['input'])): ?>
							<a href="<?php echo $action_url['input']['url']; ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-plus-circle"></i> Add New</a>
						<?php endif ?>
					</div>
				<?php endif; ?>
			</div>
			<?php echo $errors; ?>
			<div class="card-body">
				<?php $this->fcontrol->show(); ?>
				<div <?php if ($mode_add === false && !$this->input->post('change_password')) echo 'class="hide"'; ?> id="change_password_box">
					<?php $this->fcontrol->show('form_password'); ?>
				</div>
				<?php if ($mode_add === false): ?>
					<hr>
					<div class="form-group row mb-1">
						<label class="col-sm-4 col-form-label">Last Login</label>
						<label class="col-sm-8 col-form-label d-flex align-items-center">
							<div class="badge badge-primary mr-1"><?php echo $post['login_count']; ?></div> 
							<?php echo datetime_html($post['last_login']); ?>
						</label>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Created</label>
						<label class="col-sm-8 col-form-label"> 
							<?php echo datetime_html($post['created_at']); ?>
						</label>
					</div>
				<?php endif ?>
			</div>
			<div class="card-footer text-right">
				<button class="btn btn-primary" type="submit"><?php echo ($mode_add === true ? 'Input ' . ucwords($module_name) : 'Simpan Perubahan'); ?></button>
			</div>
		</form>
	</div>
</div>