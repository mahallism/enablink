<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Enablink - Official Website</title>

	<!-- Bootstrap Core CSS -->
	<link href="assets/front/css/bootstrap.min.css" rel="stylesheet">
	<!-- vendor -->
	<!-- fontawesome -->
	<link href="assets/front/vendor/fontawesome/css/fontawesome-all.min.css" rel="stylesheet">
	<!-- custom style -->
	<link href="assets/front/css/style.min.css" rel="stylesheet">

	<!-- jQuery -->
	<script src="assets/front/js/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="assets/front/js/popper.min.js"></script>
	<script src="assets/front/js/bootstrap.min.js"></script>
	<!-- vendor -->

	<!-- custom script -->
	<script src="js/script.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
			<div class="container">
				<a class="navbar-brand" href="#">Enable Link</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="form-inline my-2 my-lg-0  mr-auto" method="post" action="user/login">
						<input name="username" class="form-control form-control-sm mr-sm-2" type="text" placeholder="NIM">
						<input name="password" class="form-control form-control-sm mr-sm-2" type="password" placeholder="Password">
						<button class="btn btn-sm btn-primary my-2 my-sm-0" type="submit">Login</button>
					</form>
					<form class="form-inline my-2 my-lg-0">
						<small class="mx-2 text-muted">Belum memiliki akun?</small>
						<a href="user/register" class="btn btn-sm btn-outline-primary my-2 my-sm-0">Register</a>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<div class="body">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="assets/front/img/slideshow-dummy.jpg" alt="First slide">
					<div class="carousel-caption d-none d-md-block text-right">
						<h5 class="h2 pb-3">Jika kamu bisa melakukan sesuatu hal dengan baik <br>Maka kamu dibutuhkan oleh orang lain</h5>
						<p class="h5 pb-3">Keterbatasan adalah kesempatan bagimu</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="container">
			<section class="py-5">
				<div class="row">
					<div class="col-sm-6">
						<h2 class="py-3 text-primary">About Us</h2>
						<p class="pb-3">Kami membantu memfasilitasi kampus kamu<br>mewujudkan kampus ramah disabilitas<br>agar lebih mudah dalam proses belajar mengajar</p>
						<p class="h5 pb-3">Satu aplikasi memberimu kesempatan</p>
					</div>
					<div class="col-sm-6">
						<iframe width="560" height="315" src="https://www.youtube.com/embed/5fKXIJrzyqQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>
			</section>
		</div>
		<div class="container">
			<section class="py-5 border-top">
				<div class="section-title pb-3 text-right">
					<h2 class="text-primary">Contact Us</h2>
					<h5 class="text-muted">Ceritakan keluhan bersama kami</h5>
				</div>
				<div class="section-body text-right mb-3">
					<p>081228534015<i class="fas fa-mobile-alt ml-3 fa-fw"></i></p>
					<p>enablinkcom@gmail.com<i class="far fa-envelope ml-3 fa-fw"></i></p>
				</div>
				<div class="section-body text-right">
					<p>Yuk wujudkan kampus ramah disabilitas<br>Batnu teman kamu dalam memperoleh pendidikan</p>
				</div>
			</section>
		</div>
	</div>
	<footer class="bg-light border-top">
		<div class="container text-center text-muted">
			<div class="py-3">
				<p class="mb-0"><i><b>Universitas Brawijaya</b></i></p>
			</div>
			<div class="py-3 border-top">
				<p class="mb-0">Copyright &copy; 2019 Enable Link</p>
			</div>
		</div>
	</footer>
</body>
</html>
