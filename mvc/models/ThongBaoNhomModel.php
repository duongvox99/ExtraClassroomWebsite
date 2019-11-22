<?php
class ThongBaoNhomModel extends MySQL{
    public function getAllThongBaoNhom($IdNhom){
        
        $qr = "SELECT * FROM thongbaonhom WHERE IdNhom=$IdNhom ORDER BY NgayTao DESC";
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getThongBaoNhom($IdThongBao, $IdNhom){
        $qr = "SELECT * FROM thongbaonhom WHERE IdThongBao=$IdThongBao AND IdNhom=$IdNhom";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
    }
    
    public function addThongBaoNhom($IdNhom, $TieuDe, $NoiDung, $NgayTao) {
        $qr = "INSERT INTO thongbaonhom VALUES (null, $IdNhom, '$TieuDe', '$NoiDung', '$NgayTao')";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function editThongBaoNhom($IdThongBao, $IdNhom, $TieuDe, $NoiDung, $NgayTao) {
        $qr = "UPDATE thongbaonhom SET TieuDe='$TieuDe', NoiDung='$NoiDung', NgayTao='$NgayTao' WHERE IdNhom=$IdNhom AND IdThongBao=$IdThongBao";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function deleteThongBaoNhom($IdThongBao, $IdNhom) {
        $qr = "DELETE FROM thongbaonhom WHERE IdThongBao=$IdThongBao AND IdNhom=$IdNhom";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>