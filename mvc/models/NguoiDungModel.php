<?php
class NguoiDungModel extends MySQL{
    public function checkTaiKhoan($username, $password) {
        $qr = "SELECT * FROM nguoidung WHERE Username='$username'";

        $result = mysqli_query($this->con, $qr);
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $passwordHash = $row["Password"];

            if (password_verify($password, $passwordHash)) {
                return $row;
            } else {
                return false;
            }
        }

        return false;
    }

    public function getAllHocSinhInNhom($IdNhom) {
        $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE nguoidung.IdNhom='$IdNhom'";

        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function addNguoiDung($Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "INSERT INTO nguoidung VALUES (null, '$Username', '$PasswordHash', '$HoTen', $NamSinh, '$Avatar', $Lop, $IdNhom, $LoaiTaiKhoan, '', '$Email', 0)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function editNguoiDung($IdNguoiDung, $Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "UPDATE nguoidung SET Username='$Username', Password='$PasswordHash', HoTen='$HoTen', NamSinh=$NamSinh, Avatar='$Avatar', Lop=$Lop, IdNhom=$IdNhom, LoaiTaiKhoan=$LoaiTaiKhoan, RandomCode='', Email='$Email' WHERE IdNguoiDung=$IdNguoiDung";

        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo $qr;
            echo "<br>";
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function getAllNguoiDung($category, $page){
        $offset = 50 * ($page - 1);
        if ($category == "TatCa") {
            $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE nguoidung.Lop=10 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE nguoidung.Lop=11 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE nguoidung.Lop=12 LIMIT 50 OFFSET $offset";
        }
        else {
            $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE nguoidung.Lop=0 LIMIT 50 OFFSET $offset";
        }
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getTotalNumberNguoiDung($category){
        if ($category == "TatCa") {
            $qr = "SELECT * FROM nguoidung";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM nguoidung WHERE nguoidung.Lop=10";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM nguoidung WHERE nguoidung.Lop=11";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM nguoidung WHERE nguoidung.Lop=12";
        }
        else {
            $qr = "SELECT * FROM nguoidung WHERE nguoidung.Lop=0";
        }

        $result = mysqli_query($this->con, $qr);
        return mysqli_num_rows($result);
    }

    public function getNguoiDung($IdNguoiDung){
        $qr = "SELECT * FROM nguoidung WHERE IdNguoiDung=$IdNguoiDung";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
    }

    public function editThongtinNguoiDung($IdNguoiDung, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $Email) {
        $PasswordHash = password_hash($Password, PASSWORD_DEFAULT);
        $qr = "UPDATE nguoidung SET Password='$PasswordHash', HoTen='$HoTen', NamSinh=$NamSinh, Avatar='$Avatar', Lop=$Lop, Email=$Email WHERE IdNguoiDung=$IdNguoiDung";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteNguoiDung($IdNguoiDung) {
        $qr = "DELETE FROM nguoidung WHERE IdNguoiDung=$IdNguoiDung";

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

    public function setDiemTong($IdNguoiDung, $DiemTong) {
        $qrResetMatKhau = "UPDATE nguoidung SET DiemTong=DiemTong+$DiemTong WHERE IdNguoiDung=$IdNguoiDung";
        if (mysqli_query($this->con, $qrResetMatKhau)) {
            return true;
        }

        return false;
    }

    public function getHocSinhRanking_Nhom_Lop($IdNhom, $Lop) {
        $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom  WHERE nguoidung.IdNhom=$IdNhom AND nguoidung.Lop=$Lop ORDER BY nguoidung.DiemTong DESC";
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getHocSinhRanking_Lop($Lop) {
        $qr = "SELECT * FROM nguoidung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom  WHERE nguoidung.Lop=$Lop ORDER BY nguoidung.DiemTong DESC";
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }
}
?>