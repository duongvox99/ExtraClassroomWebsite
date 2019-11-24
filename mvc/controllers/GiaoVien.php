<?php

class GiaoVien extends Controller{
    public $NganHangCauHoiModel;
    public $NguoiDungModel;
    public $NhomModel;
    public $DeModel;
    public $De_CauHoiModel;
    public $De_NhomModel;
    public $ThongBaoNhomModel;
    public $Diem_DeModel;

    public $DataNguoiDung;

    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $this->NguoiDungModel = $this->model("NguoiDungModel");
        $this->NhomModel = $this->model("NhomModel");
        $this->DeModel = $this->model("DeModel");
        $this->De_CauHoiModel = $this->model("De_CauHoiModel");
        $this->ThongBaoNhomModel = $this->model("ThongBaoNhomModel");
        $this->De_NhomModel = $this->model("De_NhomModel");
        $this->Diem_DeModel = $this->model("Diem_DeModel");

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
        $this->DanhSachNhomHocSinh();
    }

    // #######################################################################################

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
            "MaxPage" => (ceil($TongSoNguoiDung / 50) > 0) ? ceil($TongSoNguoiDung / 50) : 1
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

    public function DanhSachDe($category, $page) {
        if (is_null($page)) {
            if (!is_numeric($page)) {
                $page = 1;
            }
        }

        if (!($category == "TatCa" || $category == "Lop10" || $category == "Lop11" || $category == "Lop12" || $category == "QuanTriVien")) {
            $category = "TatCa";
        }

        $DanhSachDe = $this->DeModel->getAllDe($category, $page);
        $TongSoDe = $this->DeModel->getTotalNumberDe($category);

        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "DanhSachDe",
            "Title" => "Danh sách người dùng",
            "DanhSachDe" => $DanhSachDe,
            "TongSoDe" => $TongSoDe,
            "Category" => $category,
            "Page" => $page,
            "MaxPage" => (ceil($TongSoDe / 50) > 0) ? ceil($TongSoDe / 50) : 1
        ]);
    }

    public function ThemDe() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemDe",
                "DanhSachCauHoi_De" => array(),
            ]);
        }
        else {
            $TenDe = $_POST["TenDe"];
            $LoaiDe = $_POST["LoaiDe"];
            $SoCauDe = $_POST["SoCauDe"];
            $SoCauTrungBinh = $_POST["SoCauTrungBinh"];
            $SoCauKho = $_POST["SoCauKho"];
            $HienDapAn = $_POST["HienDapAn"];
            $NgayTaoDe = $_POST["NgayTaoDe"];
            $Lop = $_POST["Lop"];
            $Tuan = $_POST["Tuan"];
            $ThoiGian = $_POST["ThoiGian"];

            $result = $this->DeModel->addDe($TenDe, $LoaiDe, $HienDapAn, $NgayTaoDe, $Lop, $Tuan, $SoCauDe, $SoCauTrungBinh, $SoCauKho, $ThoiGian);
            if ($result) {
                $IdDe = $this->DeModel->getIdDe($TenDe)[0]["IdDe"];

                $DanhSachCauHoi_De = $this->NganHangCauHoiModel->getAllCauHoi_Tuan_Lop($Lop, $Tuan, 1, $SoCauDe);
                for ($i = 0; $i < count($DanhSachCauHoi_De); $i++) {
                    $this->De_CauHoiModel->addDe_CauHoi($IdDe, $DanhSachCauHoi_De[$i]["IdCauHoi"]);
                }
                $DanhSachCauHoi_TrungBinh = $this->NganHangCauHoiModel->getAllCauHoi_Tuan_Lop($Lop, $Tuan, 2, $SoCauTrungBinh);
                for ($i = 0; $i < count($DanhSachCauHoi_TrungBinh); $i++) {
                    $this->De_CauHoiModel->addDe_CauHoi($IdDe, $DanhSachCauHoi_TrungBinh[$i]["IdCauHoi"]);
                }
                $DanhSachCauHoi_Kho = $this->NganHangCauHoiModel->getAllCauHoi_Tuan_Lop($Lop, $Tuan, 3, $SoCauKho);
                for ($i = 0; $i < count($DanhSachCauHoi_Kho); $i++) {
                    $this->De_CauHoiModel->addDe_CauHoi($IdDe, $DanhSachCauHoi_Kho[$i]["IdCauHoi"]);
                }
            }
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemDe",
                "DataNguoiDung" => $this->DataNguoiDung,
                "result" => $result,
                "action" => "Thêm",
                "type" => "đề kiểm tra"
            ]);
        }
    }

    public function ChinhSuaDe($IdDe) {
        if (!isset($_POST["btnSubmit"])) {
            $DataDeChinhSua = $this->DeModel->getDe($IdDe);
            $DanhSachCauHoi_De = $this->De_CauHoiModel->getAllCauHoi_DapAn_De($IdDe);

            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemDe",
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataDeChinhSua" => $DataDeChinhSua,
                "DanhSachCauHoi_De" => $DanhSachCauHoi_De
            ]);
        }
        else {
            $TenDe = $_POST["TenDe"];
            $LoaiDe = $_POST["LoaiDe"];
            $SoCauDe = $_POST["SoCauDe"];
            $SoCauTrungBinh = $_POST["SoCauTrungBinh"];
            $SoCauKho = $_POST["SoCauKho"];
            $HienDapAn = $_POST["HienDapAn"];
            $NgayTaoDe = $_POST["NgayTaoDe"];
            $Lop = $_POST["Lop"];
            $Tuan = $_POST["Tuan"];
            
            $result = $this->DeModel->editDe($IdDe, $TenDe, $LoaiDe, $HienDapAn, $NgayTaoDe, $Lop, $Tuan, $SoCauDe, $SoCauTrungBinh, $SoCauKho);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemDe",
                "Title" => "Chỉnh sửa người dùng",
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "đề kiểm tra"
            ]);
        }
    }

    public function XoaDe($IdDe) {
        $result = $this->DeModel->deleteDe($IdDe);

        header("Location: /ExtraClassroomWebsite/GiaoVien/DanhSachDe/TatCa/1");
    }

    public function XoaCauHoi_De($IdDe, $IdCauHoi) {
        // NEED TO DO
        // Tự thêm lại câu hỏi

        $result = $this->NganHangCauHoiModel->deleteCauHoi($IdCauHoi);

        header("Location: /ExtraClassroomWebsite/GiaoVien/DanhSachDe/TatCa/1");
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
            "MaxPage" => (ceil($TongSoCauHoi / 50) > 0) ? ceil($TongSoCauHoi / 50) : 1
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
    public function ThemDeNhom($IdNhom) {
        $DataDe = $this->DeModel->getDeNhom();
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemDeNhom",
                "DataDe" => $DataDe
            ]);
        }
        else {
            $IdDe = $_POST["IdDe"];
            $ThoiGianMo = $_POST["ThoiGianMo"];
            $ThoiGianDong = $_POST["ThoiGianDong"];

            $result = $this->De_NhomModel->addDe_Nhom($IdNhom, $IdDe, $ThoiGianMo, $ThoiGianDong);
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemDeNhom",
                "Title" => "Thêm đề kiểm tra cho nhóm",
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataDe" => $DataDe,
                "result" => $result,
                "action" => "Thêm",
                "type" => "đề kiểm tra cho nhóm"
            ]);
        }
    }

    public function ChinhSuaDeNhom($IdDe, $IdNhom) {
        $DataDe = $this->DeModel->getDeNhom();
        if (!isset($_POST["btnSubmit"])) {
            $DataDeNhomChinhSua = $this->De_NhomModel->getDeNhom($IdDe, $IdNhom);
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemDeNhom",
                "Title" => "Chỉnh sửa nhóm",
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataDeNhomChinhSua" => $DataDeNhomChinhSua[0],
                "DataDe" => $DataDe
            ]);
        }
        else {
            $ThoiGianMo = $_POST["ThoiGianMo"];
            $ThoiGianDong = $_POST["ThoiGianDong"];

            $result = $this->De_NhomModel->editDe_Nhom($IdNhom, $IdDe, $ThoiGianMo, $ThoiGianDong);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataDe" => $DataDe,
                "SubView" => "ThemDeNhom",
                "Title" => "Chỉnh sửa đề kiểm tra cho nhóm",
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "đề kiểm tra cho nhóm"
            ]);
        }
    }

    public function XoaDeNhom($IdDe, $IdNhom) {
        $result = $this->De_NhomModel->deleteDeNhom($IdDe, $IdNhom);

        header("Location: /ExtraClassroomWebsite/GiaoVien/NhomHocSinh/$IdNhom");
    }

    // ####################################################################################

    public function ThemThongBaoNhom($IdNhom) {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemThongBaoNhom",
            ]);
        }
        else {
            $TieuDe = $this->HandleString($_POST["TieuDe"]);
            $NoiDung = $this->HandleString($_POST["NoiDung"]);
            $NgayTao = $_POST["NgayTao"];

            $result = $this->ThongBaoNhomModel->addThongBaoNhom($IdNhom, $TieuDe, $NoiDung, $NgayTao);
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemThongBaoNhom",
                "Title" => "Thêm thông báo nhóm",
                "DataNguoiDung" => $this->DataNguoiDung,
                "result" => $result,
                "action" => "Thêm",
                "type" => "thông báo nhóm"
            ]);
        }
    }

    public function ChinhSuaThongBaoNhom($IdThongBao, $IdNhom) {
        if (!isset($_POST["btnSubmit"])) {
            $DataThongBaoNhomChinhSua = $this->ThongBaoNhomModel->getThongBaoNhom($IdThongBao, $IdNhom);

            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemThongBaoNhom",
                "Title" => "Chỉnh sửa nhóm",
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataThongBaoNhomChinhSua" => $DataThongBaoNhomChinhSua
            ]);
        }
        else {
            $TieuDe = $_POST["TieuDe"];
            $NoiDung = $_POST["NoiDung"];
            $NgayTao = $_POST["NgayTao"];

            $result = $this->ThongBaoNhomModel->editThongBaoNhom($IdThongBao, $IdNhom, $TieuDe, $NoiDung, $NgayTao);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNhom",
                "Title" => "Chỉnh sửa thông báo nhóm",
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "thông báo nhóm"
            ]);
        }
    }

    public function XoaThongBaoNhom($IdThongBao, $IdNhom) {
        $result = $this->ThongBaoNhomModel->deleteThongBaoNhom($IdThongBao, $IdNhom);

        header("Location: /ExtraClassroomWebsite/GiaoVien/NhomHocSinh/$IdNhom");
    }

    // ####################################################################################
    public function NhomHocSinh($IdNhom) {
        $DataNhom = $this->NhomModel->getNhom($IdNhom);
        $DanhSachThongBaoNhom = $this->ThongBaoNhomModel->getAllThongBaoNhom($IdNhom);
        $DanhSachDeNhom = $this->De_NhomModel->getAllDeNhom($IdNhom);
        $this->view("BangDieuKhienGiaoVien", [
            "SubView" => "NhomHocSinh",
            "Title" => $DataNhom["TenNhom"],
            "DataNguoiDung" => $this->DataNguoiDung,
            "DataNhom" => $DataNhom,
            "DanhSachThongBaoNhom" => $DanhSachThongBaoNhom,
            "DanhSachDeNhom" => $DanhSachDeNhom
        ]);
    }

    public function DanhSachNhomHocSinh() {
        $DanhSachNhomHocSinh = $this->NhomModel->getAllNhomHocSinh();

        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "DanhSachNhomHocSinh",
            "Title" => "Danh sách người dùng",
            "DanhSachNhomHocSinh" => $DanhSachNhomHocSinh,
        ]);
    }

    public function ThemNhom() {
        if (!isset($_POST["btnSubmit"])) {
            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNhom",
            ]);
        }
        else {
            $TenNhom = $_POST["TenNhom"];
            $Lop = $_POST["Lop"];

            $result = $this->NhomModel->addNhom($TenNhom, $Lop);
            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemNhom",
                "Title" => "Thêm nhóm học sinh",
                "DataNguoiDung" => $this->DataNguoiDung,
                "result" => $result,
                "action" => "Thêm",
                "type" => "nhóm"
            ]);
        }
    }

    public function ChinhSuaNhom($IdNhom) {
        if (!isset($_POST["btnSubmit"])) {
            $DataNhomChinhSua = $this->NhomModel->getNhom($IdNhom);

            $this->view("BangDieuKhienGiaoVien", [
                "SubView" => "ThemNhom",
                "Title" => "Chỉnh sửa nhóm",
                "DataNguoiDung" => $this->DataNguoiDung,
                "DataNhomChinhSua" => $DataNhomChinhSua
            ]);
        }
        else {
            $TenNhom = $_POST["TenNhom"];
            $Lop = $_POST["Lop"];

            $result = $this->NhomModel->editNhom($IdNhom, $TenNhom, $Lop);

            $this->view("BangDieuKhienGiaoVien", [
                "DataNguoiDung" => $this->DataNguoiDung,
                "SubView" => "ThemNhom",
                "Title" => "Chỉnh sửa nhóm",
                "result" => $result,
                "action" => "Chỉnh sửa",
                "type" => "nhóm"
            ]);
        }
    }

    public function XoaNhom($IdNhom) {
        $result = $this->NhomModel->deleteNhom($IdNhom);

        header("Location: /ExtraClassroomWebsite/GiaoVien/DanhSachNhomHocSinh");
    }

    public function XemHocSinhTrongNhom($IdNhom) {
        $DanhSachNguoiDung = $this->NguoiDungModel->getAllHocSinhInNhom($IdNhom);
        $TongSoNguoiDung = count($DanhSachNguoiDung);
        
        $this->view("BangDieuKhienGiaoVien",[
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "DanhSachNguoiDung",
            "Title" => "Danh sách người dùng",
            "DanhSachNguoiDung" => $DanhSachNguoiDung,
            "TongSoNguoiDung" => $TongSoNguoiDung,
            "Page" => "1"
        ]);

    }
    // ####################################################################################

    public function KenhThaoLuanChung() {
        $this->view("BangDieuKhienGiaoVien", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "KenhThaoLuanChung",
            "GiaoVien" => true,
            "Title" => "Kênh thảo luận chung",
        ]);
    }
    
    // ####################################################################################
    
    public function BangXepHangHocSinh($Category, $Id) {
        if (!($Category == "Lop" || $Category == "Nhom" || $Category == "De" )) {
            $Category = "Lop";
        }

        $DataDe = $this->DeModel->getAllDeKiemTra();
        $DataNhom = $this->NhomModel->getAllNhom();
        // NEED TO DO remove admin group

        if ($Category == "Nhom") {
            $Nhom = $this->NhomModel->getNhom($Id);
            $DataRank = $this->NguoiDungModel->getHocSinhRanking_Nhom_Lop($Id, $Nhom["Lop"]);
        }
        else if ($Category == "Lop") {
            $DataRank = $this->NguoiDungModel->getHocSinhRanking_Lop($Id);
        }
        else {
            $DataRank = $this->Diem_DeModel->getHocSinhRanking_De($Id);
        }
        
        $this->view("BangDieuKhienGiaoVien", [
            "DataNguoiDung" => $this->DataNguoiDung,
            "SubView" => "BangXepHangHocSinh",
            "DataRank" => $DataRank,
            "KieuXepHang" => $Category,
            "Id" => $Id,
            "DataNhom" => $DataNhom,
            "DataDe" => $DataDe
        ]);
    }
}
?>