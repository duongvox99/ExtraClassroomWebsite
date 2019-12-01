<?php

class Hocsinh extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;
    public $De_NhomModel;
    public $De_CauHoiModel;
    public $ThongBaoNhomModel;
    public $DeModel;
    public $Diem_DeModel;
    public $NguoiDung_DeModel;
    public $NguoiDung_ThongBaoModel;

    public $DataNguoiDung;
    
    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        $this->De_NhomModel = $this->model("De_NhomModel");
        $this->ThongBaoNhomModel = $this->model("ThongBaoNhomModel");
        $this->De_CauHoiModel = $this->model("De_CauHoiModel");
        $this->DeModel = $this->model("DeModel");
        $this->Diem_DeModel = $this->model("Diem_DeModel");
        $this->NguoiDung_DeModel = $this->model("NguoiDung_DeModel");
        $this->NguoiDung_ThongBaoModel = $this->model("NguoiDung_ThongBaoModel");

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
        $this->DeKiemTra("TatCa");
    }


    public function ThongBao($Category) {
        if (!isset($_GET["search"])) {
            $SearchString = "";
        } 
        else {
            $SearchString = $_GET["search"];
        }

        if (!($Category == "TatCa" || $Category == "ChuaXem" || $Category == "DaXem")) {
            $Category = "TatCa";
        }
        if ($Category == "TatCa") {
            $DanhSachThongBaoNhom = $this->ThongBaoNhomModel->getAllThongBaoNhom( $this->DataNguoiDung["IdNhom"], $SearchString);
        }
        else if ($Category == "ChuaXem") {
            $DanhSachThongBaoNhom = $this->NguoiDung_ThongBaoModel->getAllUnReadThongBao($this->DataNguoiDung["IdNguoiDung"], $this->DataNguoiDung["IdNhom"], $SearchString);
        }
        else {
            $DanhSachThongBaoNhom = $this->NguoiDung_ThongBaoModel->getAllReadThongBao($this->DataNguoiDung["IdNguoiDung"], $this->DataNguoiDung["IdNhom"], $SearchString);
        }
        

        $this->view("BangDieuKhienHocSinh", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "ThongBao",
            "Title" => "Thông báo",
            "DanhSachThongBaoNhom" => $DanhSachThongBaoNhom,
            "Category" => $Category
        ]);
    }
    
    public function XemThongBao($IdThongBao){
        $DataThongBaoNhom = $this->ThongBaoNhomModel->getThongBaoNhom($IdThongBao, $this->DataNguoiDung["IdNhom"]);

        $this->view("BangDieuKhienHocSinh", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "XemThongBao",
            "DataThongBaoNhom" => $DataThongBaoNhom
        ]);
        
    }

    public function AddDaXemThongBao(){
        if (isset($_POST["IdNguoiDung"]) && isset($_POST["IdThongBao"])) {
            $IdNguoiDung = $_POST["IdNguoiDung"];
            $IdThongBao = $_POST["IdThongBao"];
            $result = $this->NguoiDung_ThongBaoModel->addNguoiDung_ThongBao($IdNguoiDung, $IdThongBao);
            return $result;
        }
        
        return false;
    }


    public function DeKiemTra($Category) {
        if (!($Category == "TatCa" || $Category == "ChuaLam" || $Category == "DaLam")) {
            $Category = "TatCa";
        }
        if ($Category == "TatCa") {
            $DanhSachDeNhom = $this->De_NhomModel->getAllDeNhom( $this->DataNguoiDung["IdNhom"]);
        }
        else if ($Category == "ChuaLam") {
            $DanhSachDeNhom = $this->NguoiDung_DeModel->getAllUnReadDeNhom($this->DataNguoiDung["IdNguoiDung"], $this->DataNguoiDung["IdNhom"]);
        }
        else {
            $DanhSachDeNhom = $this->NguoiDung_DeModel->getAllReadDeNhom($this->DataNguoiDung["IdNguoiDung"], $this->DataNguoiDung["IdNhom"]);
        }
        
        // return;
        $this->view("BangDieuKhienHocSinh", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "DeKiemTra",
            "Title" => "Đề kiểm tra",
            "DanhSachDeNhom" => $DanhSachDeNhom,
            "Category" => $Category
        ]);
    }

    public function LamBai($IdDe){
        $DataDe = $this->DeModel->getDe($IdDe);

        if (!isset($_POST["btnSubmit"])) {
            // Check coi người dùng đã làm chưa
            $DiemDe = $this->Diem_DeModel->getHocSinhDiem_De($IdDe, $this->DataNguoiDung["IdNguoiDung"]);
            $DataAllCauHoi_DapAn = $this->De_CauHoiModel->getAllCauHoi_DapAn_De($IdDe);
            if (count($DiemDe) > 0) {// Da lam
                
                $this->view("BangDieuKhienHocSinh", [
                    "DataNguoiDung" => $this->DataNguoiDung,
                    "SubView" => "LamBai",
                    "DaLam" => true,
                    "DiemDe" => $DiemDe,
                    "DataAllCauHoi_DapAn" => $DataAllCauHoi_DapAn,
                    "DataDe" => $DataDe
                ]);
            }
            else {
                // Check thời gian
                $DeNhom = $this->De_NhomModel->getDeNhom($IdDe, $this->DataNguoiDung["IdNhom"]);
                $current = new DateTime();
                $ThoiGianMo = new DateTime($DeNhom[0]["ThoiGianMo"]);
                $ThoiGianDong = new DateTime($DeNhom[0]["ThoiGianDong"]);

                if (($current <= $ThoiGianDong) && ($current >= $ThoiGianMo)) {

                    $this->view("BangDieuKhienHocSinh", [
                        "DataNguoiDung" => $this->DataNguoiDung,
                        "SubView" => "LamBai",
                        "DataAllCauHoi_DapAn" => $DataAllCauHoi_DapAn,
                        "DataDe" => $DataDe
                    ]);
                } else {
                    $this->Diem_DeModel->addDiem_De($this->DataNguoiDung["IdNguoiDung"], $IdDe, 0);
                    $this->NguoiDung_DeModel->addNguoiDung_De($this->DataNguoiDung["IdNguoiDung"], $IdDe);
                    
                    header("Location: /ExtraClassroomWebsite/HocSinh/LamBai/$IdDe");
                }
            }  
        }
        else {
            // Cham diem
            $DataAllCauHoi_DapAn = $this->De_CauHoiModel->getAllCauHoi_DapAn_De($IdDe);

            $SoCauHoi = $DataDe["SoCauDe"] + $DataDe["SoCauKho"] + $DataDe["SoCauTrungBinh"];
            $SoCauDung = 0;

            for ($i = 0; $i < $SoCauHoi; $i++) {
                if (isset($_POST["answerOfQuestion_$i"])) {
                    if ($DataAllCauHoi_DapAn[$i]["DapAnDung"] == $_POST["answerOfQuestion_$i"][0]) {
                        $SoCauDung += 1;
                    }
                }
            }

            $Diem = (10 / $SoCauHoi)  * ($SoCauDung);
            
            $this->Diem_DeModel->addDiem_De($this->DataNguoiDung["IdNguoiDung"], $IdDe, $Diem);
            $this->NguoiDungModel->setDiemTong($this->DataNguoiDung["IdNguoiDung"], $Diem);

            $this->NguoiDung_DeModel->addNguoiDung_De($this->DataNguoiDung["IdNguoiDung"], $IdDe);

            header("Location: /ExtraClassroomWebsite/HocSinh/LamBai/$IdDe");
        }
    }

    public function KenhThaoLuanChung() {
        $this->view("BangDieuKhienHocSinh", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "KenhThaoLuanChung",
            "Title" => "Kênh thảo luận chung",
        ]);
    }

    public function BangXepHang($Category, $IdDe) {
        $TenDe = "";
        if (!($Category == "Lop" || $Category == "Nhom" || $Category == "De" )) {
            $Category = "Nhom";
        }

        if ($Category == "Nhom") {
            $DataRank = $this->NguoiDungModel->getHocSinhRanking_Nhom_Lop($this->DataNguoiDung["IdNhom"], $this->DataNguoiDung["Lop"]);
        }
        else if ($Category == "Lop") {
            $DataRank = $this->NguoiDungModel->getHocSinhRanking_Lop($this->DataNguoiDung["Lop"]);
        }
        else {
            $DataDe = $this->DeModel->getDe($IdDe);
            $DataRank = $this->Diem_DeModel->getHocSinhRanking_De($IdDe);
            $TenDe = $DataDe["TenDe"];
        }
        
        $this->view("BangDieuKhienHocSinh", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "BangXepHang",
            "DataRank" => $DataRank,
            "KieuXepHang" => $Category,
            "TenDe" => $TenDe
        ]);
    }
}
?>