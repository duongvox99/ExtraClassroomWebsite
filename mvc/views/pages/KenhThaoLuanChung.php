<script type="text/javascript" src="/ExtraClassroomWebsite/public/js/ckeditor.js"></script>
<script id="MathJax-script" async src="/ExtraClassroomWebsite/public/js/tex-mml-chtml.js"></script>
<div class="<?php echo (isset($data["GiaoVien"])) ? "container-fluid" : "container";?> bg-light">
	<div class="h-100">
		<div class="row justify-content-center h-100">
			<div class="col-md-12 col-xl-12 chat">
				<div class="card chat-card">
					<div class="card-header msg_head">
						<div class="d-flex bd-highlight">
							<div class="img_cont">
								<img src="/ExtraClassroomWebsite/public/img/math-logo.png" class="rounded-circle user_img">
								<span class="online_icon"></span>
							</div>
							<div class="user_info">
								<span>Kênh chat tổng</span>
								<p>1767 Messages</p>
							</div>
						</div>
					</div>
					<div class="card-body msg_card_body">
						<div class="d-flex justify-content-start mb-4">
							<div class="img_cont_msg">
								<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
								<p class="name">V.V.Dương</p>
							</div>
							<div class="msg_cotainer">
								Hi, how are you samim?
								<span class="msg_time">8:40 AM, Today</span>
							</div>
						</div>
						<div class="d-flex justify-content-end mb-4">
							<div class="msg_cotainer_send">
								Hi Khalid i am good tnx how about you?
								<span class="msg_time_send">8:55 AM, Today</span>
							</div>
							<div class="img_cont_msg">
								<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
							</div>
						</div>

						<div class="d-flex justify-content-start mb-4">
							<div class="img_cont_msg">
								<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
							</div>
							<div class="msg_cotainer">
								I am looking for your next templates
								<span class="msg_time">9:07 AM, Today</span>
							</div>
						</div>
						<div class="d-flex justify-content-start mb-4">
							<div class="img_cont_msg">
								<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
							</div>
							<div class="msg_cotainer">
								Bye, see you
								<span class="msg_time">9:12 AM, Today</span>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<textarea name="InputMessage" id="editorInputMessage"></textarea>
						<button class="btn btn-success ml-auto btn-block">Gửi tin nhắn <i class="fas fa-location-arrow"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	ClassicEditor
		.create(document.querySelector('#editorInputMessage'))
		.catch(error => {
			console.error(error);
		});
</script>