<?php

class Hocsinh extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;

    public $IdNguoiDung;
    public $HoTen;
    public $NamSinh;
    public $Avatar;
    public $Lop;
    public $IdNhom;
    public $Email;
    public $DiemTong;

    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        
        $this->IdNguoiDung = $_SESSION["IdNguoiDung"];
        $this->HoTen = $_SESSION["HoTen"];
        $this->NamSinh = $_SESSION["NamSinh"];
        $this->Avatar = $_SESSION["Avatar"];
        $this->Lop = $_SESSION["Lop"];
        $this->IdNhom = $_SESSION["IdNhom"];
        $this->Email = $_SESSION["Email"];
        $this->DiemTong = $_SESSION["DiemTong"];
    }

    public function Default(){
        $this->view("BangDieuKhienHocSinh");
    }

    public function LamBai(){
        $this->view("LamBai");
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
}
?>