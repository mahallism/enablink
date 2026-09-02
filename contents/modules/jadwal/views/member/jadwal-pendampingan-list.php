<div class="content max-<?php echo $size; ?>-container">
    <div class="content-header">
        <h2 class="content-title text-center">
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
                <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="sekarang-tab" data-toggle="tab" href="#sekarang" role="tab"
                            aria-controls="sekarang" aria-selected="true">Terjadwal Selanjutnya</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="sebelumnya-tab" data-toggle="tab" href="#sebelumnya" role="tab"
                            aria-controls="sebelumnya" aria-selected="false">Sebelumnya</a>
                    </li>
                </ul>
            </div>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="sekarang" role="tabpanel" aria-labelledby="sekarang-tab">
                    <table class="table table-sm table-hover mb-0 w-100" datatables="">
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

                                <th class="text-nowrap" width="1">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            $capability = current_user_session('capability');
                            
                            foreach ($data as $item):
                                $id = current($item); ?>
                                <?php  if (strtotime($item['date']) < strtotime(date('Y-m-d')))
                                    continue; ?>
                                <tr>
                                    <td class="text-nowrap">
                                        <?php echo ($no++) ?>.
                                    </td>
                                    <?php foreach ($list_field as $key => $value): ?>
                                        <td>
                                            <?php echo $item[$key]; ?>
                                        </td>
                                    <?php endforeach ?>
                                    <td class="text-nowrap">
                                        <?php if ($capability == 'difabel') { ?>
                                            <?php if (in_array(strtolower($item['volunteer_status']), array('terjadwal'))) { ?>
                                                <button type="button" class="btn btn-sm btn-primary" disabled><i
                                                        class="fa fa-star"></i></button>
                                            <?php }
                                            if (in_array(strtolower($item['volunteer_status']), array('hadir'))) { ?>
                                                <?php if ($item['review'] == null) { ?>
                                                    <button type="button" class="btn btn-sm btn-primary btn-review"
                                                        data-toggle="tooltip" title="Review Kehadiran"
                                                        data-accompaniment_id="<?php echo $item['accompaniment_id']; ?>" -><i
                                                            class="fa fa-star"></i></button>
                                                <?php } else { ?>
                                                    <div class="rating-readonly" data-rating="<?php echo $item['review']; ?>"></div>
                                                <?php } ?>
                                            <?php } ?>
                                        <?php } else if ($capability == 'volunteer') { ?>
                                            <?php if($item['volunteer_status'] == 'terjadwal'){ ?>
    <div class="p-2">
        <a href="<?php echo $group.'izin/input/'.current($item) ?>" class="btn btn-outline-primary mr-2">
            <i class="far fa-envelope mr-1"></i> Izin
        </a>

        <?php if (!empty($item['status_pengajuan'])): ?>
            <button class="btn btn-warning btn-tarik mr-2" data-id="<?php echo $item['accompaniment_id']; ?>"
                data-user="<?php echo $this->user_data['user_id']; ?>">
                Tarik
            </button>
        <?php else: ?>
            <button type="button" data-toggle="modal" data-target="#volunteerModal" class="btn btn-primary btn-recom mr-2"
                data-hari="<?php echo $item['daynum']; ?>"
                data-mulai="<?php echo $item['start_at']; ?>"
                data-selesai="<?php echo $item['end_at']; ?>"
                data-id="<?php echo $item['accompaniment_id']; ?>"
                data-fakultas="<?php echo $item['fakultas']; ?>"
                data-user_id="<?php echo $this->user_data['user_id']; ?>"
                data-tanggal="<?php echo $item['date']; ?>">
                Cari Pengganti
            </button>
        <?php endif; ?>

        <button class="btn btn-primary btn-sm btn-presensi" data-toggle="tooltip"
            title="Konfirmasi Kehadiran"
            data-accompaniment_id="<?php echo $item['accompaniment_id']; ?>">
            <i class="fa fa-check"></i>
        </button>
    </div>
<?php } else { echo '<div class="p-2">'.$item['volunteer_status'].'</div>'; } ?>


                                        <?php } ?>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade show" id="sebelumnya" role="tabpanel" aria-labelledby="sebelumnya-tab">
                    <table class="table table-sm table-striped table-hover mb-0 w-100" datatables="">
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

                                <?php if ($capability == 'difabel') { ?>
                                    <th>Review</th>
                                <?php } else if ($capability == 'volunteer') { ?>
                                        <th>Present</th>
                                <?php } ?>

                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 1;
                            foreach ($data as $item):
                                $id = current($item); 
                                 if (strtotime($item['date']) >= strtotime(date('Y-m-d')))
                                    break; ?>
                                <tr>
                                    <td class="text-nowrap">
                                        <?php echo ($no++) ?>.
                                    </td>
                                    <?php foreach ($list_field as $key => $value): ?>
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
                                                    <button type="button" class="btn btn-sm btn-primary btn-review"
                                                        data-toggle="tooltip" title="Review Kehadiran"
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
            </div>
        </div>


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
             <!-- Modal -->
        <div class="modal fade bd-example-modal-lg" id="volunteerModal" tabindex="-1" role="dialog"
            aria-labelledby="volunteerModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="volunteerModalLabel">Daftar Volunteer</h5>


                        <!-- Tombol X -->
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>

                    <div class="modal-body">
                        <form id="formCariVolunteer" class="mb-2">
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputCariVolunteer"
                                    placeholder="Cari volunteer...">

                                <input type="hidden" name="user_id" id="input-user_id"
                                    value="<?php echo $this->user_data['user_id']; ?>">
                                <input type="hidden" name="modal-id" id="input-id" value="">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">Cari</button>
                                </div>
                            </div>
                        </form>
                        <div id="hasilVolunteer">

                        </div>
                    </div>

                    <div class="modal-footer">
                        <!-- Tombol Tutup -->
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    </div>

                </div>
            </div>
        </div>
        <?php } ?>


        <!-- /.card -->
        <script type="text/javascript">
            $(function () {
                $("[data-toggle='tooltip']").tooltip();
                var table = $('[datatables]').DataTable({
                    // columnDefs: [
                    // { orderable: false, targets: -1 }
                    // ],
                    // rowsGroup: [1],
                    columnDefs: [
                        { searchable: false, orderable: false, targets: 0 },
                        { targets: [1], visible: false },],
                    rowGroup: {
                        dataSrc: 1,
                        startRender: function (rows, group) {
                            return $('<tr class="group group-start"><th class="bg-info" colspan="10">' + group + '</th></tr>');
                        }
                    },
                    drawCallback: function (settings) {
                        $(".rating-readonly").starRating({ readOnly: true, starShape: 'rounded', starSize: 15, });

                        if ($("#modal_presensi").length > 0) {
                            $(document).on("click", ".btn-presensi", function (e) {
                                $("#modal_presensi [name='accompaniment_id']").val($(this).data('accompaniment_id'));
                                $("#modal_presensi").modal('show');
                            });
                        }

                        if ($("#volunteerModal").length > 0) {
                            $(document).on("click", ".btn-recom", function (e) {
                                const id = $(this).data('id');
                                const hari = $(this).data('hari');
                                const mulai = $(this).data('mulai');
                                const selesai = $(this).data('selesai');
                                const fakultas = $(this).data('fakultas');
                                const user_id = $(this).data('user_id');
                                const tanggal = $(this).data('tanggal');


                                $.post("<?= site_url('pergantian/pergantian_volunteer/get_Available') ?>", {
                                    hari: hari,
                                    mulai: mulai,
                                    selesai: selesai,
                                    id: id,
                                    fakultas: fakultas,
                                    user_id: user_id,
                                    tanggal: tanggal
                                }, function (data) {
                                    $("#hasilVolunteer").html(data);
                                    //$("#volunteerModal").modal('show');

                                }).fail(function (xhr, status, error) {
                                    console.error("AJAX Error:", status, error);
                                    console.log("Response Text:", xhr.responseText);
                                    //alert("Gagal mengambil data volunteer." + error);
                                });

                            });
                        }

                        if ($("#formCariVolunteer").length > 0) {
                            $('#formCariVolunteer').off('submit').on('submit', function (e) {
                                e.preventDefault();
                                const nama = $('#inputCariVolunteer').val();
                                if (nama === '') {
                                    alert("Nama belum diisi. Silakan masukkan nama volunteer yang ingin dicari.");
                                    return;
                                }
                                const id = $('#input-id').val()
                                const user_id = $('#input-user_id').val();
                                $.post("<?= site_url('pergantian/pergantian_volunteer/cari') ?>", {
                                    nama: nama,
                                    id: id,
                                    user_id: user_id
                                }, function (data) {
                                    $("#hasilVolunteer").html(data);
                                    // $("#volunteerModal").modal('show');


                                }).fail(function (xhr, status, error) {
                                    console.error("AJAX Error:", status, error);
                                    console.log("Response Text:", xhr.responseText);
                                    //alert("Gagal mengambil data volunteer." + error);
                                });



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
                    }
                });
                table.draw(false);

                $('.tab-pane.fade').each(function ($i, $e) {
                    var el = $(this); volunteerModal
                    if ($i > 0) {
                        el.removeClass('show');
                        el.removeClass('active');
                    }
                });

                $(document).on("click", ".btn-tarik", function (e) {
                    e.preventDefault();
                    const id = $(this).data('id');
                    const user = $(this).data('user');
                    $('.btn-tarik').prop('disabled', true).text('Memproses.....');
                    $.post("<?= site_url('pergantian/pergantian_volunteer/tarik') ?>", {
                        id: id,
                        user: user
                    })
                        .done(function (data) {
                            console.log("RAW RESPONSE:", data);
                            const parts = data.split('|');
                            const status = parts[0];
                            const message = parts[1];

                            alert(message);
                            location.reload();
                        })
                        .fail(function (xhr, status, error) {
                            console.error("AJAX Error:", status, error);
                            console.log("Response Text:", xhr.responseText);
                            alert("Terjadi kesalahan saat memproses permintaan.");
                        }).always(function() {
        $btn.prop('disabled', false).text('Tarik');
    });
                });
                $('#volunteerModal').on('show.bs.modal', function (event) {
                    const button = $(event.relatedTarget); // tombol yang memicu modal
                    const id = button.data('id'); // ambil data-id dari tombol

                    // Isi ke <span> tampilan ID
                    $('#modal-id').text(id);

                    // Isi ke input hidden
                    $('#input-id').val(id);
                });

            });
        </script>

       

        <!-- <script>
$('.cari-volunteer-btn').on('click', function() {
    const hari = $(this).data('hari');
    const mulai = $(this).data('mulai');
    const selesai = $(this).data('selesai');
    const id = $(this).data('id');

    $('#param_hari').val(hari);
    $('#param_mulai').val(mulai);
    $('#param_selesai').val(selesai);
    $('#param_id').val(id);

    // Panggil data volunteer rekomendasi
    $.post("<?= site_url('pergantian/pergantian_volunteer/get_Available') ?>", {
        param_hari: hari,
        param_mulai: mulai,
        param_selesai: selesai,
        param_id: id
    }, function(data) {
    console.log("DATA DARI SERVER:", data); // Output JSON
});
    //function(data) {
        
    //     console.log(data);
    //     if('#hasilVolunteer'.length != 0 ){
    //         $('#hasilVolunteer').html(data);
    //     // Tampilkan modal setelah isi dimuat
    //     $('#volunteerModal').modal('show');
    //     }else {
    //         alert(console.error();)
    //     }
        
    // }).fail(function(xhr, status, error) {
    // console.error("AJAX Error: " + status + " - " + error); // Debugging error AJAX;
});

$('#btnCari').on('click', function() {
    const keyword = $('#cariNama').val();
    $.post("<?= site_url('pergantian/pergantian_volunteer/cari') ?>", {
        parameter: keyword
    }, function(data) {
        if (data) {
        $('#hasilVolunteer').html(data);  // Tampilkan hasil di modal
        $('#volunteerModal').modal('show');  // Tampilkan modal
    } else {
        console.error("Tidak ada data yang diterima!");
    }
}).fail(function(xhr, status, error) {
    console.error("AJAX Error: " + status + " - " + error);  // Debugging error AJAX
});
    });
});
</script> -->


    </div>
</div>