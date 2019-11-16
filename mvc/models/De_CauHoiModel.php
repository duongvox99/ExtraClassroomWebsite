<?php
class De_CauHoiModel extends MySQL{
    public function getAllCauHoi_DapAn_De($IdDe){
        $qr = "SELECT * FROM de_cauhoi INNER JOIN nganhangcauhoi ON de_cauhoi.IdCauHoi=nganhangcauhoi.IdCauHoi WHERE IdDe=$IdDe";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getAllCauHoi_De($IdDe){
        $qr = "SELECT * FROM de_cauhoi INNER JOIN nganhangcauhoi ON de_cauhoi.IdCauHoi=nganhangcauhoi.IdCauHoi WHERE IdDe=$IdDe";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, array("IdCauHoi" => $row["IdCauHoi"], "CauHoi" => $row["CauHoi"], "DapAn1" => $row["DapAn1"], "DapAn2" => $row["DapAn2"], "DapAn3" => $row["DapAn3"], "DapAn4" => $row["DapAn4"]));
        }
        return $output;
    }
    
    public function addDe_CauHoi($IdDe, $IdCauHoi) {
        $qr = "INSERT INTO de_cauhoi VALUES ($IdDe, $IdCauHoi)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editDe_CauHoi($IdDe, $IdCauHoi) {
        $qr = "UPDATE de_cauhoi SET IdDe=$IdDe, IdCauHoi=$IdCauHoi WHERE IdDe=$IdDe AND IdCauHoi=$IdCauHoi";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteDe_CauHoi($IdDe, $IdCauHoi) {
        $qr = "DELETE FROM de_cauhoi WHERE IdDe=$IdDe AND IdCauHoi=$IdCauHoi";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>