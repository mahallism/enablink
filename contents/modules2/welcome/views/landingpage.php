<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300&display=swap" rel="stylesheet"> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Enablink</title>
</head>

<body class="sticky-top"
    style="font-family: 'Poppins', sans-serif;">


    <!-- Navbar Area -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
        <div class="container" style="max-width:950px">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03"
            aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span> NAVIGASI
        </button>
        <a class="navbar-brand" href="#"><img src="assets/assets/logo tulisan.png" height="25"
                alt="enablink logo"></a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                
            </ul>
            <form class="form-inline my-2 my-lg-0">
                

                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="<?php echo site_url('user/register'); ?>">REGISTER <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo site_url('user/login'); ?>"><button style="color: white; background : #1da1f2;border:0px"
                                type="button" class="btn btn-warning rounded-pill">LOG IN</button></a>
                    </li>
                </ul>

            </form>
        </div>
</div>
    </nav>

    <!-- Content 1 area -->
    
    <div class="container mt-5 pt-5 pb-5" style="max-width:950px">
        <div class="row no-gutters">
            <div class="col-md-9 mt-5 pt-5">
                <h1 class="font-weight-bold">Disability is the<br>Inability to see Ability</h1>
                <p class="mt-3 font-weight-lighter">Aplikasi yang membantu memfasilitasi mahasiswa<br>disabilitas dalam
                    hal pendampingan
                    aktifitas kegiatan<br>pembelajaran di kampus</p>
                <a href="https://play.google.com/store/apps/details?id=com.enablinkproject.enablink"><img style="max-width: 150px" src="assets/assets/playstore.png"></a>
            </div>
            <div class="col-md-3">
                <div class="text-center">
                <img src="assets/assets/smartphone.svg" class="img-fluid" alt="gambar phone">
                </div>
            </div>
        </div>
    </div>
    
    <div id="about" class="bg-light pb-5" style="max-width: 100%; ">
        <div class="container mt-5 pt-5 mb-5" style="max-width:950px">
            <h2 class="mx-auto text-center" style="max-width:280px">About The App</h2>
            <p class="mx-auto text-center font-weight-lighter" style="max-width:70%">Menjadwalkan dan mempertemukan
                mahasiswa disabilitas
                dengan volunteer<br>sehingga mahasiswa disabilitas mendapatkan kemudahan ketika<br>aktifitas kegiatan
                belajar mengajar berlangsung</p>
            <div class="row no-gutters">
                <div class="col-md mt-3">
                    <div class="card mx-auto text-center shadow" style="width: 18rem;height: 20rem;">
                        <img class="mt-5 w-25 mx-auto d-block" src="assets/assets/handicap.png" class="card-img-top"
                            alt="handicap">
                        <div class="card-body">
                            <h5 class="card-title">Schedule</h5>
                            <p class="card-text font-weight-lighter small">Kami membantu menjadwalkan mahasiswa disabilitas
                                agar mendapatkan
                                pendampingan oleh volunteer</p>
                        </div>
                    </div>
                </div>
                <div class="col-md mt-3">
                    <div class="card mx-auto text-center shadow" style="width: 18rem;height: 20rem;">
                        <img class="mt-5 w-25 mx-auto d-block" src="assets/assets/disabled.png" class="card-img-top"
                            alt="handicap">
                        <div class="card-body">
                            <h5 class="card-title">Disability</h5>
                            <p class="card-text font-weight-lighter small">Mendapatkan fasilitas pendampingan saat belajar
                                mengajar dan beberapa kegiatan kampus</p>
                        </div>
                    </div>
                </div>
                <div class="col-md mt-3">
                    <div class="card mx-auto text-center shadow" style="width: 18rem;height: 20rem;">
                        <img class="mt-5 w-25 mx-auto d-block" src="assets/assets/volunteer.png" class="card-img-top"
                            alt="handicap">
                        <div class="card-body">
                            <h5 class="card-title">Volunteer</h5>
                            <p class="card-text font-weight-lighter small">Mendapatkan kemudahan untuk mengetahui mahasiswa
                                yang akan didampingi</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="pt-5 pb-5" style="background-image: -webkit-gradient(linear,left top,left bottom,from(#f07695),to(transparent));
    background-image: -webkit-linear-gradient(top,#1da1f2,transparent);
    background-image: linear-gradient(180deg,#1da1f2,transparent);
 max-width: 100%">
        <div id="pesan" class="container pt-1 pb-5" style="max-width:950px">
            <h2 class="mx-auto text-center text-white" style="max-width:290px">Say Hello To Us!</h2>
            <p class="mx-auto text-center font-weight-lighter text-white" style="max-width:70%">Sampaikan keluhan kamu agar kamu
                bisa menambah inovasi kita untuk<br>anak disabilitas</p>
            <div class="row">
                <div class="col-md-4 mt-3">
                    <div class="bg-white p-3" style="max-height:270px">
                        <div class="row">
                            <div class="text-right col-sm-2 mt-3">
                                <img style="max-height:25px" src="assets/assets/location.png">
                            </div>
                            <div class="col-sm-10 mt-3">
                                <h5 class="small">Location:</h5>
                                <p class="small font-weight-lighter">Rumah Disabilitas Univ Brawijaya</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-right col-sm-2 mt-3">
                            <img style="max-height:25px" src="assets/assets/telephone.png">
                            </div>
                            <div class="col-sm-10 mt-3">
                                <h5 class="small">Whatsapp:</h5>
                                <p class="small font-weight-lighter">+62 8122-8534-015</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-right col-sm-2 mt-3">
                            <img style="max-height:25px" src="assets/assets/mail.png">
                            </div>
                            <div class="col-sm-10 mt-3">
                                <h5 class="small">Email:</h5>
                                <p class="small font-weight-lighter">enablinkcom@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 mt-3">
                    <?php echo $this->session->flashdata('error');?>
                    <?php echo $this->session->flashdata('success');?>
                    <div style="max-height:250px">
                    <form method="POST" action="welcome/send_message">
                        <div class="form-group">
                            <input name="name" type="text" class="form-control" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <input name="email" type="email" class="form-control" placeholder="Email">
                        </div>
                        <textarea name="message" class="form-control" rows="5" placeholder="Your Message"></textarea>
                        <input type="submit" class="btn btn-outline-primary mt-3" value="Send Message">
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="pb-5 pt-5 bg-white" style="color:#9A9A9A; max-width: 100%">
        <div class="container">
            <div class="row">
    <div class="col-sm text-left">
        <img class="mr-3" style="max-height:35px" src="assets/assets/ig-footer.svg"> <img style="max-height:35px" src="assets/assets/youtube-footer.svg">
      <p class="pt-3 font-weight-lighter">Copyright © 2019 enable link</p>
    </div>
    <div class="col-sm text-right">
      <img class="mr-3" style="max-height:65px" src="assets/assets/ub-logo-footer.png"> <img style="max-height:65px" src="assets/assets/psld-footer.png">
    </div>
    
  </div>
            
        </div>
    </div>

</body>

</html>