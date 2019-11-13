<?php
class NganHangCauHoiModel extends MySQL{
    public function getCauHoi($idCauHoi){
        $qr = "SELECT * FROM nganhangcauhoi WHERE IdCauHoi=$idCauHoi";
        return mysqli_query($this->con, $qr);
    }
    
    public function addCauHoi($CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop) {
        $qr = "INSERT INTO nganhangcauhoi VALUES (null, '$CauHoi', '$DapAn1', '$DapAn2', '$DapAn3', '$DapAn4', $DapAnDung, '$LoiGiai', $LoaiCauHoi, $Lop)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }
}
?>