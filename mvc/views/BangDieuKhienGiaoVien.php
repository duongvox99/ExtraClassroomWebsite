<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="/ExtraClassroomWebsite/public/admin/img/favicon.ico" type="image/ico" />

    <title>Admin | Index</title>

    <!-- Bootstrap -->
    <link href="/ExtraClassroomWebsite/public/admin/asset/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/ExtraClassroomWebsite/public/font-awesome/css/all.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/ExtraClassroomWebsite/public/admin/asset/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/ExtraClassroomWebsite/public/admin/asset/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/ExtraClassroomWebsite/public/admin/asset/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="/ExtraClassroomWebsite/public/admin/css/custom.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/ExtraClassroomWebsite/public/admin/css/mycss.css" rel="stylesheet">


</head>

<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="/ExtraClassroomWebsite" class="site_title"><img src="/ExtraClassroomWebsite/public/img/math-logo.png" alt="Logo" style="width:40px;"> <span><strong>ExtraClassroom</strong></span></a>
                    </div>
                    <div class="clearfix"></div>
                    <!-- menu profile quick info -->

                    <!-- /menu profile quick info -->
                    <br />
                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section my-side-menu">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fas fa-home"></i> Home</a></li>
                                <li><a><i class="fas fa-user"></i> User</a></li>
                                <li><a><i class="far fa-building"></i> Category</a></li>
                                <li><a><i class="far fa-newspaper"></i> Article</a></li>
                                <li><a><i class="fas fa-sliders-h"></i> Silders</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->
                </div>
            </div>
            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu my-nav">
                    <nav>
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="/ExtraClassroomWebsite/public/admin/img/img.jpg" alt="">John Doe
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="/ExtraClassroomWebsite/TrangChu/ThayDoiThongTin"> Thay đổi thông tin</a></li>
                                    <li><a href="/ExtraClassroomWebsite/TrangChu/DangXuat"><i class="fa fa-sign-out pull-right"></i> Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->
            <!-- page content -->
            <div class="right_col" role="main">
                <?php 
                    if (isset($data["SubView"])) {
                        require("pages/" .$data["SubView"] . ".php");
                    }
                    else {
                        require("pages/DanhSachUser.php");
                    }
                ?>

            </div>
            <!-- /page content -->
            <!-- footer -->
            <footer>
                <div id="footer">
                    <span class="text-muted"><b>Copyright © <a href="https://www.facebook.com/duongvox" target="_blank">Dương Võ</a> & <a href="https://www.facebook.com/duong.pm.1100011" target="_blank">Dương Phạm</b></span>
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer -->
        </div>
    </div>
    <!-- jQuery -->
    <script src="/ExtraClassroomWebsite/public/admin/js/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/ExtraClassroomWebsite/public/admin/asset/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/ExtraClassroomWebsite/public/admin/js/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/ExtraClassroomWebsite/public/admin/asset/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/ExtraClassroomWebsite/public/admin/asset/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/ExtraClassroomWebsite/public/admin/asset/iCheck/icheck.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="/ExtraClassroomWebsite/public/admin/js/custom.min.js"></script>
</body>

</html>