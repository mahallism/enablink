<div class="content max-sm-container">
	<div class="content-header">
		<h2 class="content-title text-center">Profile</h2>
	</div>
	<div class="content-body">
		<?php echo $message; ?>
		<?php echo $errors; ?>
		<form class="card" method="post" enctype="multipart/form-data">
			<div class="card-header">
				<h4 class="card-title">Change Profile</h4>
			</div>
			<div class="card-body">
				<?php $this->fcontrol->show(); ?>
				<hr>
				<div class="form-group row">
					<div class="col-sm-8 ml-auto">
						<div class="form-check">
							<label class="form-check-label">
								<input type="checkbox"<?php if (isset($post['change_password'])) echo ' checked=""'; ?> name="change_password" class="form-check-input" show-change="#change_password_box">
								Change Password
							</label>
						</div>
					</div>
				</div>
				<div id="change_password_box" class="<?php if(!isset($post['change_password'])) echo 'hide' ?>">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Last Password</label>
						<div class="col-sm-8">
							<input name="last_password" type="password" class="form-control" placeholder="Last Password">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">New Password</label>
						<div class="col-sm-8">
							<input name="password" type="password" class="form-control" placeholder="Password">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Repeat Password</label>
						<div class="col-sm-8">
							<input name="repeat_password" type="password" class="form-control" placeholder="Repeat Password">
						</div>
					</div>
				</div>
			</div>
			<?php if (protected_item('difabel')): ?>
				<div class="card-header">
					<h4 class="card-title">Data Disabilitas</h4>
				</div>
				<div class="card-body">
					<?php $this->fcontrol->show('form_disabilitas'); ?>
				</div>
			<?php endif ?>
			<div class="card-footer text-right">
				<button class="btn btn-primary" type="submit">Simpan Perubahan</button>
			</div>
		</form>
	</div>
</div>