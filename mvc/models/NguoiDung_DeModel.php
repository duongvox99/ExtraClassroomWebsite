<?php
class NguoiDung_DeModel extends MySQL{
    
    public function getAllUnReadDeNhom($IdNguoiDung, $IdNhom) {
        $qr = " SELECT * FROM de_nhom INNER JOIN de ON de_nhom.IdDe=de.IdDe 
                WHERE de_nhom.IdNhom=$IdNhom AND de_nhom.IdDe NOT IN(
                    SELECT nguoidung_de.IdDe
                    FROM nguoidung_de
                    WHERE nguoidung_de.IdNguoiDung =$IdNguoiDung)
                 ORDER BY de_nhom.ThoiGianMo DESC";

        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getAllReadDeNhom($IdNguoiDung, $IdNhom) {
        $qr = " SELECT * FROM de_nhom INNER JOIN de ON de_nhom.IdDe=de.IdDe 
                WHERE de_nhom.IdNhom=$IdNhom AND de_nhom.IdDe IN(
                    SELECT nguoidung_de.IdDe
                    FROM nguoidung_de
                    WHERE nguoidung_de.IdNguoiDung=$IdNguoiDung)
                 ORDER BY de_nhom.ThoiGianMo DESC";

        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function addNguoiDung_De($IdNguoiDung, $IdDe) {
        $qr = "INSERT INTO nguoidung_de VALUES ($IdNguoiDung, $IdDe)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        else {
            echo mysqli_error($this->con);
        }
        return $result;
    }
}
?>