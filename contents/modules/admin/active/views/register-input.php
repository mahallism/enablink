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
			<table class="table table-sm table-striped table-hover mb-0 datatables-noorder-last">
				<thead>
					<tr>
						<th width="5" class="text-nowrap">
							No
						</th>
						<?php foreach ($list_field as $key => $item): ?>
							<th class="text-nowrap"><?php echo $item; ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($data as $no => $item): $id = current($item); ?>
						<tr>
							<td class="text-nowrap">
								<?php echo ($no + 1) ?>. 
							</td>
							<?php foreach ($list_field as $key => $value): ?>
								<td><?php echo $item[$key]; ?></td>
							<?php endforeach ?>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
			<div class="card-footer">
				<div class="form-inline d-flex justify-content-end">
					<div class="form-check my-2 mr-sm-3">
						<input class="form-check-input" name="approved" type="checkbox" id="approved">
						<label class="form-check-label" for="approved">
							Setujui yang tidak mengajukan
						</label>
					</div>
					<button class="btn btn-primary" type="submit"><?php echo ($mode_add === true ? 'Input ' . ucwords($module_name) : 'Simpan Perubahan'); ?></button>
				</div>
			</div>
		</form>
	</div>
</div>