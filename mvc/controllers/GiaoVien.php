<?php

class GiaoVien extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;
    public $NhomModel;

    public $DataNguoiDung;

    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        $this->NhomModel = $this->model("NhomModel");
        
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

    public function Default() {
        // Can goi model cho trang dashboard
        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung
        ]);
    }

    public function DanhSachNguoiDung($category, $page) {
        if (is_null($page)) {
            if (!is_numeric($page)) {
                $page = 1;
            }
        }

        if (!($category == "TatCa" || $category == "Lop10" || $category == "Lop11" || $category == "Lop12" || $category == "QuanTriVien")) {
            $category = "TatCa";
        }

        $DanhSachNguoiDung = $this->NguoiDungModel->getAllNguoiDung($category, $page);
        $TongSoNguoiDung = $this->NguoiDungModel->getTotalNumberNguoiDung($category);

        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "DanhSachNguoiDung",
            "Title" => "Danh sách người dùng",
            "DanhSachNguoiDung" => $DanhSachNguoiDung,
            "TongSoNguoiDung" => $TongSoNguoiDung,
            "Category" => $category,
            "Page" => $page,
            "MaxPage" => ceil($TongSoNguoiDung / 50)
        ]);
    }

    public function ThemNguoiDung() {
        $DataNhom = $this->NhomModel->getAllNhom();
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNguoiDung",
                "DataNhom" => $DataNhom
            ]);
        }
        else {
            $Username = $_POST["Username"];
            $Password = $_POST["Password"];
            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $IdNhom = $_POST["IdNhom"];
            $LoaiTaiKhoan = $_POST["LoaiTaiKhoan"];
            $Email = $_POST["Email"];

            $result = $this->NguoiDungModel->addNguoiDung($Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $Email);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNguoiDung",
                "Title" => "Thêm người dùng",
                "DataNhom" => $DataNhom,
                "result" => $result,
                "action" => "Thêm",
                "type" => "học sinh"
            ]);
        }
    }

    public function ChinhSuaNguoiDung($IdNguoiDung) {
        $DataNhom = $this->NhomModel->getAllNhom();
        if (!isset($_POST["btnSubmit"])) {
            $DataNguoiDungChinhSua = $this->NguoiDungModel->getNguoiDung($IdNguoiDung);
            
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemNguoiDung",
                "DataNhom" => $DataNhom,
                "DataNguoiDungChinhSua" => $DataNguoiDungChinhSua,
                "DataNguoiDung" => $this->DataNguoiDung,
            ]);
        }
        else {
            $Username = $_POST["Username"];
            $Password = $_POST["Password"];
            $HoTen = $_POST["HoTen"];
            $NamSinh = $_POST["NamSinh"];
            $Avatar = "";
            $Lop = $_POST["Lop"];
            $IdNhom = $_POST["IdNhom"];
            $LoaiTaiKhoan = $_POST["LoaiTaiKhoan"];
            $Email = $_POST["Email"];
            
            $result = $this->NguoiDungModel->editNguoiDung($IdNguoiDung, $Username, $Password, $HoTen, $NamSinh, $Avatar, $Lop, $IdNhom, $LoaiTaiKhoan, $Email);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNguoiDung",
                "Title" => "Chỉnh sửa người dùng",
                "DataNhom" => $DataNhom,
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "người dùng"
            ]);
        }
    }

    // Xoá một người dùng với ID người dùng
    public function XoaNguoiDung($IdNguoiDung) {
        $result = $this->NguoiDungModel->deleteNguoiDung($IdNguoiDung);

        header("Location: /ExtraClassroomWebsite/GiaoVien/DanhSachNguoiDung/TatCa/1");
    }

    // ####################################################################################
    public function TaoDe() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", ["subview" => "TaoDe"]);
        }
        else {
            $TenDe = $_POST["TenDe"];
            $LoaiDe = $_POST["LoaiDe"];
            $SoCauHoi = $_POST["SoCauHoi"];
            $HienDapAn = $_POST["HienDapAn"];
            $Lop = $_POST["Lop"];

            $result = $this->DeModel->addDe($TenDe, $LoaiDe, $SoCauHoi, $HienDapAn, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "TaoDe",
                "result" => $result,
                "action" => "Tạo",
                "type" => "đề"
            ]);
        }
    }

    // ####################################################################################

    public function XemTatCaNhomHocSinh() {
        $data = $this->NhomModel->getAllNhomHocSinh();
    }

    public function XemHocSinhTrongNhom($IdNhom) {
        $data = $this->NguoiDungModel->getAllHocSinhInNhom($IdNhom);
    }

    // ####################################################################################

    public function HandleString($str) {
        if (preg_match_all('/src="(.*?)"/m', $str, $matches)) {
            $matches = $matches[1];

            for ($i = 0; $i < count($matches); $i++) {
                $str = str_replace($matches[$i], $this->Convert_UploadImgCauHoi($matches[$i]), $str);
            }
        }

        return $str;
    }

    public function Convert_UploadImgCauHoi($data) {
        if (preg_match('/^data:image\/(\w+);base64,/', $data, $type)) {
            $data = substr($data, strpos($data, ',') + 1);
            $type = strtolower($type[1]); // jpg, png, gif
            
            if (!in_array($type, [ 'jpg', 'jpeg', 'gif', 'png' ])) {
                throw new \Exception('invalid image type');
            }
        
            $data = base64_decode($data);
        
            if ($data === false) {
                throw new \Exception('base64_decode failed');
            }
        } else {
            throw new \Exception('did not match data URI with image data');
        }
        
        $nameFile = substr(md5(uniqid(mt_rand(), true)) , 0, 30);
        $uri = "/ExtraClassroomWebsite/upload/nganhangcauhoi/" . $nameFile . "." . $type;
        while (file_exists($uri)) {
            $nameFile = substr(md5(uniqid(mt_rand(), true)) , 0, 30);
            $uri = "/ExtraClassroomWebsite/upload/nganhangcauhoi/" . $nameFile . "." . $type;
        }
        
        file_put_contents(".." . $uri, $data);

        return $uri;
    }
    
    public function NganHangCauHoi($category, $page) {
        if (is_null($page)) {
            if (!is_numeric($page)) {
                $page = 1;
            }
        }

        if (!($category == "TatCa" || $category == "Lop10" || $category == "Lop11" || $category == "Lop12")) {
            $category = "TatCa";
        }

        $DanhSachCauHoi = $this->NganHangCauHoiModel->getAllCauHoi($category, $page);
        $TongSoCauHoi = $this->NganHangCauHoiModel->getTotalNumberCauHoi($category);

        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "NganHangCauHoi",
            "Title" => "Ngân hàng câu hỏi",
            "DanhSachCauHoi" => $DanhSachCauHoi,
            "TongSoCauHoi" => $TongSoCauHoi,
            "Category" => $category,
            "Page" => $page,
            "MaxPage" => ceil($TongSoCauHoi / 50)
        ]);
    }

    public function ThemCauHoi() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemCauHoi",
            ]);
        }
        else {
            $CauHoi = $this->HandleString($_POST["CauHoi"]);
            $DapAn1 = $this->HandleString($_POST["DapAn1"]);
            $DapAn2 = $this->HandleString($_POST["DapAn2"]);
            $DapAn3 = $this->HandleString($_POST["DapAn3"]);
            $DapAn4 = $this->HandleString($_POST["DapAn4"]);
            $DapAnDung = $_POST["DapAnDung"];
            $LoiGiai = $this->HandleString($_POST["LoiGiai"]);
            $LoaiCauHoi = $_POST["LoaiCauHoi"];
            $Lop = $_POST["Lop"];
            $Tuan = $_POST["Tuan"];

            $result = $this->NganHangCauHoiModel->addCauHoi($CauHoi, $DapAn1, $DapAn2, $DapAn3, $DapAn4, $DapAnDung, $LoiGiai, $LoaiCauHoi, $Lop, $Tuan);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemCauHoi",
                "Title" => "Thêm câu hỏi",
                "result" => $result,
                "action" => "Thêm",
                "type" => "câu hỏi"
            ]);
        }
    }

    public function ChinhSuaCauHoi($IdCauHoi) {
        if (!isset($_POST["btnSubmit"])) {
            $DataCauHoiChinhSua = $this->NganHangCauHoiModel->getCauHoi($IdCauHoi);
        
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemCauHoi",
                "DataCauHoiChinhSua" => $DataCauHoiChinhSua
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
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemCauHoi",
                "Title" => "Chỉnh sửa câu hỏi",
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "câu hỏi"
            ]);
        }
    }

    // Xoá một câu hỏi với ID câu hỏi
    public function XoaCauHoi($IdCauHoi) {

        $result = $this->NganHangCauHoiModel->deleteCauHoi($IdCauHoi);

        header("Location: /ExtraClassroomWebsite/GiaoVien/NganHangCauHoi/TatCa/1");
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