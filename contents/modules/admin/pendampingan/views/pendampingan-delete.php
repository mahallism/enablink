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
			<?php if (isset($data)): ?>
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">
						Data <?php echo ucwords($module_name); ?>
					</h4>
				</div>
				<table class="table table-sm table-striped table-hover mb-0 datatables">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($list_field as $key => $item): ?>
								<th class="text-nowrap"><?php echo $item; ?></th>
							<?php endforeach ?>
							<?php if (isset($action_url['edit']) || isset($action_url['delete'])): ?>
								<th class="text-nowrap" width="1">Aksi</th>
							<?php endif ?>
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
								<?php if (isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete'])): ?>
									<td class="text-center text-nowrap">
										<?php if (isset($action_url['duplicate']) && (!isset($action_url['duplicate']['id']) || (isset($action_url['duplicate']['id']) && $item[$action_url['duplicate']['id']] !== null))): ?>
											<a href="<?php echo $action_url['duplicate']['url'] . '/' . (isset($action_url['duplicate']['id'])? $item[$action_url['duplicate']['id']]: $id); ?>" class="text-muted"><i class="far fa-copy"></i></a>
										<?php endif ?>
										<?php if (isset($action_url['edit']) && (!isset($action_url['edit']['id']) || (isset($action_url['edit']['id']) && $item[$action_url['edit']['id']] !== null))): ?> &nbsp;
											<a href="<?php echo $action_url['edit']['url'] . '/' . (isset($action_url['edit']['id'])? $item[$action_url['edit']['id']]: $id); ?>"><i class="fa fa-pencil-alt"></i></a>
										<?php endif ?>
										<?php if (isset($action_url['delete']['url'])): ?>
											<?php if (($id !== $can_delete_first) && protected_item($user_group[$action_url['delete']['protection']]) && (!isset($action_url['delete']['id']) || (isset($action_url['delete']['id']) && $item[$action_url['delete']['id']] !== null))): ?> &nbsp;
												<a href="<?php echo $action_url['delete']['url'] . '/' . (isset($action_url['delete']['id'])? $item[$action_url['delete']['id']]: $id); ?>" onclick="return confirm('Apakah anda yakin akan menghapus data?')" class="text-danger"><i class="fa fa-trash"></i></a>
											<?php endif; ?>
										<?php endif ?>
									</td>
								<?php endif ?>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
				<div class="card-footer text-right">
					<button class="btn btn-danger" name="action" value="delete" type="submit">Delete Multi <?php echo ucwords($module_name); ?></button>
				</div>
			<?php endif ?>
		</form>
	</div>
</div>