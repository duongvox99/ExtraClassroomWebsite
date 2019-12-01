<?php
class NguoiDung_ThongBaoModel extends MySQL{
    
    public function getAllUnReadThongBao($IdNguoiDung, $IdNhom, $SearchString) {
        $qr = "SELECT * FROM thongbaonhom WHERE thongbaonhom.IdNhom=$IdNhom AND (thongbaonhom.TieuDe like '%$SearchString%') AND thongbaonhom.IdThongBao NOT IN (
            SELECT nguoidung_thongbao.IdThongBao FROM nguoidung_thongbao WHERE nguoidung_thongbao.IdNguoiDung=$IdNguoiDung)
          ORDER BY thongbaonhom.NgayTao DESC";

        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function getAllReadThongBao($IdNguoiDung, $IdNhom, $SearchString) {
        $qr = "SELECT * FROM thongbaonhom WHERE thongbaonhom.IdNhom=$IdNhom AND (thongbaonhom.TieuDe like '%$SearchString%') AND thongbaonhom.IdThongBao IN (
            SELECT nguoidung_thongbao.IdThongBao FROM nguoidung_thongbao WHERE nguoidung_thongbao.IdNguoiDung=$IdNguoiDung)
          ORDER BY thongbaonhom.NgayTao DESC";
        $result = mysqli_query($this->con, $qr);
        $output = array();
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            array_push($output, $row);
        }
        return $output;
    }

    public function addNguoiDung_ThongBao($IdNguoiDung, $IdThongBao) {
        $qr = "INSERT INTO nguoidung_thongbao VALUES ($IdNguoiDung, $IdThongBao)";
        
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
