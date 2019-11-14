<?php
class TrangChu extends Controller{
    public $NguoiDungModel;

    public function __construct() {
        // init model
        $this->NguoiDungModel = $this->model("NguoiDungModel");
    }

    function Default(){
        echo "Welcome";
    }

    public function DangNhap(){
        if (!isset($_POST["btnSubmit"])) {
            $this->view("DangNhap");
        }
        else {
            $username = $_POST["username"];
            $password = $_POST["password"];

            if (!is_null($username) and !is_null($password)) {
                $result = $this->NguoiDungModel->checkLogin($username, $password);

                if ($result) {
                    header("Location: /ExtraClassroomWebsite/HocSinh");
                    header("Location: /ExtraClassroomWebsite/GiaoVien");
                    // $this->view("LamBai", [
                    //     "result" => $result
                    // ]);
                }
                else {
                    $this->view("DangNhap", [
                        "result" => $result
                    ]);
                }
            }
        }
    }

    public function QuenMatKhau(){
        $this->view("QuenMatKhau");
    }

    public function DangXuat() {
        // Dang xuat
    }

    protected function checkDangNhap(){
        if (!isset($_POST["btnSubmit"])) {
            $this->view("ThemCauHoi");
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

            $this->view("ThemCauHoi", [
                "result" => $result
            ]);
        }
        
    }


}
?>