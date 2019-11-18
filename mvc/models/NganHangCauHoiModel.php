<?php
class NganHangCauHoiModel extends MySQL{
    public function getCauHoi($IdCauHoi){
        $qr = "SELECT * FROM nganhangcauhoi WHERE IdCauHoi=$IdCauHoi";
        return mysqli_fetch_array(mysqli_query($this->con, $qr), MYSQLI_ASSOC);
    }
    
    public function addCauHoi($CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop, $Tuan) {
        $qr = "INSERT INTO nganhangcauhoi VALUES (null, '$CauHoi', '$DapAn1', '$DapAn2', '$DapAn3', '$DapAn4', $DapAnDung, '$LoiGiai', $LoaiCauHoi, $Lop, $Tuan)";
        
        // echo $qr;
    
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        // echo("Error description: " . mysqli_error($this->con));
        return $result;
    }

    public function editCauHoi($IdCauHoi, $CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop) {
        $qr = "UPDATE nganhangcauhoi SET CauHoi='$CauHoi', DapAn1='$DapAn1', DapAn2='$DapAn2', DapAn3='$DapAn3', DapAn4='$DapAn4', DapAnDung=$DapAnDung, LoiGiai='$LoiGiai', LoaiCauHoi=$LoaiCauHoi, Lop=$Lop WHERE IdCauHoi=$IdCauHoi";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteCauHoi($IdCauHoi) {
        $qr = "DELETE FROM nganhangcauhoi WHERE IdCauHoi=$IdCauHoi";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>