<div class="content">
	<div class="content-header">
		<h2 class="content-title text-center">Dashboard</h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="row">
			<div class="col-md-4">
				<div class="card mb-3 border-primary">
					<div class="card-body py-3 bg-primary text-white">
						<i class="fa fa-fw fa-calendar-alt float-right fa-5x"></i>
						<h1 class="card-title mt-1"><?php echo $data_count['jadwal']; ?></h1>
						<span>Data Jadwal Pendampingan</span>
					</div>
					<div class="card-footer border-primary">
						<a href="<?php echo($group.'jadwal/pendampingan') ?>" class="btn-block text-primary">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- <div class="col-md-4">
				<div class="card mb-3 border-warning">
					<div class="card-body py-3 bg-warning text-white">
						<i class="fa fa-fw fa-calendar-times float-right fa-5x"></i>
						<h1 class="card-title mt-1"><?php echo $data_count['izin']; ?></h1>
						<span>Data Surat Izin</span>
					</div>
					<div class="card-footer border-warning">
						<a href="<?php echo($group.'izin') ?>" class="btn-block text-warning">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
			</div> -->
			<div class="col-md-4">
				<div class="card mb-3 border-success">
					<div class="card-body py-3 bg-success text-white">
						<i class="fa fa-fw fa-user-friends float-right fa-5x"></i>
						<h1 class="card-title mt-1"><?php echo $data_count['pendampingan']; ?></h1>
						<span>Data Pendampingan</span>
					</div>
					<div class="card-footer border-success">
						<a href="<?php echo($group.'pendampingan') ?>" class="btn-block text-success">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
		</div>
		<?php 
			$str_pendampingan = ($is_difabel === true ? 'pendampingan' : 'mendampingi');
			$str_jadwal = ($is_difabel === true ? 'kuliah' : 'kegiatan');
		?>
		<?php if ($data_active === false): ?>
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Pengajuan <?php echo ucwords($str_pendampingan); ?></h4>
				</div>
				<div class="card-body">
					<p class="mb-2 mt-1">
						Anda belum malakukan pengajuan <?php echo $str_pendampingan; ?> pada semesater ini. Silahkan melengkapi jadwal <?php echo $str_jadwal; ?> sebelum melakukan pengajuan.
					</p>
					<p class="mb-2">
						<a href="<?php echo $group ?>jadwal" class="btn btn-primary btn-sm"><i class="fa fa-fw fa-arrow-alt-circle-right mr-1"></i>Lengkapi jadwal dan melakukan pengajuan <?php echo $str_pendampingan; ?>.</a>
					</p>
				</div>
			</div>
		<?php elseif($data_active['approver_id'] === null): ?>
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Pengajuan <?php echo ucwords($str_pendampingan); ?></h4>
				</div>
				<div class="card-body">
					<p class="mb-2 mt-1">
						Pengajuan <?php echo $str_pendampingan; ?> telah diajukan, menunggu persetujuan.
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
						$data_doughnut['belum_datang']['value'] += $item['belum_datang'];
						$data_doughnut['selesai']['value'] += $item['selesai'];
						$data_doughnut['izin']['value'] += $item['izin'];
						$data_doughnut['tidak_datang']['value'] += $item['tidak_datang'];
					}
					?><script type="text/javascript">
						$(function () {
							var color = Chart.helpers.color;
							var barChartData = {
								labels: [<?php foreach ($data_grafik_pendampingan as $no => $value){
									if ($no > 0) {echo ", ";}
									echo '"' . date('M Y', strtotime($value['date'])) . '"';
								} ?>],
								datasets: [{
									label: 'Belum Datang',
									backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
									borderColor: window.chartColors.orange,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value){
										if ($no > 0) {echo ", ";}
										echo $value['belum_datang'];
									} ?>]
								}, {
									label: 'Mendampingi',
									backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
									borderColor: window.chartColors.green,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value){
										if ($no > 0) {echo ", ";}
										echo $value['selesai'];
									} ?>]
								}, {
									label: 'Izin',
									backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
									borderColor: window.chartColors.yellow,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value){
										if ($no > 0) {echo ", ";}
										echo $value['izin'];
									} ?>]
								}, {
									label: 'Tidak Mendampingi',
									backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
									borderColor: window.chartColors.red,
									borderWidth: 1,
									data: [<?php foreach ($data_grafik_pendampingan as $no => $value){
										if ($no > 0) {echo ", ";}
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
									labels: [<?php echo "'",implode("','", array_column($data_doughnut, 'label')), "'"; ?>]
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
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Jadwal Pendampingan <small class="text-muted"><i class="fas fa-angle-right mr-1"></i>Minggu ini</small></h4>
					<div>
						<a href="<?php echo $group ?>jadwal/pendampingan" class="btn btn-sm btn-primary"><i class="fas fa-eye mr-1"></i>Lihat Semua</a>
					</div>
				</div>
				<table class="table table-sm table-striped table-hover mb-0" datatables="">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($field_jadwal as $key => $item): ?>
								<th class="text-nowrap"><?php echo $item; ?></th>
							<?php endforeach ?>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1; $capability = current_user_session('capability'); foreach ($data_jadwal as $item): $id = current($item); ?>
							<tr>
								<td class="text-nowrap">
									<?php echo ($no++) ?>. 
								</td>
								<?php foreach ($field_jadwal as $key => $value): ?>
									<td><?php echo $item[$key]; ?></td>
								<?php endforeach ?>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
			<!-- /.card -->
			<div class="card mb-3">
				<div class="card-header d-flex justify-content-between align-items-center">
					<h4 class="card-title">Data Pendampingan <small class="text-muted"><i class="fas fa-angle-right mr-1"></i>Minggu ini</small></h4>
					<div>
						<a href="<?php echo $group ?>pendampingan" class="btn btn-sm btn-primary"><i class="fas fa-eye mr-1"></i>Lihat Semua</a>
					</div>
				</div>
				<table class="table table-sm table-striped table-hover mb-0 datatables-noorder-last">
					<thead>
						<tr>
							<th width="5" class="text-nowrap">
								No
							</th>
							<?php foreach ($field_pendampingan as $key => $item): ?>
								<th class="text-nowrap"><?php echo $item; ?></th>
							<?php endforeach ?>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($data_pendampingan as $no => $item): $id = current($item); ?>
							<tr>
								<td class="text-nowrap">
									<?php echo ($no + 1) ?>. 
								</td>
								<?php foreach ($field_pendampingan as $key => $value): ?>
									<td><?php echo $item[$key]; ?></td>
								<?php endforeach ?>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
			<!-- /.card -->
		<?php endif ?>
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