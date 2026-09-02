<?php 
$str_pendampingan = ($is_difabel === true ? 'pendampingan' : 'mendampingi');
?><div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center"><?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="row">
			<div class="col-sm-9">
				<div class="card">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h4 class="card-title">Data <?php echo ucwords($module_name); ?></h4>
						<div>
							<?php if ($data_active === false && isset($action_url['input'])): ?>
								<a href="<?php echo $action_url['input']['url']; ?>" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-plus-circle"></i> Add New</a>
							<?php endif ?>
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
								<?php if ($data_active === false && (isset($action_url['edit']) || isset($action_url['delete']))): ?>
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
									<?php if ($data_active === false && (isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete']))): ?>
										<td class="text-center text-nowrap">
											<?php if (isset($action_url['detail'])): ?>
												<a href="<?php echo $action_url['detail']['url'] . '/' . (isset($action_url['detail']['id'])? $item[$action_url['detail']['id']]: $id); ?>"><i class="far fa-eye"></i></a>
											<?php endif ?>
											<?php if (isset($action_url['duplicate'])): ?> &nbsp;
												<a href="<?php echo $action_url['duplicate']['url'] . '/' . (isset($action_url['duplicate']['id'])? $item[$action_url['duplicate']['id']]: $id); ?>" class="text-muted"><i class="far fa-copy"></i></a>
											<?php endif ?>
											<?php if (isset($action_url['edit'])): ?> &nbsp;
												<a href="<?php echo $action_url['edit']['url'] . '/' . (isset($action_url['edit']['id'])? $item[$action_url['edit']['id']]: $id); ?>"><i class="fa fa-pencil-alt"></i></a>
											<?php endif ?>
											<?php if (isset($action_url['delete']['url'])): ?>
												<?php if (($id !== $can_delete_first) && protected_item($user_group[$action_url['delete']['protection']])): ?> &nbsp;
													<a href="<?php echo $action_url['delete']['url'] . '/' . (isset($action_url['delete']['id'])? $item[$action_url['delete']['id']]: $id); ?>" onclick="return confirm('Apakah anda yakin akan menghapus data?')" class="text-danger"><i class="fa fa-trash"></i></a>
												<?php endif; ?>
											<?php endif ?>
										</td>
									<?php endif ?>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
					<script type="text/javascript">
						$(function() {
							var table = $('[datatables]').DataTable({
								columnDefs: [
								{ orderable: false, targets: -1 }
								],
								rowsGroup: [1]
							});
							table.draw(false);
						});
					</script>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">Pendampingan</h4>
					</div>
					<div class="card-body py-3">
						<?php if ($data_active === false): ?>
							<p>
								Silahkan melengkapi <?php echo $module_name; ?> sebelum melakukan pengajuan <?php echo $str_pendampingan; ?>.
							</p>
							<p class="text-danger">
								<i class="fa fa-fw fa-info-circle mr-1"></i>Data <?php echo $module_name; ?> yang sudah diajukan tidak dapat dirubah, perubahan hanya bisa dilakukan oleh admin.
							</p>
							<?php if (count($data) > 0): ?>
								<a href="<?php echo $group.$module_main ?>/active" onclick="return confirm('Data <?php echo $module_name; ?> tidak bisa diubah setelah pengajuan <?php echo $str_pendampingan; ?>')" class="btn btn-sm btn-primary">Ajukan Pendampingan</a>
							<?php endif ?>
						<?php elseif($data_active['approver_id'] === null): ?>
							<p>
								Pengajuan <?php echo $str_pendampingan; ?> telah diajukan, menunggu persetujuan.
							</p>
						<?php else: ?>
							<p>
								Pengajuan <?php echo $str_pendampingan; ?> telah disetujui.
								Jadwal pendampingan akan ditambahkan secara berkala.
							</p>
							<p>
								<a href="<?php echo $group ?>jadwal/pendampingan" class="btn btn-sm btn-primary">Jadwal Pendampingan</a>
							</p>
							<!-- <p class="text-danger">
								<i class="fa fa-fw fa-info-circle mr-1"></i>Apabila tidak bisa hadir diharuskan untuk membuat surat izin.
							</p>
							<a href="<?php echo $group ?>izin/input" class="btn btn-sm btn-primary">Buat Surat Izin</a> -->
						<?php endif ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>