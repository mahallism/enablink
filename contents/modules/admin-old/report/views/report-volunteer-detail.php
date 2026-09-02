<div class="content max-xl-container">
	<div class="content-header">
		<h2 class="content-title text-center">Detail Kehadiran Volunteer</h2>
		<?php echo $message; ?>
	</div>
	<div class="content-body">
		<div class="card mb-3">
			<div class="card-header">
				<h4 class="mt-1 mb-0">
					Grafik Kehadiran Volunteer
				</h4>
			</div>
			<div class="card-header">
                <div class="col-md">
                    <?php echo $data_mahasiswal['name']; ?>
                    <small class="text-muted">(<?php echo $data_mahasiswal['nick_name']; ?>)</small>
                    <br/>
                    <?php echo $data_mahasiswal['username']; ?>
                </div>
                <div class="col-md">
                    <?php echo $data_mahasiswal['majors_name']; ?><br/>
                    <?php echo $data_mahasiswal['faculty_name']; ?>
                </div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-9">
						<canvas id="chart" width="100%" height="40"></canvas>
					</div>
					<div class="col-sm-3">
						<canvas class="chart" id="doughnut-chart" height="300"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-9">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-1 mb-0">
							Data Kehadiran
						</h4>
					</div>
					<table class="table table-sm table-striped table-hover mb-0 datatables-noorder-last">
						<thead>
							<tr>
								<th width="5" class="text-nowrap">
									No
								</th>
								<?php foreach ($list_field as $key => $item): ?>
									<th class="text-nowrap"><?php echo $item; ?></th>
								<?php endforeach ?>
								<?php if (isset($action_url['detail']) || isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete'])): ?>
									<th class="text-nowrap" width="1">Aksi</th>
								<?php endif ?>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($data_hadir as $no => $item): $id = current($item); ?>
								<tr>
									<td class="text-nowrap">
										<?php echo ($no + 1) ?>.
									</td>
									<?php foreach ($list_field as $key => $value): ?>
										<td><?php echo $item[$key]; ?></td>
									<?php endforeach ?>
									<?php if (isset($action_url['detail']) || isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete'])): ?>
										<td class="text-center text-nowrap">
											<?php if (isset($action_url['detail']) && (!isset($action_url['detail']['id']) || (isset($action_url['detail']['id']) && $item[$action_url['detail']['id']] !== null))): ?>
												<a href="<?php echo $action_url['detail']['url'] . '/' . (isset($action_url['detail']['id'])? $item[$action_url['detail']['id']]: $id); ?>"><i class="far fa-eye"></i></a>
											<?php endif ?>
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
				</div>
			</div>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-1 mb-0">
							Data Report
						</h4>
					</div>
					<table class="table table-sm table-striped table-hover mb-0">
						<tbody>
							<tr>
								<td>Jumlah Hadir</td>
								<td><?php echo $data_hadir_report['jumlah_hadir'] ?> Kali</td>
							</tr>
							<tr>
								<td>Jumlah SKS</td>
								<td><?php echo $data_hadir_report['jumlah_sks'] ?> SKS</td>
							</tr>
							<tr>
								<td>Jumlah Jam</td>
								<td><?php echo $data_hadir_report['jumlah_jam'] ?> Jam</td>
							</tr>
							<tr>
								<td>Max Review</td>
								<td><?php echo $data_hadir_report['max_review'] ?> <i class="fa fa-fw fa-star text-muted"></i></td>
							</tr>
							<tr>
								<td>Min Review</td>
								<td><?php echo $data_hadir_report['min_review'] ?> <i class="fa fa-fw fa-star text-muted"></i></td>
							</tr>
							<tr>
								<td>Rata-rata Review</td>
								<td><?php echo $data_hadir_report['avg_review'] ?> <i class="fa fa-fw fa-star text-muted"></i></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<?php
$data_doughnut = array(
    'terjadwal' => array(
        'value' => 0,
        'label' => 'Terjadwal',
        'bg' => 'color(window.chartColors.purple).alpha(0.5).rgbString()',
        'border' => 'window.chartColors.purple',
    ),
//	'belum_datang' => array(
//		'value' => 0,
//		'label' => 'Belum Datang',
//		'bg' => 'color(window.chartColors.orange).alpha(0.5).rgbString()',
//		'border' => 'window.chartColors.orange',
//	),
	'selesai' => array(
		'value' => 0,
		'label' => 'Hadir',
		'bg' => 'color(window.chartColors.green).alpha(0.5).rgbString()',
		'border' => 'window.chartColors.green',
	),
	'izin' => array(
		'value' => 0,
		'label' => 'Izin',
		'bg' => 'color(window.chartColors.yellow).alpha(0.5).rgbString()',
		'border' => 'window.chartColors.yellow',
	),
//	'tidak_datang' => array(
//		'value' => 0,
//		'label' => 'Tidak Mendampingi',
//		'bg' => 'color(window.chartColors.red).alpha(0.5).rgbString()',
//		'border' => 'window.chartColors.red',
//	),
);
foreach ($data as $item) {
    $data_doughnut['terjadwal']['value'] += $item['terjadwal'];
//	$data_doughnut['belum_datang']['value'] += $item['belum_datang'];
	$data_doughnut['selesai']['value'] += $item['selesai'];
	$data_doughnut['izin']['value'] += $item['izin'];
//	$data_doughnut['tidak_datang']['value'] += $item['tidak_datang'];
}
?><script type="text/javascript">
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
            },
                //{
                //    label: 'Belum Datang',
                //    backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
                //    borderColor: window.chartColors.orange,
                //    borderWidth: 1,
                //    data: [<?php //foreach ($data as $no => $value){
                //        if ($no > 0) {echo ", ";}
                //        echo $value['belum_datang'];
                //    } ?>//]
                //},
            {
				label: 'Hadir',
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
			},
                //{
                //    label: 'Tidak Mendampingi',
                //    backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                //    borderColor: window.chartColors.red,
                //    borderWidth: 1,
                //    data: [<?php //foreach ($data as $no => $value){
                //        if ($no > 0) {echo ", ";}
                //        echo $value['tidak_datang'];
                //    } ?>//]
                //}
            ]
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
