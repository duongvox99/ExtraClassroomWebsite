<?php
class DeModel extends MySQL{
    public function getAllDe($category, $page){
        $offset = 50 * ($page - 1);
        if ($category == "TatCa") {
            $qr = "SELECT * FROM de LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM de WHERE de.Lop=10 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM de WHERE de.Lop=11 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM de WHERE de.Lop=12 LIMIT 50 OFFSET $offset";
        }
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getTotalNumberDe($category){
        if ($category == "TatCa") {
            $qr = "SELECT * FROM de";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM de WHERE de.Lop=10";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM de WHERE de.Lop=11";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM de WHERE de.Lop=12";
        }

        $result = mysqli_query($this->con, $qr);
        return mysqli_num_rows($result);
    }

    public function getDeNhom() {
        // NEED TO DO
        // Chỉ trả về đề cho nhóm lớp
        
        $qr = "SELECT * FROM de";
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getDe($IdDe){
        $qr = "SELECT * FROM de WHERE IdDe=$IdDe";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
    }

    public function getIdDe($TenDe){
        $qr = "SELECT IdDe FROM de WHERE TenDe='$TenDe'";
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }
    
    public function addDe($TenDe, $LoaiDe, $HienDapAn, $NgayTaoDe, $Lop, $Tuan, $SoCauDe, $SoCauTrungBinh, $SoCauKho) {
        $qr = "INSERT INTO de VALUES (null, '$TenDe', $LoaiDe, $HienDapAn, '$NgayTaoDe', $Lop, $Tuan, $SoCauDe, $SoCauTrungBinh, $SoCauKho)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function editDe($IdDe, $TenDe, $LoaiDe, $HienDapAn, $NgayTaoDe, $Lop, $Tuan, $SoCauDe, $SoCauTrungBinh, $SoCauKho) {
        $qr = "UPDATE de SET TenDe='$TenDe', LoaiDe=$LoaiDe, HienDapAn=$HienDapAn, NgayTaoDe='$NgayTaoDe', Lop=$Lop, Tuan=$Tuan, SoCauDe=$SoCauDe, SoCauTrungBinh=$SoCauTrungBinh, SoCauKho=$SoCauKho WHERE IdDe=$IdDe";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }

    public function deleteDe($IdDe) {
        $qr = "DELETE FROM de WHERE IdDe=$IdDe";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>