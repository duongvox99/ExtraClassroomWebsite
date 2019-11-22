<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/ExtraClassroomWebsite/public/img/icon.ico" type="image/ico" />

    <!-- NEED to do ICON -->
    <title>
        <?php
        if (isset($data["Title"])) {
            echo $data["Title"] . " | ";
        }
        ?>Bảng điều khiển giáo viên</title>

    <!-- Font Awesome -->
    <link href="/ExtraClassroomWebsite/public/font-awesome/css/all.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/jquery-confirm.min.css">

    <link href="/ExtraClassroomWebsite/public/css/BangDieuKhienGiaoVien.css" rel="stylesheet">

    <script type="text/javascript" src="/ExtraClassroomWebsite/public/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/ExtraClassroomWebsite/public/js/jquery-confirm.min.js"></script>
    <script type='text/javascript' src='/ExtraClassroomWebsite/public/js/bootstrap.js'></script>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 left_col">
                <nav class="nav flex-column my-nav">
                    <div class="navbar navbar-brand nav_title" style="border: 0;">
                        <a href="/ExtraClassroomWebsite" class="site_title"><img src="/ExtraClassroomWebsite/public/img/math-logo.png" alt="Logo" style="width:40px;"> <span><strong>ExtraClassroom</strong></span></a>
                    </div>
                    <ul class="nav flex-column my-nav-menu">
                        <li class="nav-item">
                            <a class="nav-link" href="/ExtraClassroomWebsite/GiaoVien/DanhSachNhomHocSinh"><i class="fas fa-users"></i> Nhóm lớp học</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/ExtraClassroomWebsite/GiaoVien/DanhSachDe/TatCa/1"><i class="fas fa-user"></i> Đề kiểm tra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/ExtraClassroomWebsite/GiaoVien/DanhSachNguoiDung/TatCa/1"><i class="fas fa-user"></i> Người dùng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/ExtraClassroomWebsite/GiaoVien/NganHangCauHoi/TatCa/1"><i class="fas fa-stream"></i> Ngân hàng câu hỏi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-trophy"></i> Bảng xếp hạng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-comment-dots"></i> Kênh thảo luận chung</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-10 right_col" role="main">
                <!-- top navigation -->
                <nav class="navbar navbar-default navbar-expand-md my-nav">
                    <div class="nav toggle pl-2">
                        <a id="menu_toggle" class="bar-ico-custom-color"><i class="fas fa-bars fa-2x"></i></a>
                    </div>
                    <ul class="navbar-nav ml-auto account">
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
                </nav>
                <!-- /top navigation -->
                <!-- page content -->
                <?php
                if (isset($data["SubView"])) {
                    require("pages/" . $data["SubView"] . ".php");
                } else {
                    require("pages/DanhSachNguoiDung.php");
                }
                ?>

            </div>
            <!-- /page content -->
        </div>


    </div>
    <div id="footer">
        <footer>
            <span class="text-muted"><b>Copyright © <a href="https://www.facebook.com/duongvox" target="_blank">Dương Võ</a> & <a href="https://www.facebook.com/duong.pm.1100011" target="_blank">Dương Phạm</b></span>
        </footer>
    </div>
</body>

</html>