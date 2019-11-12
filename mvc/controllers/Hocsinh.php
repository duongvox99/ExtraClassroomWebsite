<?php

class HocSinh extends Controller{

    function Default(){
        $this->view("Test");
    }

    function LamBai($idDeThi){        
        // Call Models
        $De_CauHoiModel = $this->model("De_CauHoiModel");
        $allIdCauHoi = $De_CauHoiModel->getAllIdCauHoi($idDeThi);

        $NganHangCauHoiModel = $this->model("NganHangCauHoiModel");
        $idCauHoi = 0;
        $allCauHoi = $NganHangCauHoiModel->getCauHoi($idCauHoi);

        // Call Views
        $this->view("LamBai", [
            "DeThi"=>$allCauHoi,
        ]);
    }
}
?>