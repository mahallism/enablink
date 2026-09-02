<div class="content max-<?php echo $size; ?>-container">
    <div class="content-header">
        <h2 class="content-title text-center">Master
            <?php echo ucwords($module_name); ?>
        </h2>
        <?php echo $message; ?>
    </div>
    <div class="content-body">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="card-title">Data
                    <?php echo ucwords($module_name); ?>
                </h4>
                <div>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#filter">
                        <i class="fa fa-fw fa-filter"></i> Filter Data
                    </button>
                </div>
            </div>
            <table class="table table-sm table-striped table-hover mb-0 datatables-noorder-last">
                <thead>
                    <tr>
                        <th width="5" class="text-nowrap">
                            No
                        </th>
                        <?php foreach ($list_field as $key => $item): ?>
                            <th class="text-nowrap">
                                <?php echo $item; ?>
                            </th>
                        <?php endforeach ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data as $no => $item):
                        $id = current($item); ?>
                        <tr>
                            <td class="text-nowrap">
                                <?php echo ($no + 1) ?>.
                            </td>
                            <?php foreach ($list_field as $key => $value): ?>
                                <td>
                                    <?php echo $item[$key]; ?>
                                </td>
                            <?php endforeach ?>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="filter" tabindex="-1" role="dialog" aria-labelledby="filterLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form class="modal-content" method="get" action="<?php echo site_url('admin/pergantian/riwayat_pergantian'); ?>">
					<div class="modal-header">
						<h5 class="modal-title" id="filterLabel">Form Filter  <?php echo $group; ?> / <?php echo $module_main; ?></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
                    <div class="form-group">
        <label for="bulan">Bulan</label>
        <select name="bulan" id="bulan" class="form-control">
            <option value="">-- Pilih Bulan --</option>
            <option value="1">Januari</option>
            <option value="2">Februari</option>
            <option value="3">Maret</option>
            <option value="4">April</option>
            <option value="5">Mei</option>
            <option value="6">Juni</option>
            <option value="7">Juli</option>
            <option value="8">Agustus</option>
            <option value="9">September</option>
            <option value="10">Oktober</option>
            <option value="11">November</option>
            <option value="12">Desember</option>
        </select>
    </div>
   
    
    <div class="form-group">
        <label for="tahun">Tahun</label>
        <select name="tahun" id="tahun" class="form-control">
            <option value="">-- Pilih Tahun --</option>
            <?php
                $tahun_sekarang = date('Y');
                for($i = $tahun_sekarang; $i >= $tahun_sekarang - 10; $i--) {
                    echo "<option value=\"$i\">$i</option>";
                }
            ?>
        </select>
    </div>
					</div>
					<div class="modal-footer">
						<a href="<?php echo $group.$module_main ?>?reset" class="btn btn-secondary">Reset Filter</a>
						<button class="btn btn-primary" type="submit">Filter Data</button>
					</div>
				</form>
			</div>
		</div>
    </div>
</div>