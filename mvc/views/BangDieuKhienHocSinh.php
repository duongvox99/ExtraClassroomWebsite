<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Project</title>

	<link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/LamBai.css" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script type='text/javascript' src='/ExtraClassroomWebsite/public/js/jquery-3.4.1.js'></script>
	<script type='text/javascript' src='/ExtraClassroomWebsite/public/js/LamBai.js'></script>
	<script id="MathJax-script" async src="/ExtraClassroomWebsite/public/js/tex-mml-chtml.js"></script>
</head>

<body >
	<<?php require("pages/header.php") ?>
	<div class="container border border-dark bg-light">
		<div class="row">
			<div class="col col-lg-8 col-md-12 col-sm-12 col-12">
				<div class="card border-0 shadow my-5 new-banner position-relative">
					<div class="position-absolute new-banner-location">
						<img class="new-banner-svg" alt="New" src="https://hrcdn.net/fcore/assets/svgs/new-banner-341e41b06d.svg">
					</div>
					<div class="card-body p-5">
						<h1 class="font-weight-light"><b>Bài kiểm tra 1</b></h1>
						<p class="lead">Ngày xxx thi phòng yyy Vào lúc zzz Thời gian xxx</p>
						<p class="lead">Vui lòng có mặt đúng giờ...</p>
						<p class="lead mb-0">Mọi thắc mắc và phản hồi vui lòng liên hệ ???</p>
					</div>
				</div>
				<div class="card border-0 shadow my-5">
					<div class="card-body p-5">
						<h1 class="font-weight-light"><b>Bài kiểm tra 2</b></h1>
						<p class="lead">Ngày xxx thi phòng yyy Vào lúc zzz Thời gian xxx</p>
						<p class="lead">Vui lòng có mặt đúng giờ...</p>
						<p class="lead mb-0">Mọi thắc mắc và phản hồi vui lòng liên hệ ???</p>
					</div>
				</div>
				<div class="card border-0 shadow my-5">
					<div class="card-body p-5">
						<h1 class="font-weight-light"><b>Bài kiểm tra 3</b></h1>
						<p class="lead">Ngày xxx thi phòng yyy Vào lúc zzz Thời gian xxx</p>
						<p class="lead">Vui lòng có mặt đúng giờ...</p>
						<p class="lead mb-0">Mọi thắc mắc và phản hồi vui lòng liên hệ ???</p>
					</div>
				</div>
				<div class="card border-0 shadow my-5">
					<div class="card-body p-5">
						<h1 class="font-weight-light"><b>Bài kiểm tra 4</b></h1>
						<p class="lead">Ngày xxx thi phòng yyy Vào lúc zzz Thời gian xxx</p>
						<p class="lead">Vui lòng có mặt đúng giờ...</p>
						<p class="lead mb-0">Mọi thắc mắc và phản hồi vui lòng liên hệ ???</p>
					</div>
				</div>		
			</div>
			<div class="col col-lg-4 col-md-12 col-sm-12 col-12 ">
					<div class="card border-0 shadow ml-auto my-5 custom-collapse">
						<div class="card-header bg-success" id="headingOne" data-parent="custom-collapse">
							<h5 class="mb-0">
								<a class="collapse-toggle visible-xs" data-toggle="collapse" aria-expanded="true" aria-controls="side-menu-collapse" data-target="#side-menu-collapse">
									Loại Bài kiểm tra
								</a>
							</h5>
						</div>
						<div class="card-body">
							<div class="list-group cusstom-listgroup" role="tablist" class="list-group collapse" id="side-menu-collapse">
								<a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="">Tất cả</a>
								<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="">Chưa xem</a>
								<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="">Đã xem</a>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<?php require("pages/footer.php") ?>
</body>