<?php

class GiaoVien extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;
    public $NhomModel;

    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        $this->NhomModel = $this->model("NhomModel");
    }

    public function Default() {
        // Can goi model cho trang dashboard
        $this->view("BangDieuKhienGiaoVien");
    }

    // ####################################################################################
    public function ThemHocSinh() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", ["subview" => "ThemHocSinh"]);
        }
        else {
            $Username = $_POST["Username"];
            $Password = $_POST["Password"];
            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $IdNhom = $_POST["IdNhom"];
            $LoaiTaiKhoan = 1;
            $RandomCode = "";
            $Email = $_POST["Email"];

            $result = $this->NguoiDungModel->addHocSinh($Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $RandomCode, $Email);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Thêm",
                "type" => "học sinh"
            ]);
        }
    }

    public function ChinhSuaHocSinh($IdNguoiDung) {
        if (!isset($_POST["btnSubmit"])) {
            $DataNguoiDung = $this->NguoiDungModel->getNguoiDung($IdNguoiDung);
            
            if ($DataNguoiDung["LoaiTaiKhoan"] == 1) {
                $this->view("BangDieuKhienGiaoVien", [
                    "subview" => "ThemHocSinh",
                    "DataNguoiDung" => $DataNguoiDung
                ]);
            }
            else {
                $this->view("BangDieuKhienGiaoVien");
            }
        }
        else {
            $Username = $_POST["Username"];
            $Password = $_POST["Password"];
            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $IdNhom = $_POST["IdNhom"];
            $LoaiTaiKhoan = 1;
            $RandomCode = "";
            $Email = $_POST["Email"];

            $result = $this->NguoiDungModel->editHocSinh($IdNguoiDung, $Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $RandomCode, $Email);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "học sinh"
            ]);
        }
    }

    // Xoá một học sinh với ID người dùng từ POST
    public function XoaHocSinh() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien");
        }
        else {
            $IdCauHoi = $_POST["IdNguoiDung"];
            
            $result = $this->NguoiDungModel->deleteHocSinh($IdCauHoi);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Xoá",
                "type" => "học sinh"
            ]);
        }
    }

    // ####################################################################################

    public function ThemCauHoi() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemCauHoi"
            ]);
        }
        else {
            $CauHoi = $_POST["CauHoi"];
            $DapAn1 = $_POST["DapAn1"];
            $DapAn2 = $_POST["DapAn2"];
            $DapAn3 = $_POST["DapAn3"];
            $DapAn4 = $_POST["DapAn4"];
            $DapAnDung = $_POST["DapAnDung"];
            $LoiGiai = $_POST["LoiGiai"];
            $LoaiCauHoi = $_POST["LoaiCauHoi"];
            $Lop = $_POST["Lop"];

            $result = $this->NganHangCauHoiModel->addCauHoi($CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemCauHoi",
                "result" => $result,
                "action" => "Thêm",
                "type" => "câu hỏi"
            ]);
        }
    }

    public function ChinhSuaCauHoi($IdCauHoi) {
        if (!isset($_POST["btnSubmit"])) {
            $DataCauHoi = $this->NganHangCauHoiModel->getCauHoi($IdCauHoi);
        
            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemCauHoi",
                "DataCauHoi" => $DataCauHoi
            ]);
        }
        else {
            $CauHoi = $_POST["CauHoi"];
            $DapAn1 = $_POST["DapAn1"];
            $DapAn2 = $_POST["DapAn2"];
            $DapAn3 = $_POST["DapAn3"];
            $DapAn4 = $_POST["DapAn4"];
            $DapAnDung = $_POST["DapAnDung"];
            $LoiGiai = $_POST["LoiGiai"];
            $LoaiCauHoi = $_POST["LoaiCauHoi"];
            $Lop = $_POST["Lop"];

            $result = $this->NganHangCauHoiModel->editCauHoi($IdCauHoi, $CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "câu hỏi",
                "IdCauHoi" => $IdCauHoi
            ]);
        }
    }

    // Xoá một câu hỏi với ID câu hỏi từ POST
    public function XoaCauHoi() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien");
        }
        else {
            $IdCauHoi = $_POST["IdCauHoi"];
            
            $result = $this->NganHangCauHoiModel->deleteCauHoi($IdCauHoi);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Xoá",
                "type" => "câu hỏi"
            ]);
        }
    }

    // ####################################################################################
    public function ThemNhom() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemNhom",
            ]);
        }
        else {
            $TenNhom = $_POST["TenNhom"];
            $SoLuong = $_POST["SoLuong"];
            $Lop = $_POST["Lop"];

            $result = $this->NhomModel->addNhom($TenNhom, $SoLuong, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemNhom",
                "result" => $result,
                "action" => "Thêm",
                "type" => "nhóm"
            ]);
        }
    }

    public function ChinhSuaNhom($IdNhom) {
        if (!isset($_POST["btnSubmit"])) {
            $DataNhom = $this->NhomModel->getNhom($IdNhom);
        
            $this->view("BangDieuKhienGiaoVien", [
                "subview" => "ThemNhom",
                "DataNhom" => $DataNhom,
            ]);
        }
        else {
            $TenNhom = $_POST["TenNhom"];
            $SoLuong = $_POST["SoLuong"];
            $Lop = $_POST["Lop"];

            $result = $this->NhomModel->editNhom($IdNhom, $TenNhom, $SoLuong, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "nhóm",
                "IdNhom" => $IdNhom
            ]);
        }
    }

    // Xoá một nhóm với ID câu hỏi từ POST
    public function XoaNhom() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien");
        }
        else {
            $IdNhom = $_POST["IdNhom"];
            
            $result = $this->NhomModel->deleteNhom($IdNhom);

            $this->view("BangDieuKhienGiaoVien", [
                "result" => $result,
                "action" => "Xoá",
                "type" => "nhóm"
            ]);
        }
    }

    // ####################################################################################
}
?>