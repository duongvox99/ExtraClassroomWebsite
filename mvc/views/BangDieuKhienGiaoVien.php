<!DOCTYPE html>
<html lang="en">
<head>
    <?php require_once("heads/BangDieuKhienGiaoVien.php");?>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><img src="/ExtraClassroomWebsite/public/img/math-logo.png" alt="Logo" style="width:40px;"> <span>Gentelella Alela!</span></a>
                </div>
                <div class="clearfix"></div>
                <!-- menu profile quick info -->
                
                <!-- /menu profile quick info -->
                <br/>
                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section my-side-menu">
                        <h3>General</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fas fa-home"></i>  Home</a></li>
                            <li><a><i class="fas fa-user"></i>  User</a></li>
                            <li><a><i class="far fa-building"></i>  Category</a></li>
                            <li><a><i class="far fa-newspaper"></i>  Article</a></li>
                            <li><a><i class="fas fa-sliders-h"></i>  Silders</a></li>
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
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <img src="/ExtraClassroomWebsite/public/admin/img/img.jpg" alt="">John Doe
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;"> Profile</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="badge bg-red pull-right">50%</span>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li><a href="javascript:;">Help</a></li>
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

            <?php require_once("pages/DanhSachUser.php");?>

        </div>
        <!-- /page content -->
        <!-- footer -->
        <footer>
            <div id="footer">
                <span class="text-muted"><b>Copyright ©: Duong Pham and Duong Vo</b></span>
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