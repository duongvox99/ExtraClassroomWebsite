<?php
class Diem_DeModel extends MySQL{
    public function addDiem_De($IdNguoiDung, $IdDe, $LanLam, $Diem) {
        $qr = "INSERT INTO diem_de VALUES ($IdNguoiDung, $IdDe, $LanLam, $Diem)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function getHocSinhRanking_De($IdDe) {
        $qr = "SELECT * FROM diem_de INNER JOIN nguoidung ON diem_de.IdNguoiDung=nguoidung.IdNguoiDung WHERE IdDe=$IdDe ORDER BY Diem DESC";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, array("HoTen" => $row["HoTen"], "NamSinh" => $row["NamSinh"], "Avatar" => $row["Avatar"], "Lop" => $row["Lop"], "Email" => $row["Email"], "Diem" => $row["Diem"]));
        }
        return $output;
    }

    public function getHocSinhRanking_De_Nhom($IdDe, $IdNhom) {
        $qr = "SELECT * FROM diem_de INNER JOIN nguoidung ON diem_de.IdNguoiDung=nguoidung.IdNguoiDung WHERE IdDe=$IdDe AND IdNhom=$IdNhom ORDER BY Diem DESC";

        $result = mysqli_query($this->con, $qr);

        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, array("HoTen" => $row["HoTen"], "NamSinh" => $row["NamSinh"], "Avatar" => $row["Avatar"], "Lop" => $row["Lop"], "Email" => $row["Email"], "Diem" => $row["Diem"]));
        }
        return $output;
    }
}
?>