<!-- <!DOCTYPE html> -->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cập nhật tài khoản</title>

    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/jquery-confirm.min.css">
    <link rel="stylesheet" type="text/css" href="/ExtraClassroomWebsite/public/css/DangNhap.css" />

    <script type="text/javascript" src="/ExtraClassroomWebsite/public/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/ExtraClassroomWebsite/public/js/jquery-confirm.min.js"></script>
</head>

<body>
    <?php
    if (isset($data["result"])) {
        if (!$data["result"]) {
            echo 
            "<script type='text/javascript'>
                $.confirm({
                    theme: 'modern',
                    title: 'Cập nhật thông tin tài khoản thất bại',
                    content: 'Bạn vui lòng kiểm tra lại các trường!',
                    type: 'red',
                    typeAnimated: true,
                    autoClose: 'tryAgain|5000',
                    buttons: {
                        tryAgain: {
                            text: 'Thử lại',
                            btnClass: 'btn-red',
                            action: function(){
                            }
                        }
                    },
                });            
            </script>";
        }
    }
    ?>
    <div class="wrapper fadeInDown">
        <div id="formContent">

            <!-- Banner -->
            <div class="fadeIn first">
                <img src="/ExtraClassroomWebsite/public/img/banner.jpg" id="banner" alt="Login Banner" />
            </div>

            <!-- Login Form -->
            <form action="" method="POST">
            <!-- 
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $Email = $_POST["Email"]' -->
                <input type="text" id="username" class="fadeIn second" name="HoTen" placeholder="Họ tên" value="">
                <input type="password" id="password" class="fadeIn third" name="Password" placeholder="Mật khẩu">
                <input type="text" id="username" class="fadeIn second" name="HoTen" placeholder="Họ tên" value="">
                <input type="submit" class="fadeIn fourth" value="Cập nhật" name="btnSubmit">
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
                <!-- <a class="underlineHover" href="/ExtraClassroomWebsite/TrangChu/QuenMatKhau">Quên mật khẩu?</a> -->
            </div>

        </div>
    </div>
    <div class="footer">
        <p id="copyright">Copyright © <a href="https://www.facebook.com/duongvox" target="_blank">Dương Võ</a> & <a href="https://www.facebook.com/duong.pm.1100011" target="_blank">Dương Phạm</a></p>
    </div>
</body>

</html>