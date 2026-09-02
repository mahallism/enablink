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
			</div>
			<?php echo $errors; ?>
			<div class="card-body">
				<?php if ($mode_add === true): ?>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Nama Mahasiswa</label>
						<div class="col-sm-8"> 
							<span class="form-control bg-light"><a href="<?php echo $group.'mahasiswa/edit/'.$data['user_id'] ?>" target="blank"><?php echo $data['name']; ?></a><small class="text-muted"> (<?php echo $data['nick_name']; ?>)</small></span>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Waktu Pendampingan</label>
						<div class="col-sm-8"> 
							<span class="form-control bg-light"><?php echo $day[$data['day']].', '.date_html($date); ?> <small class="text-muted">(<?php echo time_html($data['start_at']) . ' - ' . time_html($data['end_at']); ?>)</small></span>
						</div>
					</div>
				<?php else: ?>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Nama Mahasiswa</label>
						<div class="col-sm-8"> 
							<span class="form-control bg-light"><a href=""><?php echo $post['name']; ?></a><small class="text-muted"> (<?php echo $post['nick_name']; ?>)</small></span>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Waktu Pendampingan</label>
						<div class="col-sm-8"> 
							<span class="form-control bg-light"><?php echo $day[$post['day']].', '.date_html($post['date']); ?> <small class="text-muted">(<?php echo time_html($post['start_at']) . ' - ' . time_html($post['end_at']); ?>)</small></span>
						</div>
					</div>
				<?php endif ?>
				<hr>
				<?php $this->fcontrol->show(); ?>
			</div>
			<div class="card-footer text-right">
				<button class="btn btn-primary" type="submit"><?php echo ($mode_add === true ? 'Input ' . ucwords($module_name) : 'Simpan Perubahan'); ?></button>
			</div>
		</form>
	</div>
</div>