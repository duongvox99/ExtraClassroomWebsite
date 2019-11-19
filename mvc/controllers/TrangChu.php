<?php

class TrangChu extends Controller{
    public $NguoiDungModel;

    public function __construct() {
        // init model
        $this->NguoiDungModel = $this->model("NguoiDungModel");
    }

    function Default(){
        echo "Welcome";
    }

    public function DangNhap(){
        if (!isset($_POST["btnSubmit"])) {
            $this->view("DangNhap");
        }
        else {
            $username = $_POST["username"];
            $password = $_POST["password"];

            if (!is_null($username) and !is_null($password)) {
                $result = $this->NguoiDungModel->checkTaiKhoan($username, $password);
                
                // print_r($result);

                // Đăng nhập thành công sẽ trả về ID và Loại tài khoản
                if ($result) {
                    // Lưu lại Session
                    $_SESSION["IdNguoiDung"] = $result["IdNguoiDung"];
                    $_SESSION["LoaiTaiKhoan"] = $result["LoaiTaiKhoan"];
                    $_SESSION['loggedin_time'] = time();


                    $_SESSION["HoTen"] = $result["HoTen"];
                    $_SESSION["NamSinh"] = $result["NamSinh"];
                    $_SESSION["Avatar"] = $result["Avatar"];
                    $_SESSION["Lop"] = $result["Lop"];
                    $_SESSION["IdNhom"] = $result["IdNhom"];
                    $_SESSION["Email"] = $result["Email"];
                    $_SESSION["DiemTong"] = $result["DiemTong"];

                    // Đi tới trang chủ
                    header("Location: /ExtraClassroomWebsite");
                }
                else {
                    $this->view("DangNhap", [
                        "result" => $result
                    ]);
                }
            }
        }
    }

    public function QuenMatKhau(){
        if (!isset($_POST["btnSubmit"])) {
            $this->view("QuenMatKhau");
        }
        else {
            $username = $_POST["username"];
            $email = $_POST["email"];

            if (!is_null($username) and !is_null($email)) {
                $resultSendLinkVerifyToResetMatKhau = false;
                $randomCode = substr(md5(uniqid(mt_rand(), true)) , 0, 8);
                $resultSetRandomCode = $this->NguoiDungModel->setRandomCode($username, $email, $randomCode);
                if ($resultSetRandomCode) {
                    $url = 'http://' . $_SERVER['SERVER_NAME'] . '/ExtraClassroomWebsite/TrangChu/ResetMatKhau/' . $username . '/' . $randomCode;

                    $subject = '[ExtraClassroom] Reset Password ' . $username;
                    $message = '<p>Ch&agrave;o bạn,</p>';
                    $message .= '<p>&nbsp;</p>';
                    $message .= '<p>Bạn vừa y&ecirc;u cầu hệ thống reset lại mật khẩu của t&agrave;i khoản <strong>' . $username . '</strong>.</p>';
                    $message .= '<p>Vui l&ograve;ng truy cập đường dẫn <a href="' . $url . '">n&agrave;y</a> để thiết lập mật khẩu lại về: <strong>123456</strong></p>';
                    $message .= '<p>&nbsp;</p>';
                    $message .= '<p>Ch&uacute;c bạn th&agrave;nh c&ocirc;ng.</p>';
                    $message .= '<p>&nbsp;</p>';
                    $message .= '<p>Tr&acirc;n trọng,</p>';
                    $message .= '<p>Dương</p>';

                    $headers = 'From: duongsoftware@gmail.com' . "\r\n";
                    $headers .= 'MIME-Version: 1.0' . "\r\n";
                    $headers .= 'Content-type: text/html; charset=iso-8859-1';

                    if (mail($email, $subject, $message, $headers)) {
                        $resultSendLinkVerifyToResetMatKhau = true;
                    }
                }

                // Về lại trang quên mật khẩu thông báo kết quả đã gửi hay chưa cho người dùng
                $this->view("QuenMatKhau", [
                    "result" => $resultSendLinkVerifyToResetMatKhau
                ]);
            }
        }
    }


    // HIDDEN (NO VIEW)
    public function ResetMatKhau($username, $randomCode) {
        if (!is_null($randomCode) && !is_null($username)) {
            $resultResetMatKhau = $this->NguoiDungModel->ResetMatKhau($username, $randomCode);
            if ($resultResetMatKhau) {
                header("Location: /ExtraClassroomWebsite");
            }
            else {
                $this->view("404");
            }
        }
    }

    public function ThayDoiThongTin() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("ThayDoiThongTin");
        }
        else {
            $IdNguoiDung = $_SESSION["logined_IdNguoiDung"];
            $Password = $_POST["Password"];
            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $Email = $_POST["Email"];

            $result = $this->NguoiDungModel->editNguoiDung($IdNguoiDung, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $Email);
            if ($result) {
                header("Location: /ExtraClassroomWebsite");
            }
            else {
                $this->view("ThayDoiThongTin", [
                    "result" => $result,
                ]);
            }
        }
    }

    public function DangXuat() {
        // remove all session variables
        session_unset();

        // destroy the session
        session_destroy();

        header("Location: /ExtraClassroomWebsite");
    }
}
?>