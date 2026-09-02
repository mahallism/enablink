<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Setting</h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<form class="card" method="post" enctype="multipart/form-data" <?php if (isset($form_action) && $form_action) echo 'action="' . $form_action . '"'; ?>>
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">
					Setting <?php echo ucwords($module_name); ?>
				</h4>
			</div>
			<?php echo $errors; ?>
			<div class="card-body">
				<?php $this->fcontrol->show(); ?>
			</div>
			<div class="card-footer text-right">
				<button class="btn btn-primary" type="submit">Simpan Perubahan</button>
			</div>
		</form>
	</div>
</div>

<script type='text/javascript'>
	tinymce.init({
		selector: 'textarea',
		menubar: '',
		theme: 'modern'
	});
</script>