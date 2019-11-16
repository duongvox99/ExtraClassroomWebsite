<?php
class De_NhomModel extends MySQL{
    public function addDe_Nhom($IdNhom, $IdDe, $ThoiGianMo, $ThoiGianDong) {
        $qr = "INSERT INTO de_nhom VALUES ($IdNhom, $IdDe, $ThoiGianMo, $ThoiGianDong)";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function editDe_Nhom($IdNhom, $IdDe, $ThoiGianMo, $ThoiGianDong) {
        $qr = "UPDATE de_nhom SET IdNhom=$IdNhom, IdDe=$IdDe, ThoiGianMo=$ThoiGianMo, ThoiGianDong=$ThoiGianDong WHERE IdNhom=$IdNhom AND IdDe=$IdDe";
        
        $result = false;
        if (mysqli_query($this->con, $qr)) {
            $result = true;
        }
        return $result;
    }

    public function deleteDe_Nhom($IdNhom, $IdDe) {
        $qr = "DELETE FROM de_nhom WHERE IdNhom=$IdNhom AND IdDe=$IdDe";

        if (mysqli_query($this->con, $qr)) {
            return true;
        }
        return false;
    }
}
?>