<?php

class GiaoVien extends Controller{
    public $NganHangCauHoiModel;

    public function __construct() {
        // init model
        $this->NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
    }

    public function Default(){
        // $teo = $this->model("SinhVienModel");
        // echo $teo->GetSV();
        echo "Default";
        // $this->view("doExam");
    }

    public function ThemCauHoi(){
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