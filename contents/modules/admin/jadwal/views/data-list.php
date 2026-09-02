<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Master <?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
        <?php echo $errors; ?>
	</div>
	<div class="content-body">
		<div class="card">
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">Data <?php echo ucwords($module_name); ?></h4>
				<div>
					<?php if(isset($current_url)){ ?>
                        <a href="<?php echo $current_url.'/generate';?>" onclick="return confirm('Seluruh Jadwal pendampingan akan tereset (dimulai dari hari ini/tgl kuliah dimulai)?')" class="btn btn-sm btn-indigo">
                            <i class="fa fa-fw fa-cogs"></i> Generate Jadwal Semester
                        </a>
                    <?php } ?>
                    <?php if(isset($jadwal_ujian_url)){ ?>
                        <a href="<?php echo $jadwal_ujian_url; ?>/generate" class="btn btn-sm btn-indigo">
                            <i class="fa fa-fw fa-cogs"></i> Generate Jadwal Range Tanggal
                        </a>
                    <?php } ?>
					
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#filter">
						<i class="fa fa-fw fa-filter"></i> Filter Data
					</button>
					<?php if (isset($action_url['export'])): ?>
						<a href="<?php echo $action_url['export']['url']; ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-file-excel"></i> Export Data</a>
					<?php endif ?>
					<?php if (isset($action_url['input'])): ?>
						<a href="<?php echo $action_url['input']['url']; ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-plus-circle"></i> Add New</a>
					<?php endif ?>
				</div>
			</div>
			<table class="table table-sm table-hover mb-0 w-100" datatables="">
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
                    dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
                        "<'row'<'col-sm-12'<'table-responsive'tr>>>" +
                        "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>" +
						"<'row'<'col-md-12'B>>",
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ],
                    order: [[0  , 'asc']],
                    columnDefs: [{ targets: [1], visible: false},],
                    rowGroup: {
                        dataSrc: 1,
                    }
				});
				table.draw(false);
			});
		</script>
	</div>
</div>