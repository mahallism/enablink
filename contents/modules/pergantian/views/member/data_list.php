<div class="content max-<?php echo $size; ?>-container">
    <div class="content-header">
        <h2 class="content-title text-center">
            Data Ajuan
        </h2>
        <?php echo $message; ?>
    </div>
    <div class="content-body">
        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="card-title">Data
                    <?php echo ucwords($module_name); ?>
                </h4>
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
    </div>
</div>