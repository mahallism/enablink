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
					<div>
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#filter">
							<i class="fa fa-fw fa-filter"></i> Filter Data
						</button>
<!--						<a href="--><?php //echo $group . $module_main; ?><!--/generate" class="btn btn-sm btn-primary"><i class="fa fa-fw fa-magic"></i> Generate Jadwal</a>-->
						<?php if (protected_item($user_group[$action_url['delete']['protection']])) : ?>
							<a href="<?php echo $group . $module_main; ?>/multidelete" class="btn btn-sm btn-danger"><i class="fa fa-fw fa-trash"></i> Multi Delete</a>
						<?php endif ?>
                        <?php if(!empty($action_url['generate_jadwal'])){ ?>
                            <a href="<?php echo $action_url['generate_jadwal']; ?>/generate" class="btn btn-sm btn-indigo">
                                <i class="fa fa-fw fa-cogs"></i> Generate Jadwal Range Tanggal
                            </a>
                        <?php } ?>
					</div>
				</div>
				<ul class="nav nav-tabs card-header-tabs px-2">
					<?php unset($get_data[$key_tab]);
					foreach ($tab as $id => $item) : ?>
						<li class="nav-item">
							<a href="<?php echo $group, $module_main;
										array_to_get_url($get_data + array($key_tab => $id)) ?>" class="nav-link py-1<?php echo ($tab_id == $id ? ' active' : '') ?>"><?php echo $item; ?></a>
						</li>
					<?php endforeach ?>
				</ul>
			</div>
			<table class="table table-sm table-striped table-hover mb-0" datatables="">
				<thead>
					<tr>
						<th width="5" class="text-nowrap">
							No
						</th>
						<?php foreach ($list_field as $key => $item) : ?>
							<th class="text-nowrap"><?php echo $item; ?></th>
						<?php endforeach ?>
						<?php if (isset($action_url['edit']) || isset($action_url['delete'])) : ?>
							<th class="text-nowrap" width="1">Aksi</th>
						<?php endif ?>
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
							<?php if (isset($action_url['duplicate']) || isset($action_url['edit']) || isset($action_url['delete'])) : ?>
								<td class="text-center text-nowrap">
									<?php if ($item[$action_url['edit']['id']] === null) : ?>
										<a href="<?php echo $group . $module_main . '/input_more/' . current($item) . '?date=' . $item['date'] ?>" class="btn btn-outline-primary btn-sm mr-1"><i class="fas fa-plus m-0"></i></a>
                                        <a href="<?php echo $group . $module_main . '/input/' . current($item) . '?date=' . $item['date'] ?>"><i class="fas fa-plus-circle mr-1"></i></a>
									<?php else : ?>
										<?php if (isset($action_url['edit_more']) && (!isset($action_url['edit_more']['id']) || (isset($action_url['edit_more']['id']) && $item[$action_url['edit_more']['id']] !== null))) : ?> &nbsp;
											<a href="<?php echo $action_url['edit_more']['url'] . '/' . (isset($action_url['edit_more']['id']) ? $item[$action_url['edit_more']['id']] : $id); ?>" class="btn btn-outline-primary btn-sm "><i class="fa fa-edit"></i></a>
										<?php endif ?>
                                        <?php if (isset($action_url['edit']) && (!isset($action_url['edit']['id']) || (isset($action_url['edit']['id']) && $item[$action_url['edit']['id']] !== null))) : ?> &nbsp;
                                            <a href="<?php echo $action_url['edit']['url'] . '/' . (isset($action_url['edit']['id']) ? $item[$action_url['edit']['id']] : $id); ?>"><i class="fa fa-pencil-alt"></i></a>
                                        <?php endif ?>
										<?php if (isset($action_url['delete']['url'])) : ?>
											<?php if (($id !== $can_delete_first) && protected_item($user_group[$action_url['delete']['protection']]) && (!isset($action_url['delete']['id']) || (isset($action_url['delete']['id']) && $item[$action_url['delete']['id']] !== null))) : ?> &nbsp;
												<a href="<?php echo $action_url['delete']['url'] . '/' . (isset($action_url['delete']['id']) ? $item[$action_url['delete']['id']] : $id);
															array_to_get_url($this->input->get()) ?>" onclick="return confirm('Apakah anda yakin akan menghapus data?')" class="text-danger"><i class="fa fa-trash"></i></a>
											<?php endif; ?>
										<?php endif ?>
									<?php endif ?>
								</td>
							<?php endif ?>
						</tr>
					<?php endforeach ?>
				</tbody>
			</table>
		</div>
		<!-- /.card -->
		<!-- Modal -->
		<div class="modal fade" id="filter" tabindex="-1" role="dialog" aria-labelledby="filterLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form class="modal-content" method="get" action="<?php echo $group . $module_main ?>">
					<div class="modal-header">
						<h5 class="modal-title" id="filterLabel">Form Filter</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<?php
						array_to_input(array($key_tab => $tab_id));
						$this->fcontrol->show();
						?>
						<div value-type="hari" <?php if (isset($get_data['type']) === false || $get_data['type'] !== 'hari') echo ' class="hide"'; ?>>
							<?php
							$form_date = array(
								'date' => array(
									'label' 		=> 'Tanggal',
									'type' 			=> 'date',
								),
							);
							$this->fcontrol->init($form_date)->generate()->show();
							?>
						</div>
						<div value-type="minggu" <?php if (isset($get_data['type']) === false || $get_data['type'] !== 'minggu') echo ' class="hide"'; ?>>
							<?php
							$form_date = array(
								array(
									'label' => 'Tanggal',
									'input'	=> array(
										'start_at' => array(
											'type' 			=> 'date',
											'input_size' 	=> 6,
										),
										'end_at' => array(
											'type' 			=> 'date',
											'input_size' 	=> 6,
										),
									),
								),
							);
							$this->fcontrol->init($form_date)->generate()->show();
							?>
						</div>
					</div>
					<div class="modal-footer">
						<a href="<?php echo $group . $module_main ?>" class="btn btn-secondary">Reset Filter</a>
						<button class="btn btn-primary" type="submit">Filter Data</button>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var table = $('.table').DataTable({
					dom: 'Bfrtip',
					buttons: [
						'copy', 'csv', 'excel', 'pdf', 'print'
					],
                    order: [[0  , 'asc']],
					columnDefs: [{ targets: [1], visible: false},],
                    rowGroup: {
                        dataSrc: 1,
                    }
				});
				table.draw(false);
			});
		</script>
	</div>
</div>
