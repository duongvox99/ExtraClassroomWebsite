	<!-- Header of web -->
	<div id="header">
		<!-- Banner of web -->
		<div id="banner" class="overflow-hidden">
			<img src="/ExtraClassroomWebsite/public/img/banner.jpg" style="margin: auto;">
		</div>

		<!-- Navigation Bar my-nav-->
		<nav class="navbar navbar-default navbar-expand-md my-nav">
			<div class="container">
				<a class="navbar-brand" href="/ExtraClassroomWebsite"><img src="/ExtraClassroomWebsite/public/img/math-logo.png" alt="Logo" style="width:40px;"></a>
				<!-- Toggler/collapsibe Button -->
				<button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav my-nav-menu">
						<li class="nav-item">
							<a class="nav-link" href="/ExtraClassroomWebsite/HocSinh/DeKiemTra/TatCa" <?php echo ($data["SubView"] == "DeKiemTra") ? 'style="background-color: green;"' : ""; ?>>Đề kiểm tra</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ExtraClassroomWebsite/HocSinh/ThongBao/TatCa" <?php echo ($data["SubView"] == "ThongBao") ? 'style="background-color: green;"' : ""; ?>>Thông báo</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ExtraClassroomWebsite/HocSinh/KenhThaoLuanChung" <?php echo ($data["SubView"] == "KenhThaoLuanChung") ? 'style="background-color: green;"' : ""; ?>>Kênh thảo luận chung</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ExtraClassroomWebsite/HocSinh/BangXepHang/Nhom/1" <?php echo ($data["SubView"] == "BangXepHang") ? 'style="background-color: green;"' : ""; ?>>Bảng xếp hạng</a>
						</li>
					</ul>
					<!-- Search -->
					<div class="ml-auto">
						<form class="form-inline  my-2 my-lg-0" action="/action_page.php">

							<span><input class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm"></span>
							<button class="btn btn-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
						</form>
					</div>

					<ul class="navbar-nav ml-1 account">
						<!-- Dropdown -->
						<li class="nav-item dropdown ">

							<a class="nav-link dropdown-toggle account" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<img src="
								<?php
								if ($data["DataNguoiDung"]["Avatar"] != "") {
									echo $data["DataNguoiDung"]["Avatar"];
								} else {
									echo "/ExtraClassroomWebsite/public/img/no-avatar.png";
								}
								?>" alt="Avatar" class="avatar">

								<span><?php echo $data["DataNguoiDung"]["HoTen"]; ?></span>
							</a>
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-custom" aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="/ExtraClassroomWebsite/TrangChu/ThayDoiThongTin/<?php echo $data["DataNguoiDung"]["IdNguoiDung"] ?>">Thay đổi thông tin</a>
								<a class="dropdown-item" href="/ExtraClassroomWebsite/TrangChu/DangXuat">Đăng xuất</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>