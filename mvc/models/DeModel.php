<?php
class DeModel extends MySQL{
    public function getDe($IdDe){
        $qr = "SELECT * FROM de WHERE IdDe=$IdDe";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
    }
    
    public function addDe($TenDe, $LoaiDe, $SoCauHoi, $HienDapAn, $Lop) {
        $qr = "INSERT INTO de VALUES (null, '$TenDe', $LoaiDe, $SoCauHoi, $HienDapAn, CURRENT_TIMESTAMP, $Lop)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editDe($IdDe, $TenDe, $LoaiDe, $SoCauHoi, $HienDapAn, $Lop) {
        $qr = "UPDATE de SET TenDe='$TenDe', LoaiDe=$LoaiDe, SoCauHoi=$SoCauHoi, HienDapAn=$HienDapAn', Lop=$Lop WHERE IdDe=$IdDe";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
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