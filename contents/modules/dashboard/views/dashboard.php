<div class="content">
	<div class="content-header">
		<h2 class="content-title text-center">Dashboard</h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="row">
			<div class="col-md-3">
				<div class="card mb-3 border-primary">
					<div class="card-body py-3 bg-primary text-white">
						<i class="fa fa-fw fa-calendar-alt float-right fa-5x"></i>
						<h1 class="card-title mt-1">
							<?php echo $data_count['jadwal']; ?>
						</h1>
						<span>Jadwal Pendampingan</span>
					</div>
					<div class="card-footer border-primary">
						<a href="<?php echo ($group . 'jadwal/pendampingan') ?>" class="btn-block text-primary">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-3">
				<div class="card mb-3 border-warning">
					<div class="card-body py-3 bg-warning text-white">
						<i class="fa fa-fw fa-calendar-times float-right fa-5x"></i>
						<h1 class="card-title mt-1">
							<?php echo $data_count['izin']; ?>
						</h1>
						<span>Surat Izin</span>
					</div>
					<div class="card-footer border-warning">
						<a href="<?php echo ($group . 'izin') ?>" class="btn-block text-warning">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card mb-3 border-success">
					<div class="card-body py-3 bg-success text-white">
						<i class="fa fa-fw fa-user-friends float-right fa-5x"></i>
						<h1 class="card-title mt-1">
							<?php echo $data_count['pendampingan']; ?>
						</h1>
						<span>Pendampingan</span>
					</div>
					<div class="card-footer border-success">
						<a href="<?php echo ($group . 'pendampingan') ?>" class="btn-block text-success">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card mb-3 border-info">
					<div class="card-body py-3 bg-info text-white">
						<ul class="pl-4">
							<li>Kuliah:
								<?php echo date("d M y", strtotime($semester['start_at'])) . " - " . date("d M y", strtotime($semester['end_at'])); ?>
							</li>
							<?php if (!empty($semester['uts_start_at'])) { ?>
								<li>UTS:
									<?php echo date("d M y", strtotime($semester['uts_start_at'])) . " - " . date("d M y", strtotime($semester['uts_end_at'])); ?>
								</li>
							<?php } ?>
							<?php if (!empty($semester['uas_start_at'])) { ?>
								<li>UAS:
									<?php echo date("d M y", strtotime($semester['uas_start_at'])) . " - " . date("d M y", strtotime($semester['uas_end_at'])); ?>
								</li>
							<?php } ?>
						</ul>
					</div>
					<div class="card-footer border-info">
						<?php echo $semester['semester_name']; ?>
					</div>
				</div>
			</div>
			<!---->
		</div>
		<?php
		$str_pendampingan = ($is_difabel === true ? 'pendampingan' : 'mendampingi');
		$str_jadwal = ($is_difabel === true ? 'kuliah' : 'kegiatan');
		?>
		<?php if ($data_active === false): ?>
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Pengajuan
						<?php echo ucwords($str_pendampingan); ?>
					</h4>
				</div>
				<div class="card-body">
					<p class="mb-2 mt-1">
						Anda belum malakukan pengajuan
						<?php echo $str_pendampingan; ?> pada semesater ini. Silahkan melengkapi jadwal
						<?php echo $str_jadwal; ?> sebelum melakukan pengajuan.
					</p>
					<p class="mb-2">
						<a href="<?php echo $group ?>jadwal" class="btn btn-primary btn-sm"><i
								class="fa fa-fw fa-arrow-alt-circle-right mr-1"></i>Lengkapi jadwal dan melakukan pengajuan
							<?php echo $str_pendampingan; ?>.
						</a>
					</p>
				</div>
			</div>
		<?php elseif ($data_active['approver_id'] === null): ?>
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Pengajuan
						<?php echo ucwords($str_pendampingan); ?>
					</h4>
				</div>
				<div class="card-body">
					<p class="mb-2 mt-1">
						Pengajuan
						<?php echo $str_pendampingan; ?> telah diajukan, menunggu persetujuan.
					</p>
				</div>
			</div>
		<?php else: ?>
			<?php if (current_user_session('capability') === 'volunteer'): ?>
				<div class="card mb-3">
					<div class="card-header">
						<h4 class="mt-1 mb-0">
							Grafik Pendampingan
						</h4>
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
							<div class="col-sm-9">
								<canvas id="chart" width="100%" height="40"></canvas>
							</div>
							<div class="col-sm-3">
								<canvas class="chart" id="doughnut-chart" height="300"></canvas>
							</div>
						</div>
					</div>
					<?php
					$data_doughnut = array(
						'terjadwal' => array(
							'value' => 0,
							'label' => 'Terjadwal',
							'bg' => 'color(window.chartColors.green).alpha(0.5).rgbString()',
							'border' => 'window.chartColors.green',
						),
						'belum_datang' => array(
							'value' => 0,
							'label' => 'Belum Datang',
							'bg' => 'color(window.chartColors.orange).alpha(0.5).rgbString()',
							'border' => 'window.chartColors.orange',
						),
						'selesai' => array(
							'value' => 0,
							'label' => 'Mendampingi',
							'bg' => 'color(window.chartColors.green).alpha(0.5).rgbString()',
							'border' => 'window.chartColors.green',
						),
						'izin' => array(
							'value' => 0,
							'label' => 'Izin',
							'bg' => 'color(window.chartColors.yellow).alpha(0.5).rgbString()',
							'border' => 'window.chartColors.yellow',
						),
						'tidak_datang' => array(
							'value' => 0,
							'label' => 'Tidak Mendampingi',
							'bg' => 'color(window.chartColors.red).alpha(0.5).rgbString()',
							'border' => 'window.chartColors.red',
						),
					);
					foreach ($data_grafik_pendampingan as $item) {
						$data_doughnut['terjadwal']['value'] += $item['terjadwal'];
						$data_doughnut['belum_datang']['value'] += $item['belum_datang'];
						$data_doughnut['selesai']['value'] += $item['selesai'];
						$data_doughnut['izin']['value'] += $item['izin'];
						$data_doughnut['tidak_datang']['value'] += $item['tidak_datang'];
					}
					?>
					<script type="text/javascript">
						$(function () {
							var color = Chart.helpers.color;
							var barChartData = {
								labels: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
									if ($no > 0) {
										echo ", ";
									}
									echo '"' . date('M Y', strtotime($value['date'])) . '"';
								} ?>],
								datasets: [{
									label: 'Terjadwal',
									backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
									borderColor: window.chartColors.green,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
										if ($no > 0) {
											echo ", ";
										}
										echo $value['terjadwal'];
									} ?>]
								}, {
									label: 'Belum Datang',
									backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
									borderColor: window.chartColors.orange,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
										if ($no > 0) {
											echo ", ";
										}
										echo $value['belum_datang'];
									} ?>]
								}, {
									label: 'Mendampingi',
									backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
									borderColor: window.chartColors.green,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
										if ($no > 0) {
											echo ", ";
										}
										echo $value['selesai'];
									} ?>]
								}, {
									label: 'Izin',
									backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
									borderColor: window.chartColors.yellow,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
										if ($no > 0) {
											echo ", ";
										}
										echo $value['izin'];
									} ?>]
								}, {
									label: 'Tidak Mendampingi',
									backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
									borderColor: window.chartColors.red,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value) {
										if ($no > 0) {
											echo ", ";
										}
										echo $value['tidak_datang'];
									} ?>]
								}]
							};
							var ctx = document.getElementById("chart").getContext("2d");
							ctx.height = 40;
							window.myBar = new Chart(ctx, {
								type: 'bar',
								data: barChartData,
								options: {
									responsive: true,
									legend: {
										position: 'top',
									},
									title: {
										display: false,
									},
									scales: {
										yAxes: [{
											ticks: {
												beginAtZero: true,
											}
										}]
									}
								}
							});
							var chart3 = document.getElementById("doughnut-chart").getContext("2d");
							window.myDoughnut = new Chart(chart3, {
								type: 'doughnut',
								data: {
									datasets: [{
										data: [<?php echo implode(',', array_column($data_doughnut, 'value')); ?>],
										backgroundColor: [<?php echo implode(',', array_column($data_doughnut, 'bg')); ?>],
										borderColor: [<?php echo implode(',', array_column($data_doughnut, 'border')); ?>],
										borderWidth: [1, 1, 1, 1],
									}],
									labels: [<?php echo "'", implode("','", array_column($data_doughnut, 'label')), "'"; ?>]
								},
								options: {
									responsive: true,
									segmentShowStroke: false
								}
							});
						});
					</script>
				</div>
			<?php endif ?>

			<?php if ($capability == 'volunteer'): ?>
    <div class="card mb-3">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4 class="card-title mb-0">Ajuan Pendampingan</h4>
			<br>
            <!-- <small class="text-muted"><i class="fas fa-angle-right"></i></small> -->
			
        </div>
		<div class="alert alert-warning" role="alert">
			Jika ada lebih dari satu pengajuan dengan waktu yang bertabrakan. Silakan pilih salah satu untuk diterima dan tolak yang lain.
			</div>
        <div class="card-body p-0">
            <table class="table table-sm table-striped table-hover mb-0" datatables="">
                <thead >
                    <tr>
                        <th width="5" class="text-nowrap">No</th>
                        <?php foreach ($field_ajuan as $key => $label): ?>
                            <th class="text-nowrap"><?php echo $label; ?></th>
                        <?php endforeach ?>
                        <th class="text-nowrap text-center">Action</th>
                    </tr>
                </thead>

                <tbody>
                    <?php $no = 1; ?>
                    <?php foreach ($data_pergantian as $item): ?>
                        <tr>
                            <td class="text-nowrap"><?php echo ($no++); ?>.</td>
                            <?php foreach ($field_ajuan as $key => $label): ?>
                                <td><?php echo isset($item[$key]) ? $item[$key] : '-'; ?></td>
                            <?php endforeach ?>
                            <td class="text-center">
                                <?php if ($capability == 'volunteer'): ?>
                                    <button type="button" class="btn btn-sm btn-success btn-terima mx-1"
                                        title="Terima Ajuan"
										id="responAjuan"
                                        data-s_id="<?php echo $item['s_id']; ?>"
										data-email_pengaju="<?php echo $item['email_pengaju']; ?>"
                                        data-s_jd_id="<?php echo $item['s_jd_id']; ?>"
                                        data-volunteer_id="<?php echo $this->user_data['student_id']; ?>">
                                        <i class="fa fa-check"></i> Terima
                                    </button>
                                    
                                    <button type="button" class="btn btn-sm btn-danger btn-tolak mx-1"
                                        title="Tolak Ajuan"
										id="responAjuan"
										data-email_pengaju="<?php echo $item['email_pengaju']; ?>"
                                        data-s_id="<?php echo $item['s_id']; ?>">
                                        <i class="fa fa-times"></i> Tolak
                                    </button>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
<?php endif; ?>



			

			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Jadwal Pendampingan <small class="text-muted"><i
								class="fas fa-angle-right mr-1"></i>Minggu ini</small></h4>
					<div>
						<a href="<?php echo $group ?>jadwal/pendampingan" class="btn btn-sm btn-primary"><i
								class="fas fa-eye mr-1"></i>Lihat Semua</a>
					</div>
				</div>
				<table class="table table-sm table-striped table-hover mb-0" datatables="">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($field_jadwal as $key => $item): ?>
								<th class="text-nowrap">
									<?php echo $item; ?>
								</th>
							<?php endforeach ?>

							<?php if ($capability == 'difabel') { ?>
								<th>Review</th>
							<?php } else if ($capability == 'volunteer') { ?>
									<th>Present</th>
							<?php } ?>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1;
						$capability = current_user_session('capability');
						foreach ($data_jadwal as $item):
							$id = current($item); ?>
							<tr>
								<td class="text-nowrap">
									<?php echo ($no++) ?>.
								</td>
								<?php foreach ($field_jadwal as $key => $value): ?>
									<td>
										<?php echo $item[$key]; ?>
									</td>
								<?php endforeach ?>

								<td class="text-center">
									<?php if ($capability == 'difabel') { ?>
										<?php if (in_array(strtolower($item['volunteer_status']), array('terjadwal'))) { ?>
											<button type="button" class="btn btn-sm btn-primary" disabled><i
													class="fa fa-star"></i></button>
										<?php }
										if (in_array(strtolower($item['volunteer_status']), array('hadir'))) { ?>
											<?php if ($item['review'] == null) { ?>
												<button type="button" class="btn btn-sm btn-primary btn-review" data-toggle="tooltip"
													title="Review Kehadiran"
													data-accompaniment_id="<?php echo $item['accompaniment_id']; ?>" -><i
														class="fa fa-star"></i></button>
											<?php } else { ?>
												<div class="rating-readonly" data-rating="<?php echo $item['review']; ?>"></div>
											<?php } ?>
										<?php } ?>
									<?php } else if ($capability == 'volunteer') { ?>
										<?php if ($item['volunteer_status'] == 'terjadwal') { ?>
												<button class="btn btn-primary btn-sm btn-presensi" data-toggle="tooltip"
													title="Konfirmasi Kehadiran"
													data-accompaniment_id="<?php echo $item['accompaniment_id']; ?>"><i
														class="fa fa-check"></i></button>
										<?php } else {
											echo $item['volunteer_status'];
										} ?>
									<?php } ?>
								</td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
			<!-- /.card -->
			<div class="card mb-3">
			<!-- <pre><?php print_r($data_pendampingan); ?></pre> -->
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Data Pendampingan <small class="text-muted"><i
								class="fas fa-angle-right mr-1"></i>Minggu ini</small></h4>
					<div>
						<a href="<?php echo $group ?>pendampingan" class="btn btn-sm btn-primary"><i
								class="fas fa-eye mr-1"></i>Lihat Semua</a>
					</div>
				</div>

				<table class="table table-sm table-striped table-hover mb-0 datatables-noorder-last">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($field_pendampingan as $key => $item): ?>
								<th class="text-nowrap">
									<?php echo $item; ?>
								</th>
							<?php endforeach ?>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($data_pendampingan as $no => $item):
							$id = current($item); ?>
							<tr>
								<td class="text-nowrap">
									<?php echo ($no + 1) ?>.
								</td>
								<?php foreach ($field_pendampingan as $key => $value): ?>
									<td>
										<?php echo $item[$key]; ?>
									</td>
								<?php endforeach ?>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
			<!-- /.card -->
		<?php endif ?>

		<?php if ($capability == 'difabel') { ?>
			<div class="modal fade" id="modal_review" tabindex="-1" role="dialog" aria-labelledby="filterLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<form class="modal-content" method="post" action="<?php echo $group . 'dashboard/review' ?>">
						<div class="modal-header">
							<h5 class="modal-title" id="filterLabel">Review Pendampingan</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" name="accompaniment_id">
							<div class="text-center mb-1">
								<input type="hidden" name="review">
								<div id="review-accompanimen"></div>
							</div>
							<div>
								<textarea class="form-control" name="review_note"
									placeholder="Catatan review pendampingan"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		<?php } ?>
		<?php if ($capability == 'volunteer') { ?>
			<div class="modal fade" id="modal_presensi" tabindex="-1" role="dialog" aria-labelledby="filterLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<form class="modal-content" method="post" action="<?php echo $group . 'dashboard/present' ?>">
						<div class="modal-header">
							<h5 class="modal-title" id="filterLabel">Konfirmasi Kehadiran</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>6 Digit Kode Pendampingan <small><b>(* Didapat dari volunteer</b></small></label>
								<input type="hidden" name="accompaniment_id">
								<input type="number" class="form-control text-center" min="100000" max="999999"
									name="code_attending" style="letter-spacing: 30px;font-size: 30px;font-weight: bold;"
									required>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		<?php } ?>

		<script type="text/javascript">
			$(function () {
				$("[data-toggle='tooltip']").tooltip();
				var table = $('[datatables]').DataTable({
					columnDefs: [
						{ orderable: false, targets: -1 }
					],
					rowsGroup: [1],
					drawCallback: function (settings) {
						$(".rating-readonly").starRating({ readOnly: true, starShape: 'rounded', starSize: 15, });
					}
				});
				table.draw(false);

				$('.tab-pane.fade').each(function ($i, $e) {
					var el = $(this);
					if ($i > 0) {
						el.removeClass('show');
						el.removeClass('active');
					}
				});

				if ($("#modal_presensi").length > 0) {
					$(document).on("click", ".btn-presensi", function (e) {
						$("#modal_presensi [name='accompaniment_id']").val($(this).data('accompaniment_id'));
						$("#modal_presensi").modal('show');
					});
				}

				if ($("#modal_review").length > 0) {
					$(document).on("click", ".btn-review", function (e) {
						$("#modal_review [name='accompaniment_id']").val($(this).data('accompaniment_id'));
						$("#modal_review").modal('show');
					});
					$("#review-accompanimen").starRating({
						totalStars: 5,
						starShape: 'rounded',
						starSize: 40,
						// emptyColor: 'lightgray',
						disableAfterRate: false,
						callback: function (currentRating, $el) {
							$("#modal_review [name='review']").val(currentRating);
						}
					});
				}
				// Tombol Terima
				$(".btn-terima").on('click', function () {
					const id = $(this).data('s_id');
					const jadwal_id = $(this).data('s_jd_id');
					const volunteer_id = $(this).data('volunteer_id');
					const email_pengaju = $(this).data('email_pengaju');
					const $btn = $(this);
					const $row = $btn.closest('tr');
    $row.find('button').prop('disabled', true);
	$btn.text('Diproses...');
					$.post("<?= site_url('/pergantian/pergantian_volunteer/terima'); ?>", {
						ajuan_id: id,
						volunteer_id: volunteer_id,
						jadwal_id: jadwal_id,
						email_pengaju : email_pengaju
					}, function (response) {
						console.log("RAW RESPONSE:", response);
						const parts = response.split('|');
    					const status = parts[0];
    					const message = parts[1];

    					alert(message);
						location.reload();
					}).fail(function () {
						alert('Terjadi kesalahan');
					}).always(function() {
        $btn.prop('disabled', false).text('Terima');
    });
				});

				// Tombol Tolak
				$(".btn-tolak").on('click', function () {
					
					const id = $(this).data('s_id');
					const email_pengaju = $(this).data('email_pengaju');
					const $btn = $(this);
					const $row = $btn.closest('tr');
    $row.find('button').prop('disabled', true);
	$btn.text('Diproses...');
					$.post("<?php echo site_url('/pergantian/pergantian_volunteer/tolak'); ?>", { 
						ajuan_id: id ,
						email_pengaju : email_pengaju,
					}, function (response) {
						console.log("RAW RESPONSE:", response);
						const parts = response.split('|');
    					const status = parts[0];
    					const message = parts[1];

    					alert(message);
						location.reload();
						}).fail(function (xhr, status, error) {
                                    console.error("AJAX Error:", status, error);
                                    console.log("Response Text:", xhr.responseText)
						}).always(function() {
        $btn.prop('disabled', false).text('Tolak');
    });	
				});
			});

		</script>
	</div>
</div>