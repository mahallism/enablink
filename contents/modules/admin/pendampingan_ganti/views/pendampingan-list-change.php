<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center">Master <?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
		<?php echo $errors; ?>
	</div>
	<div class="content-body">
		<div class="card">
			<div class="card-header d-flex flex-column">
				<div class="d-flex justify-content-between align-items-center mb-2">
					<h4 class="card-title">Data <?php echo ucwords($module_name); ?></h4>
				</div>
				<ul class="nav nav-tabs card-header-tabs px-2">
					<?php unset($get_data[$key_tab]);
					foreach ($tab as $id => $item) : ?>
						<li class="nav-item">
							<a href="<?php echo $group, $module_main . "/index_volunteer_change";
										array_to_get_url($get_data + array($key_tab => $id)) ?>" class="nav-link py-1<?php echo ($tab_id == $id ? ' active' : '') ?>"><?php echo $item; ?></a>
						</li>
					<?php endforeach ?>
				</ul>
			</div>
			<div class="table-responsive">
				<table class="table table-sm table-striped table-hover mb-0" datatables="">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($list_field as $key => $item) : ?>
								<th class="text-nowrap"><?php echo $item; ?></th>
							<?php endforeach ?>
							<th class="text-nowrap">Pendamping Asli</th>
							<th class="text-nowrap">Pendamping Pengganti</th>
							<th class="text-nowrap">Status Penggantian</th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1;
						foreach ($data as $item) : $id = current($item); ?>
							<tr class="">
								<td class="text-nowrap">
									<?php echo ($no++) ?>.
								</td>
								<?php foreach ($list_field as $key => $value) : ?>
									<td><?php echo $item[$key]; ?></td>
								<?php endforeach ?>
								<td><?php echo $item['nama_pendamping_lama']; ?></td>
								<td><?php echo $item['nama_pendamping_baru']; ?></td>
								<td><?php echo $item['volunteer_change_status']; ?></td>

							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.card -->
		<script type="text/javascript">
			$(function() {
				var table = $('.table').DataTable({
					dom: 'Bfrtip',
					buttons: [
						'copy', 'csv', 'excel', 'pdf', 'print'
					],
					columnDefs: [{
						orderable: false,
						targets: -1
					}],
					rowsGroup: [1, 2, 3],

				});
				table.draw(false);
			});
		</script>
	</div>
</div>