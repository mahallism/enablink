<div class="content max-sm-container">
	<div class="content-header">
		<h2 class="content-title text-center">Profile</h2>
	</div>
	<div class="content-body">
		<?php echo $message; ?>
		<div class="card">
			<div class="card-header">
				<h4 class="card-title">Data Profile</h4>
			</div>
			<div class="card-body">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Foto User</label>
					<div class="col-sm-8">
						<img src="<?php echo $data['photo'] ? $data['photo'] : 'assets/img/default.jpg'; ?>" alt="<?php echo $data['name']; ?>" class="rounded-circle" style="width: 160px; height: 160px;">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Foto KTM</label>
					<div class="col-sm-8">
						<img src="<?php echo $data['ktm'] ? $data['ktm'] : 'assets/img/default.jpg'; ?>" alt="<?php echo $data['ktm']; ?>">
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">NIM</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo $data['username']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Nama Lengkap</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo $data['name']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Nama Panggilan</label>
					<div class="col-sm-6">
						<span class="form-control"><?php echo $data['nick_name']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Tanggal Lahir</label>
					<div class="col-sm-6">
						<span class="form-control"><?php echo $data['birth_date']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Fakultas</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo $data_fakultas['faculty_name']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Jurusan</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo $data_fakultas['majors_name']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Preferensi</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo implode(", ", $data_preferensi) ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Angkatan</label>
					<div class="col-sm-6">
						<span class="form-control"><?php echo $data['class_of_college']; ?></span>
					</div>
				</div>
				<hr>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Email Address</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo $data['email']; ?></span>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-4 col-form-label">Nomor Hp</label>
					<div class="col-sm-6">
						<span class="form-control"><?php echo $data['no_hp']; ?></span>
					</div>
				</div>
				<?php if (protected_item('difabel')) : ?>
					<hr>
					<div class="form-group row">
						<label for="staticEmail" class="col-sm-4 col-form-label">Jenis Disabilitas</label>
						<div class="col-sm-8">
							<span class="form-control"><?php echo (isset($data['jenis_difabel']) && $data['jenis_difabel'] !== null && $data['jenis_difabel'] !== '' ? $data['jenis_difabel'] : '-'); ?></span>
						</div>
					</div>
				<?php endif ?>
				<hr>
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">Joined</label>
					<div class="col-sm-8">
						<span class="form-control"><?php echo date_html($data['created_at']); ?></span>
					</div>
				</div>
			</div>
			<div class="card-footer text-right">
				<a href="<?php echo $group; ?>user/change_profile" class="btn btn-primary">Change Profile</a>
			</div>
		</div>
	</div>
</div>