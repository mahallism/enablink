<div class="content max-<?php echo $size; ?>-container">
	<div class="content-header">
		<h2 class="content-title text-center"><?php echo ucwords($module_name); ?></h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="card">
			<div class="card-header d-flex justify-content-between align-items-center">
				<h4 class="card-title">Data <?php echo ucwords($module_name); ?></h4>
				<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" id="sekarang-tab" data-toggle="tab" href="#sekarang" role="tab" aria-controls="sekarang" aria-selected="true">Sekarang</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="sebelumnya-tab" data-toggle="tab" href="#sebelumnya" role="tab" aria-controls="sebelumnya" aria-selected="false">Sebelumnya</a>
					</li>
				</ul>
			</div>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="sekarang" role="tabpanel" aria-labelledby="sekarang-tab">
					<table class="table table-sm table-striped table-hover mb-0" datatables="">
						<thead>
							<tr>
								<th width="5" class="text-nowrap">
									No
								</th>
								<?php foreach ($list_field as $key => $item): ?>
									<th class="text-nowrap"><?php echo $item; ?></th>
								<?php endforeach ?>
								<th class="text-nowrap" width="1">Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no = 1; $capability = current_user_session('capability'); foreach ($data as $item): $id = current($item); ?>
								<?php if (strtotime($item['date']) < strtotime(date('Y-m-d'))) continue; ?>
								<tr>
									<td class="text-nowrap">
										<?php echo ($no++) ?>. 
									</td>
									<?php foreach ($list_field as $key => $value): ?>
										<td><?php echo $item[$key]; ?></td>
									<?php endforeach ?>
									<td class="text-nowrap">
										<?php if ($capability === 'difabel'): ?>
											<?php if (in_array($item['student_status'], array('Dijadawalkan', 'Dilihat', 'Dikonfirmasi'))): ?>
												<?php if (in_array($item['student_status'], array('Dijadawalkan', 'Dilihat'))): ?>
													<a href="<?php echo $group.$module_main.'/confirm/'.current($item) ?>"><i class="fas fa-check mr-1"></i>Konfirm</a> &nbsp;
												<?php endif ?>
												<a href="<?php echo $group.'izin/input/'.current($item) ?>"><i class="far fa-envelope mr-1"></i>Izin</a>
											<?php else: ?> -
											<?php endif ?>
										<?php else: ?>
											<?php if (in_array($item['volunteer_status'], array('Dijadawalkan', 'Dilihat', 'Dikonfirmasi'))): ?>
												<a href="<?php echo $group.'izin/input/'.current($item) ?>"><i class="far fa-envelope mr-1"></i>Izin</a>
											<?php else: ?> -
											<?php endif ?>
										<?php endif ?>
									</td>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade show active" id="sebelumnya" role="tabpanel" aria-labelledby="sebelumnya-tab">
					<table class="table table-sm table-striped table-hover mb-0" datatables="">
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
							<?php $no = 1; foreach ($data as $item): $id = current($item); ?>
								<?php if (strtotime($item['date']) >= strtotime(date('Y-m-d'))) break; ?>
								<tr>
									<td class="text-nowrap">
										<?php echo ($no++) ?>. 
									</td>
									<?php foreach ($list_field as $key => $value): ?>
										<td><?php echo $item[$key]; ?></td>
									<?php endforeach ?>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /.card -->
		<script type="text/javascript">
			$(function() {
				var table = $('[datatables]').DataTable({
					columnDefs: [
					{ orderable: false, targets: -1 }
					],
					rowsGroup: [1]
				});
				table.draw(false);

				$('.tab-pane.fade').each(function($i, $e) {
					var el = $(this);
					if ($i > 0) {
						el.removeClass('show');
						el.removeClass('active');
					}
				});
			});
		</script>
	</div>
</div>