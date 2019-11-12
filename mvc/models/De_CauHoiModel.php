<?php
class De_CauHoiModel extends MySQL{
    public function getAllIdCauHoi($idDe){
        $qr = "SELECT * FROM de_cauhoi WHERE IdDe=$idDe";
        return mysqli_query($this->con, $qr);
    }
}
?>