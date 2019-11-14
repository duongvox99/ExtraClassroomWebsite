<?php
class NhomModel extends MySQL{
    public function getNhom($IdNhom){
        $qr = "SELECT * FROM nhom WHERE IdNhom=$IdNhom";
        return mysqli_fetch_array(mysqli_query($this->con, $qr));
    }
    
    public function addNhom($TenNhom, $SoLuong, $Lop) {
        $qr = "INSERT INTO nhom VALUES (null, '$TenNhom', $SoLuong, $Lop)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editNhom($IdNhom, $TenNhom, $SoLuong, $Lop) {
        $qr = "UPDATE nhom SET TenNhom='$TenNhom', SoLuong='$SoLuong', Lop='$Lop' WHERE IdNhom=$IdNhom";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteNhom($IdNhom) {
        $qr = "DELETE FROM nhom WHERE IdNhom=$IdNhom";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>