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
					Generate <?php echo ucwords($module_name); ?>
				</h4>
			</div>
			<?php echo $errors; ?>
			<div class="card-body">
				<?php $this->fcontrol->show(); ?>
			</div>
			<?php if (empty($data_pendampingan) === false): ?>
				<div class="card-header">
					<h4 class="card-title">
						Hasil Generate
					</h4>
					<ul class="nav nav-tabs card-header-tabs px-2">
						<?php $no = 1; foreach ($data_pendampingan['label'] as $i => $item): ?>
							<?php if (isset($data_pendampingan['result'][$i])): ?>
								<li class="nav-item">
									<a class="nav-link<?php if($no++ === 1) echo ' active' ?>" data-toggle="tab" href="#tab<?php echo $i; ?>"><?php echo $item; ?></a>
								</li>
							<?php endif ?>
						<?php endforeach ?>
					</ul>
				</div>
				<div class="tab-content">
					<?php $no = 1; foreach ($data_pendampingan['result'] as $i => $item_data): ?>
						<div class="tab-pane fade show active" id="tab<?php echo $i; ?>">
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
									<?php $no = 1; foreach ($item_data as $item): $id = current($item); ?>
										<tr class="">
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
					<?php endforeach ?>
				</div>
				<input type="hidden" name="accompaniment[start_at]" value="<?php echo $post['start_at'] ?>">
				<input type="hidden" name="accompaniment[end_at]" value="<?php echo $post['end_at'] ?>">
				<?php $no = 0; foreach ($data_pendampingan['result'] as $item): ?>
					<?php foreach ($item as $item_acc): ?>
						<?php if (isset($item_acc['volunteer_id'])): ?>
							<input type="hidden" name="accompaniment[data][<?php echo $no; ?>][semester_id]" value="<?php echo $item_acc['semester_id'] ?>">
							<input type="hidden" name="accompaniment[data][<?php echo $no; ?>][schedule_student_id]" value="<?php echo $item_acc['schedule_student_id'] ?>">
							<input type="hidden" name="accompaniment[data][<?php echo $no; ?>][date]" value="<?php echo $item_acc['date'] ?>">
							<input type="hidden" name="accompaniment[data][<?php echo $no++; ?>][volunteer_id]" value="<?php echo $item_acc['volunteer_id'] ?>">
						<?php endif ?>
					<?php endforeach ?>
				<?php endforeach ?>
				<div class="card-footer text-right">
					<button class="btn btn-primary" type="submit" name="action" value="use">Gunakan <?php echo ucwords($module_name); ?></button>
				</div>
			<?php endif ?>
		</form>
		<script type="text/javascript">
			$(function() {
				var table = $('[datatables]').DataTable({
					rowsGroup: [1, 2, 3]
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