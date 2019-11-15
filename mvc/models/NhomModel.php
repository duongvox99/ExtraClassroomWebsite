<?php
class NhomModel extends MySQL{
    public function getAllNhomHocSinh(){
        $qr = "SELECT * FROM nhom";
        $result = mysqli_query($this->con, $qr);

        // remove group admin
        mysqli_fetch_array($result, MYSQLI_ASSOC);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getNhom($IdNhom){
        $qr = "SELECT * FROM nhom WHERE IdNhom=$IdNhom";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
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