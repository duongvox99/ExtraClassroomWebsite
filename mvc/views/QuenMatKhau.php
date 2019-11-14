<!-- <!DOCTYPE html> -->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập</title>

    <!-- <link rel="stylesheet" type="text/css" href="./public/css/bootstrap.css" /> -->
    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/DangNhap.css" />

    <!-- <script type="text/javascript" src="./public/js/jquery-3.4.1.js"></script> -->
</head>

<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Banner -->

            <div class="fadeIn first">
                <img src="/ExtraClassroomWebsite/public/img/banner.jpg" id="banner" alt="Login Banner" />
            </div>

            <!-- Login Form -->
            <form action="" method="POST">
                <input type="text" id="username" class="fadeIn second" name="username" placeholder="Tên đăng nhập">
                <input type="text" id="email" class="fadeIn third" name="email" placeholder="Email">
                <input type="submit" class="fadeIn fourth" value="Reset mật khẩu" name="btnSubmit">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
                <a class="underlineHover" href="/ExtraClassroomWebsite/TrangChu/DangNhap">Quay trở lại đăng nhập?</a>
            </div>

        </div>
    </div>
    <div class="footer">
    <p id="copyright">Copyright © <a href="https://www.facebook.com/duongvox" target="_blank">Dương Võ</a> & <a href="https://www.facebook.com/duong.pm.1100011" target="_blank">Dương Phạm</a></p>
    </div>
</body>

</html>