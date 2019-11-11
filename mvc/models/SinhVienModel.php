<?php
class SinhVienModel extends MySQL{
    public function GetSV(){
        return "Nguyen Van Teo";
    }

    public function Tong($n, $m){
        return $n + $m;
    }

    public function SinhVien(){
        $qr = "SELECT * FROM hocsinh";
        return mysqli_query($this->con, $qr);
    }

}
?>