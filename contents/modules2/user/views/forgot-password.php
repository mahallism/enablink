<div class="content">
    <div class="content-body">
        <div class="row py-3 py-md-5">
            <div class="col-md-5 col-lg-4 mx-auto">
                <?php echo $message; ?>
                <?php echo $errors; ?>
                <div class="card mb-3">
                    <div class="card-body">
                        <h2 class="pt-3 pb-2">Forgot Password</h2>
                        <form class="mb-2" method="post">
                            <div class="form-group">
                                <label for="username">NIM</label>
                                <input type="text" name="username" value="<?php echo $this->input->post('username'); ?>" class="form-control" id="username" placeholder="NIM">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" name="email" value="<?php echo $this->input->post('email'); ?>" class="form-control" id="email" placeholder="Email">
                            </div>
                            <div class="form-group pt-2">
                                <button type="submit" class="btn btn-lg btn-primary btn-block">Kirimkan Pemulihan</button>
                            </div>
                        </form>
                        <div class="pb-2">
                            <p class="text-muted">Jika anda tidak bisa memulihkan password, silahkan menghubungi admin.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>