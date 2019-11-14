<?php
class NguoiDungModel extends MySQL{

    public function checkTaiKhoan($username, $password){
        $qr = "SELECT * FROM nguoidung WHERE Username='$username'";

        $result = mysqli_query($this->con, $qr);
        while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
            $passwordHash = $row['Password'];

            if (password_verify($password, $passwordHash)) {
                $IdNguoiDung = $row['IdNguoiDung'];
                $LoaiTaiKhoan = $row['LoaiTaiKhoan'];
                return json_encode(["IdNguoiDung"=> $IdNguoiDung, "LoaiTaiKhoan"=> $LoaiTaiKhoan]);
            } else {
                return false;
            }
        }

        return false;

    }

}
?>