<?php
class NguoiDungModel extends MySQL{

    public function checkLogin($username, $password){
        $qr = "SELECT * FROM nguoidung WHERE Username='$username'";
        return mysqli_query($this->con, $qr);
    }

}
?>