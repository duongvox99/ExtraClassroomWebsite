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
                    $_SESSION["logined_IdNguoiDung"] = $result["IdNguoiDung"];
                    $_SESSION["logined_IdLoaiTaiKhoan"] = $result["LoaiTaiKhoan"];
                    $_SESSION['loggedin_time'] = time();

                    // Đi tới về trang chủ
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

    public function ResetMatKhau($username, $randomCode) {
        if (!is_null($randomCode) && !is_null($username)) {
            $resultResetMatKhau = $this->NguoiDungModel->ResetMatKhau($username, $randomCode);
            if ($resultResetMatKhau) {
                $this->view("DangNhap");
            }
            else {
                $this->view("Loi");
            }
        }
    }

    public function DoiMatKhau() {

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