<div class="container my-4">
    
        <div class="card-header ">
        <div class="alert alert-secondary">
    <h5>📅 Jadwal yang akan diajukan</h5>
    <p><strong>Hari:</strong> <?= htmlspecialchars($jadwal[0]) ?> | <strong>Jam:</strong> <?= htmlspecialchars($jadwal[1]) ?> - <?= htmlspecialchars($jadwal[2]) ?></p>
    
    <hr>
    <strong>❗ Jika semua volunteer yang direkomendasikan menolak atau sistem tidak memberikan rekomendasi, Anda masih bisa mencari pengganti berdasarkan nama.</strong>
</div>
            <h5 class="mb-0">Daftar Volunteer yang direkomendasikan</h5>
        </div>
        <div class="card-body">
       
            <?php if (!empty($recom)) : ?>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead >
                            <tr>
                                <th>Nama</th>
                                <th>Panggilan</th>
                                <th>Email</th>
                                <th>No. HP</th>
                                <th>Fakultas</th>
                                
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($recom as $v) : ?>
                                <tr>
                                    <td><?= htmlspecialchars($v->name) ?></td>
                                    <td><?= htmlspecialchars($v->nick_name) ?></td>
                                    <td><?= htmlspecialchars($v->email) ?></td>
                                    <td><a href="https://wa.me/+62<?= substr( $v->no_hp,1) ?>" target="_blank"><?= htmlspecialchars($v->no_hp) ?></a></td>
                                    <td><?= htmlspecialchars($v->faculty_name) ?></td>
                                    
                                    <td>
                                        
                                        <button class="btn btn-success btn-sm pilih-volunteer"
                                            data-user_id="<?= $v->user_id ?>"
                                            data-email="<?= $v->email ?>"
                                            data-jadwal_id="<?= $v->p_id ?>"
                                            data-pengaju="<?= $user_id ?>"
                                            >
                                            Ajukan jadwal
                                        </button>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                    </table>
                </div>
            <?php else : ?>
                <div class="alert alert-warning mb-0">Tidak ada volunteer ditemukan untuk waktu tersebut.</div>
            <?php endif ?>
        </div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
	<script src="<?php echo base_url('assets/member/js/bootstrap.min.js'); ?>"></script>
<script>
    $(document).ready(function () {
        $('.pilih-volunteer').click(function () {
            const penerima = $(this).data('user_id');
            const id_jadwal = $(this).data('jadwal_id');
            const pengaju = $(this).data('pengaju');
            const email = $(this).data('email'); 
            const $btn = $(this);
    $('.pilih-volunteer').prop('disabled', true).text('Mengajukan.....');

            $.post("<?= site_url('pergantian/pergantian_volunteer/ajukan') ?>", {
                pengaju: pengaju,
                id_jadwal: id_jadwal,
                penerima: penerima,
                email : email
            }, function (response) {
                alert(response); 
                location.reload();
            }).fail(function (xhr, status, error) {
            console.error("AJAX Error:", status, error);
            console.log("Response Text:", xhr.responseText);
            //alert("Gagal mengambil data volunteer." + error);
        }).always(function() {
        $btn.prop('disabled', false).text('Ajukan jadwal');
    });
        });
    });
</script>
    
</div>
