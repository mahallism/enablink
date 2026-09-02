<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Master <?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="card">
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">
					<a href="<?php echo $group.$module_main; ?>" class="text-muted"><i class="fa fa-angle-left mr-2"></i></a>
					<?php echo ucwords($module_name); ?>
				</h4>
				<div>
					<?php if (isset($action_url['input'])): ?>
						<a href="<?php echo $action_url['input']['url']; ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-plus-circle"></i> Add New</a>
					<?php endif ?>
				</div>
			</div>
			<div class="card-body border-bottom">
				<span><a href="<?php echo $group.'mahasiswa/edit/'.$data_mahasiswa['user_id'] ?>"><?php echo $data_mahasiswa['name']; ?> <small class="text-muted"></a>(<?php echo $data_mahasiswa['nick_name']; ?>)</small></span>
				<div>
					<?php echo $data_mahasiswa['faculty_name'] . ' - ' . $data_mahasiswa['majors_name']; ?>
				</div>
			</div>
			<table class="table table-sm table-striped table-hover mb-0" datatables="">
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
					<?php foreach ($data as $no => $item): $id = current($item);?>
						<?php if ($item[$action_url['duplicate']['id']] === null) continue; ?>
						<tr>
							<td class="text-nowrap">
								<?php echo ($no + 1) ?>. 
							</td>
							<?php foreach ($list_field as $key => $value): ?>
								<td><?php echo $item[$key]; ?></td>
							<?php endforeach ?>
							<?php if (isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete'])): ?>
								<td class="text-center text-nowrap">
									<?php if (isset($action_url['duplicate']) && isset($action_url['duplicate']['id']) && $item[$action_url['duplicate']['id']] !== null): ?>
										<a href="<?php echo $action_url['duplicate']['url'] . '/' . (isset($action_url['duplicate']['id'])? $item[$action_url['duplicate']['id']]: $id); ?>" class="text-muted"><i class="far fa-copy"></i></a>
									<?php endif ?>
									<?php if (isset($action_url['edit']) && isset($action_url['edit']['id']) && $item[$action_url['edit']['id']] !== null): ?> &nbsp;
										<a href="<?php echo $action_url['edit']['url'] . '/' . (isset($action_url['edit']['id'])? $item[$action_url['edit']['id']]: $id); ?>"><i class="fa fa-pencil-alt"></i></a>
									<?php endif ?>
									<?php if (isset($action_url['delete']['url'])): ?>
										<?php if (($id !== $can_delete_first) && protected_item($user_group[$action_url['delete']['protection']]) && isset($action_url['delete']['id']) && $item[$action_url['delete']['id']] !== null): ?> &nbsp;
											<a href="<?php echo $action_url['delete']['url'] . '/' . (isset($action_url['delete']['id'])? $item[$action_url['delete']['id']]: $id); ?>" onclick="return confirm('Apakah anda yakin akan menghapus data?')" class="text-danger"><i class="fa fa-trash"></i></a>
										<?php endif; ?>
									<?php endif ?>
								</td>
							<?php endif ?>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
		<!-- /.card -->
		<!-- Modal -->
		<div class="modal fade" id="filter" tabindex="-1" role="dialog" aria-labelledby="filterLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form class="modal-content" method="get" action="<?php echo $group.$module_main ?>">
					<div class="modal-header">
						<h5 class="modal-title" id="filterLabel">Form Filter</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<?php $this->fcontrol->show(); ?>
					</div>
					<div class="modal-footer">
						<a href="<?php echo $group.$module_main ?>?reset" class="btn btn-secondary">Reset Filter</a>
						<button class="btn btn-primary" type="submit">Filter Data</button>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var table = $('[datatables]').DataTable({
					columnDefs: [
					{ orderable: false, targets: -1 }
					],
					rowsGroup: [1, 2, 3]
				});
				table.draw(false);
			});
		</script>
	</div>
</div>