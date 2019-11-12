<?php
class NganHangCauHoiModel extends MySQL{
    public function getCauHoi($idCauHoi){
        $qr = "SELECT * FROM nganhangcauhoi WHERE IdCauHoi=$idCauHoi";
        return mysqli_query($this->con, $qr);
    }
}
?>