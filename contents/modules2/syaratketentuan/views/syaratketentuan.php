<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Enablink</title>
</head>

<body class="sticky-top" style="font-family: 'Poppins', sans-serif;">


    <!-- Navbar Area -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
        <div class="container" style="max-width:950px">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span> NAVIGASI
            </button>
            <a class="navbar-brand" href="#"><img src="assets/assets/logo.png" height="50" alt="enablink logo"></a>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" href="<?php echo site_url(); ?>">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo site_url('#about'); ?>">About</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">


                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="<?php echo site_url('user/register'); ?>">REGISTER <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a href="<?php echo site_url('user/login'); ?>"><button style="color: white; background : #FF8923" type="button" class="btn btn-warning rounded-pill">LOG IN</button></a>
                        </li>
                    </ul>

                </form>
            </div>
        </div>
    </nav>

    <!-- Content 1 area -->

    <div class="container mt-5 pt-5 pb-5" style="max-width:950px">
        <?php echo html_entity_decode($term_condition); ?>
    </div>
</body>

</html>