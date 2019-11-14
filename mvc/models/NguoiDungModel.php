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

    public function getNguoiDung($IdNguoiDung){
        $qr = "SELECT * FROM nguoidung WHERE IdNguoiDung=$IdNguoiDung";
        return mysqli_fetch_array(mysqli_query($this->con, $qr));
    }

    public function addHocSinh($Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $RandomCode, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "INSERT INTO nguoidung VALUES (null, '$Username', '$PasswordHash', '$HoTen', $NamSinh, '$Avatar', $Lop, $IdNhom, $LoaiTaiKhoan, '$RandomCode', '$Email')";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editHocSinh($IdNguoiDung, $Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $RandomCode, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "UPDATE nguoidung SET Username='$Username', Password='$PasswordHash', HoTen='$HoTen', NamSinh=$NamSinh, Avatar='$Avatar', Lop=$Lop, IdNhom=$IdNhom, LoaiTaiKhoan=$LoaiTaiKhoan, RandomCode='$RandomCode', Email=$Email WHERE IdNguoiDung=$IdNguoiDung";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editNguoiDung($IdNguoiDung, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "UPDATE nguoidung SET Password='$PasswordHash', HoTen='$HoTen', NamSinh=$NamSinh, Avatar='$Avatar', Lop=$Lop, Email=$Email WHERE IdNguoiDung=$IdNguoiDung";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteHocSinh($IdNguoiDung) {
        $qr = "DELETE FROM nguoidung WHERE IdNguoiDung=$IdNguoiDung AND LoaiTaiKhoan=1";

        if (mysqli_query($this->con, $qr)) {
            return true;
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