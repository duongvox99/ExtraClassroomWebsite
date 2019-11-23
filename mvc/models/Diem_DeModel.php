<?php
class Diem_DeModel extends MySQL{
    public function addDiem_De($IdNguoiDung, $IdDe, $Diem) {
        $qr = "INSERT INTO diem_de VALUES ($IdNguoiDung, $IdDe, $Diem)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function getHocSinhDiem_De($IdDe, $IdNguoiDung) {
        $qr = "SELECT * FROM diem_de WHERE IdDe=$IdDe AND IdNguoiDung=$IdNguoiDung";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    } 

    public function getHocSinhRanking_De($IdDe) {
        $qr = "SELECT * FROM diem_de INNER JOIN nguoidung ON diem_de.IdNguoiDung=nguoidung.IdNguoiDung INNER JOIN nhom ON nguoidung.IdNhom=nhom.IdNhom WHERE diem_de.IdDe=$IdDe ORDER BY diem_de.Diem DESC";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }
}
?>