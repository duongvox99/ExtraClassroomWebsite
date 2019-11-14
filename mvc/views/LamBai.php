<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Lam Bai Thi</title>

	<link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/LamBai.css" />

	<script type='text/javascript' src='/ExtraClassroomWebsite/public/js/jquery-3.4.1.js'></script>
	<script type='text/javascript' src='/ExtraClassroomWebsite/public/js/LamBai.js'></script>
	<script id="MathJax-script" async src="/ExtraClassroomWebsite/public/js/tex-mml-chtml.js"></script>
</head>

<body>
	<!-- Header of web -->
	<div id="header">
		<div id="banner" class="overflow-hidden">
			<img src="/ExtraClassroomWebsite/public/img/banner.jpg" style="margin: auto;">
		</div>
		<!-- Navigation Bar -->
		<div class="navbar navbar-default my-nav">
			<ul>
				<li><a href="#">HOME</a></li>
				<li><a href="#">THI</a></li>
				<li><a href="#">KIỂM TRA</a></li>
				<li><a href="#">ĐÁNH GIÁ</a></li>
				<li><a href="#">XẾP HẠNG</a></li>
			</ul>
		</div>
		<!--  -->
	</div>
	<div class="container">
		<div id="wrapper" class="row">
			<div id="left" class="col col-8 border border-dark">
				<form>
					<div id="exam-container" class="overflow-auto container border border-dark" style="height: 400px;">
						<div id="question-content-container">
							<div id="question-content">
							</div>
						</div>
						<h4>Trả lời</h4>
						<hr>
						<div id="answer-select-container">
						</div>
					</div>

					<div id="question-select-cotainer container">
						<div id="question-num-list-container" class="row" style="text-align: center;">
							<div class="col col-1 float-left border border-dark">
								<input type="button" class="btn btn-info pre" value="&#10094;">
							</div>
							<div class="col col-10 border border-dark">
								<ul class="question-num-list" style="text-align: center;">
								</ul>
							</div>
							<div class="col col-1 float-right border border-dark">
								<input type="button" class="btn btn-info next" value="&#10095;">
							</div>
						</div>
					</div>
					<div style="text-align: center;"><input type="submit" name="submit" value="Nộp bài" class="mt-4 btn btn-success btn_submit"></div>
				</form>
			</div>
			<div id="right" class="col col-2 border border-dark">
				<section id="timer">
					<div class="row">
						<div class=" countdown-wrapper text-center mb20">
							<div class="card">
								<div class="card-header">
									Thi thử THPT Quốc gia Lớp 12<br>
									Thời gian làm bài: 90 phút
									Tổng số câu hỏi: 50 câu
								</div>
								<div class="card-block">
									<div id="countdown">
										<div class="well">
											<span id="hour" class="timer bg-success">00</span>
											<span class="dots">:</span>
											<span id="min" class="timer bg-info">00</span>
											<span class="dots">:</span>
											<span id="sec" class="timer bg-primary">00</span>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<!-- <a href="#" class="btn btn-primary">Book now</a> -->
									<a href="#" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Nộp
										bài</a>
									<!-- <a href="#" class="btn btn-danger">14 remaining</a> -->
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>


	<div id="footer">
		<footer>
			<span class="text-muted"><b>Copyright ©: Duong Pham and Duong Vo</b></span>
		</footer>
	</div>
</body>

</html>