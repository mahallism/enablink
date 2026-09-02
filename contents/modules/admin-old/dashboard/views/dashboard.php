<div class="content max-xl-container">
	<div class="content-header">
		<h2 class="content-title text-center">Dashboard</h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="form-row">
			<div class="col-md-3">
				<div class="card mb-3 border-primary">
					<div class="card-body py-3 bg-primary text-white">
						<i class="fa fa-fw fa-calendar-alt float-right fa-4x"></i>
						<h5 class="card-title h2 mt-1"><?php echo $data_count['jadwal']; ?></h5>
						<span>Jadwal Pendampingan</span>
					</div>
					<div class="card-footer border-primary">
						<a href="<?php echo($group.'pendampingan') ?>" class="btn-block text-primary">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-3">
				<div class="card mb-3 border-danger">
					<div class="card-body py-3 bg-danger text-white">
						<i class="fa fa-fw fa-calendar-times float-right fa-4x"></i>
						<h5 class="card-title h2 mt-1">
                            <?php echo $data_count['surat_izin']; ?>
                            <?php echo !empty($data_count['surat_izin_aktif']) ? "<small>/".$data_count['surat_izin_aktif']." Belum Diverifikasi</small>" : ""?>
                        </h5>
						<span>Data Surat Izin</span>
					</div>
					<div class="card-footer border-danger">
						<a href="<?php echo($group.'izin') ?>" class="btn-block text-danger">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-3">
				<div class="card mb-3 border-success">
					<div class="card-body py-3 bg-success text-white">
						<i class="fa fa-fw fa-user-friends float-right fa-4x"></i>
						<h5 class="card-title h2 mt-1"><?php echo $data_count['pendampingan']; ?></h5>
						<span>Data Pendampingan</span>
					</div>
					<div class="card-footer border-success">
						<a href="<?php echo($group.'report/pendampingan') ?>" class="btn-block text-success">
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
						<i class="fa fa-fw fa-graduation-cap float-right fa-4x"></i>
						<h5 class="card-title h2 mt-1"><?php echo $data_count['mahasiswa']; ?></h5>
						<span>Data Mahasiswa</span>
					</div>
					<div class="card-footer border-warning">
						<a href="<?php echo($group.'mahasiswa') ?>" class="btn-block text-warning">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
		</div>
	    <!-- /.row -->
		<div class="form-row">
			<div class="col-md-4">
				<div class="card mb-3 border-info">
					<div class="card-body py-3 bg-info text-white">
						<i class="fa fa-fw fa-user-shield float-right fa-3x"></i>
						<h5 class="card-title h2 mb-1">
                            <?php echo $data_count['mahasiswa_difabel']; ?>
                            <?php echo !empty($data_count['mahasiswa_difabel_verifikasi']) ? "<small> / " . $data_count['mahasiswa_difabel_verifikasi'] . " Perlu diverifikasi</small>" : ""; ?>
                        </h5>
						<span>Mahasiswa Difabel Active</span>
					</div>
					<div class="card-footer border-info">
						<a href="<?php echo($group.'active/difabel') ?>" class="btn-block text-info">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-4">
				<div class="card mb-3 border-info">
					<div class="card-body py-3 bg-info text-white">
						<i class="fa fa-fw fa-user-clock float-right fa-3x"></i>
						<h5 class="card-title h2 mb-1">
                            <?php echo $data_count['mahasiswa_volunteer']; ?>
                            <?php echo !empty($data_count['mahasiswa_volunteer_verifikasi']) ? "<small> / " . $data_count['mahasiswa_volunteer_verifikasi'] . " Perlu diverifikasi</small>" : ""; ?>
                        </h5>
						<span>Mahasiswa Volunteer Active</span>
					</div>
					<div class="card-footer border-info">
						<a href="<?php echo($group.'active/volunteer') ?>" class="btn-block text-info">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<div class="col-md-4">
				<div class="card mb-3 border-info">
					<div class="card-body py-3 bg-info text-white">
						<i class="fa fa-fw fa-user-tag float-right fa-3x"></i>
						<h5 class="card-title h2 mb-1">
                            <?php echo $data_count['mahasiswa_register']; ?>
                            <?php echo !empty($data_count['mahasiswa_register_verifikasi']) ? "<small> / " . $data_count['mahasiswa_register_verifikasi'] . " Perlu diverifikasi</small>" : ""; ?>
                        </h5>
						<span>Mahasiswa Register</span>
					</div>
					<div class="card-footer border-info">
						<a href="<?php echo($group.'active/register') ?>" class="btn-block text-info">
							Read More
							<i class="float-right mt-1 fa fa-fw fa-arrow-alt-circle-right"></i>
						</a>
					</div>
				</div>
				<!-- /.card -->
			</div>
		</div>
		<div class="card mb-3">
			<div class="card-header">
				<h4 class="mt-1 mb-0">
					Grafik Pendampingan
				</h4>
			</div>
			<div class="card-body">
				<div class="row justify-content-center">
					<div class="col-sm-12">
						<canvas id="chart" width="100%" height="40"></canvas>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$(function () {
					var color = Chart.helpers.color;
					var barChartData = {
						labels: [<?php foreach ($data as $no => $value){
							if ($no > 0) {echo ", ";}
							echo '"' . date('M Y', strtotime($value['date'])) . '"';
						} ?>],
						datasets: [{
                            label: 'Terjadwal',
                            backgroundColor: color(window.chartColors.purple).alpha(0.5).rgbString(),
                            borderColor: window.chartColors.purple,
                            borderWidth: 1,
                            data: [<?php foreach ($data as $no => $value){
                                if ($no > 0) {echo ", ";}
                                echo $value['terjadwal'];
                            } ?>]
                        }, {
							label: 'Belum Datang',
							backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
							borderColor: window.chartColors.orange,
							borderWidth: 1,
							data: [<?php foreach ($data as $no => $value){
								if ($no > 0) {echo ", ";}
								echo $value['belum_datang'];
							} ?>]
						}, {
							label: 'Mendampingi',
							backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
							borderColor: window.chartColors.green,
							borderWidth: 1,
							data: [<?php foreach ($data as $no => $value){
								if ($no > 0) {echo ", ";}
								echo $value['selesai'];
							} ?>]
						}, {
							label: 'Izin',
							backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
							borderColor: window.chartColors.yellow,
							borderWidth: 1,
							data: [<?php foreach ($data as $no => $value){
								if ($no > 0) {echo ", ";}
								echo $value['izin'];
							} ?>]
						}, {
							label: 'Tidak Mendampingi',
							backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
							borderColor: window.chartColors.red,
							borderWidth: 1,
							data: [<?php foreach ($data as $no => $value){
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
				});
			</script>
		</div>
	</div>
</div>