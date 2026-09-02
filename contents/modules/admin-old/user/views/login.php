<div class="row">
    <div class="col-sm-8 mx-auto">
        <div class="content-header">
            <h2 class="content-title text-center"><?php echo get_app_config('app_name') ?></h2>
        </div>
        <div class="content-body">
            <?php echo $message; ?>
            <?php echo $errors; ?>
            <div class="card">
                <form class="card-body" method="post">
                    <h4 class="card-title my-3">Account Login</h4>
                    <?php if (isset($go)): ?>
                        <input type="hidden" value="<?php echo $go ?>" name="go">
                    <?php endif ?>
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Username" autofocus="">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="pt-1 form-group">
                        <button type="submit" class="btn btn-block btn-lg btn-primary my-2">Login</button>
                    </div>
                </form>
            </div>
            <!-- /.card -->
        </div>
    </div>
</div>