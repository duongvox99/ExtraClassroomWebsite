<?php
class NguoiDungModel extends MySQL{

    public function checkTaiKhoan($username, $password) {
        $qr = "SELECT * FROM nguoidung WHERE Username='$username'";

        $result = mysqli_query($this->con, $qr);
        while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
            $passwordHash = $row["Password"];

            if (password_verify($password, $passwordHash)) {
                $IdNguoiDung = $row["IdNguoiDung"];
                $LoaiTaiKhoan = $row["LoaiTaiKhoan"];

                return array("IdNguoiDung"=> $IdNguoiDung, "LoaiTaiKhoan"=> $LoaiTaiKhoan);
            } else {
                return false;
            }
        }

        return false;

    }

    public function setRandomCode($username, $email, $randomCode) {
        $qrCheckExist = "SELECT * FROM nguoidung WHERE Username='$username' AND Email = '$email'";
        if (mysqli_num_rows(mysqli_query($this->con, $qrCheckExist)) == 1) {
            
            $qrSetRandomCode = "UPDATE nguoidung SET RandomCode = '$randomCode' WHERE Username='$username' AND Email = '$email'";
            if (mysqli_query($this->con, $qrSetRandomCode)) {
                return true;
            }
        }
        return false;
    }

    public function resetMatKhau($username, $randomCode) {
        $newPassword = password_hash('123456', PASSWORD_DEFAULT);
        $qrResetMatKhau = "UPDATE nguoidung SET RandomCode = '', Password='$newPassword' WHERE Username='$username' AND RandomCode = '$randomCode'";
        if (mysqli_query($this->con, $qrResetMatKhau)) {
            return true;
        }

        return false;
    }

}
?>