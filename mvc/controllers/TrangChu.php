<?php

class TrangChu extends Controller
{
    public $NguoiDungModel;

    public function __construct()
    {
        // init model
        $this->NguoiDungModel = $this->model("NguoiDungModel");
    }

    function
    Default()
    {
        $this->DangNhap();
    }

    public function DangNhap()
    {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("DangNhap");
        } else {
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
                } else {
                    $this->view("DangNhap", [
                        "result" => $result
                    ]);
                }
            }
        }
    }

    public function QuenMatKhau()
    {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("QuenMatKhau");
        } else {
            $username = $_POST["username"];
            $email = $_POST["email"];

            if (!is_null($username) and !is_null($email)) {
                $resultSendLinkVerifyToResetMatKhau = false;
                $randomCode = substr(md5(uniqid(mt_rand(), true)), 0, 8);
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
    public function ResetMatKhau($username, $randomCode)
    {
        if (!is_null($randomCode) && !is_null($username)) {
            $resultResetMatKhau = $this->NguoiDungModel->ResetMatKhau($username, $randomCode);
            if ($resultResetMatKhau) {
                header("Location: /ExtraClassroomWebsite");
            } else {
                $this->view("404");
            }
        }
    }

    public function ThayDoiThongTin()
    {
        $IdNguoiDung = $_SESSION["IdNguoiDung"];
        $DataNguoiDung = $this->NguoiDungModel->getNguoiDung($IdNguoiDung);
        if (!isset($_POST["btnSubmit"])) {
            $this->view("ThayDoiThongTin", ["DataNguoiDung" => $DataNguoiDung]);
        } else {
            $error = "";

            $NewPassword = $_POST["Password"];
            if ($NewPassword != "") {
                $result = $this->NguoiDungModel->editPasswordNguoiDung($IdNguoiDung, $NewPassword);
            }

            $Avatar = $_POST["Avatar"];
            if ($Avatar != "") {
                $target_dir = "/ExtraClassroomWebsite/uploads/";
                $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
                $uploadOk = 1;
                $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
                // Check if image file is a actual image or fake image
                if (isset($_POST["submit"])) {
                    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
                    if ($check !== false) {
                        echo "File is an image - " . $check["mime"] . ".";
                        $uploadOk = 1;
                    } else {
                        echo "File is not an image.";
                        $uploadOk = 0;
                    }
                }
                // Check if file already exists
                if (file_exists($target_file)) {
                    echo "Sorry, file already exists.";
                    $uploadOk = 0;
                }
                // Check file size
                if ($_FILES["fileToUpload"]["size"] > 500000) {
                    echo "Sorry, your file is too large.";
                    $uploadOk = 0;
                }
                // Allow certain file formats
                if (
                    $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                    && $imageFileType != "gif"
                ) {
                    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                    $uploadOk = 0;
                }
                // Check if $uploadOk is set to 0 by an error
                if ($uploadOk == 0) {
                    echo "Sorry, your file was not uploaded.";
                    // if everything is ok, try to upload file
                } else {
                    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
                        echo "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
                    } else {
                        echo "Sorry, there was an error uploading your file.";
                    }
                }

                $result = $this->NguoiDungModel->editAvatarNguoiDung($IdNguoiDung, $Avatar);
            }

            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];

            $Email = $_POST["Email"];
            // CALL API CHECKMAIL
            if (!$this->CallAPICheckExistEmail($Email)) {
                $result = false;
                $error = "Địa chỉ email không tồn tại!";
            } else {
                $result = $this->NguoiDungModel->editThongtinNguoiDung($IdNguoiDung, $HoTen, $NamSinh, $Email);
            }

            if ($result) {
                $this->DangXuat();
            } else {
                $this->view("ThayDoiThongTin", [
                    "result" => $result,
                    "error" => $error,
                    "DataNguoiDung" => $DataNguoiDung
                ]);
            }
        }
    }

    // API
    public function CallAPICheckExistEmail($Email)
    {
        return true;
    }

    public function DangXuat()
    {
        // remove all session variables
        session_unset();

        // destroy the session
        session_destroy();

        header("Location: /ExtraClassroomWebsite");
    }
}
?>