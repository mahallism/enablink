<div class="content">
    <div class="content-body">
        <div class="row py-3 py-md-5">
            <div class="col-md-7 col-lg-6 mx-auto">
                <?php echo $message; ?>
                <?php echo $errors; ?>
                <div class="card mb-3">
                    <div class="card-body">
                        <h2 class="pt-3 pb-2">Account Register</h2>
                        <form class="mb-2" method="post" enctype="multipart/form-data">
                            <?php $this->fcontrol->show(); ?>
                            <?php $this->fcontrol->show('capability'); ?>
                            <div id="disabilitas" <?php if (isset($post['capability']) === false || isset($post['capability']) === true && $post['capability'] !== 'difabel') echo 'class="hide"'; ?>>
                                <?php $this->fcontrol->show('disabilitas'); ?>
                            </div>
                            <div id="preferensi" <?php if (isset($post['capability']) === false || isset($post['capability']) === true && $post['capability'] !== 'volunteer') echo 'class="hide"'; ?>>
                                <?php $this->fcontrol->show('preferensi'); ?>
                            </div>
                            <?php $this->fcontrol->show('footer'); ?>
                            <div class="form-group pt-2">
                                <button type="submit" class="btn btn-lg btn-primary btn-block">Register</button>
                            </div>
                        </form>
                        <div class="pb-2">
                            <p class="text-muted">Do have an account? <a href="<?php echo $group; ?>user/login">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('input[type=radio][name=capability]').change(function() {
        if (this.value == 'difabel') {
            $("#disabilitas").show();
            $("#preferensi").show();
        } else if (this.value == 'volunteer') {
            $("#disabilitas").hide();
            $("#preferensi").show();
        }
    });
</script>