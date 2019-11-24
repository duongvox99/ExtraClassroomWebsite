<?php
class NganHangCauHoiModel extends MySQL{

    public function getAllCauHoi_Tuan_Lop($Lop, $Tuan, $MucDo, $SoCau){
        $qr = "SELECT DISTINCT IdCauHoi FROM nganhangcauhoi WHERE LoaiCauHoi=$MucDo AND Lop=$Lop AND Tuan<=$Tuan ORDER BY RAND () LIMIT $SoCau";
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getAllCauHoi($category, $page){
        $offset = 50 * ($page - 1);
        if ($category == "TatCa") {
            $qr = "SELECT * FROM nganhangcauhoi LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=10 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=11 LIMIT 50 OFFSET $offset";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=12 LIMIT 50 OFFSET $offset";
        }
        
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getTotalNumberCauHoi($category){
        if ($category == "TatCa") {
            $qr = "SELECT * FROM nganhangcauhoi";
        }
        else if ($category == "Lop10") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=10";
        }
        else if ($category == "Lop11") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=11";
        }
        else if ($category == "Lop12") {
            $qr = "SELECT * FROM nganhangcauhoi WHERE nganhangcauhoi.Lop=12";
        }

        $result = mysqli_query($this->con, $qr);
        return mysqli_num_rows($result);
    }

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