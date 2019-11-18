<div class="container bg-light">
	<div id="wrapper" class="row">
		<div id="left" class="col col-lg-3 col-md-12">
			<section id="timer">
				<div class="row">
					<div class=" countdown-wrapper text-center mb20">
						<div class="card border-0 shadow">
							<div class="card-header">
								<p>Thi thử THPT Quốc gia Lớp 12<p>
								<p><i class="fas fa-stopwatch fa-2x"></i> Thời gian: 90 phút</p>
								<p>Tổng số câu hỏi: 50 câu</p> 
							</div>
							<div class="card-block">
								<div id="countdown">
									<div class="well">
										<span id="hour" class="timer bg-primary">00</span>
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
		<div id="right" class="col col-lg-9 ml-auto col-md-12 pt-3">
			<form>
				<div id="exam-container" class="overflow-auto container " style="height: 400px;">
					<div id="question-content-container">
						<div id="question-content">
							<?php echo $data["CauHoi"]; ?>
						</div>
					</div>
					<hr>
					<h4><i class="fas fa-check-circle"></i> Trả lời</h4>
					
					<hr>
					<div id="answer-select-container">
					</div>
				</div>

				<div id="question-select-cotainer container">
					<div id="question-num-list-container justify-content-center" class="row" style="text-align: center;">
						<div class="col col-xl-1 col-lg-1 col-md-1 col-sm-1 d-none d-sm-block ">
							<input type="button" class="btn btn-info pre" value="&#10094;">
						</div>
						<div class="col col-xl-10 col-lg-10 col-md-10 col-sm-10 col-12 border">
							<ul class="question-num-list" style="text-align: center;">
							</ul>
						</div>
						<div class="col col-xl-1 col-lg-1 col-md-1 col-sm-1 d-none d-sm-block ">
							<input type="button" class="btn btn-info next" value="&#10095;">
						</div>
					</div>
				</div>
				<div style="text-align: center;" class="pb-3"><input type="submit" name="submit" value="Nộp bài" class="mt-4 btn btn-success btn_submit"></div>
			</form>
		</div>

	</div>
</div>

