<?php

class Hocsinh extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;

    public $DataNguoiDung;
    
    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        
        $this->DataNguoiDung = array("IdNguoiDung" => $_SESSION["IdNguoiDung"],
                                "HoTen" => $_SESSION["HoTen"],
                                "NamSinh" => $_SESSION["NamSinh"],
                                "Avatar" => $_SESSION["Avatar"],
                                "Lop" => $_SESSION["Lop"],
                                "IdNhom" => $_SESSION["IdNhom"],
                                "Email" => $_SESSION["Email"],
                                "DiemTong" => $_SESSION["DiemTong"]
                            );
    }

    public function Default(){
        $this->ThongBao(1);
    }

    public function LamBai(){
        $data = $this->NganHangCauHoiModel->getCauHoi(1);
        $this->view("BangDieuKhienHocSinh", [
            "SubView" => "LamBai",
            "DataAllCauHoi" => [
                0 => $data,
                1 => $data,
                2 => $data,
                3 => $data,
                4 => $data,
                5 => $data,
                6 => $data,
                7 => $data,
                8 => $data,
                9 => $data,
                
                ]
        ]);
    }

    public function XemBangXepHangNhom() {
        print_r($this->IdNhom);
        echo "<br>";
        echo $this->Lop;
        echo "<br>";
        $result = $this->NguoiDungModel->getHocSinhRanking_Nhom_Lop($this->IdNhom, $this->Lop);

        print_r($result);
    }

    public function XemBangXepHangLop() {
        print_r($this->IdNhom);
        echo "<br>";
        echo $this->Lop;
        echo "<br>";
        $result = $this->NguoiDungModel->getHocSinhRanking_Lop($this->Lop);

        print_r($result);
    }

    public function ThongBao($page) {
        $this->view("BangDieuKhienHocSinh", [
            "SubView" => "ThongBao",
            "Title" => "Thông báo",
            "DataNguoiDung" => $this->DataNguoiDung
        ]);
    }

    public function KenhThaoLuanChung() {
        $this->view("BangDieuKhienHocSinh", [
            "SubView" => "KenhThaoLuanChung",
            "Title" => "Kênh thảo luận chung",
            // "DataNguoiDung" => $DataNguoiDung
        ]);
    }

    public function BangXepHang() {
        $this->view("BangDieuKhienHocSinh", [
            "SubView" => "BangXepHang",
            // "DataNguoiDung" => $DataNguoiDung
        ]);
    }
}
?>