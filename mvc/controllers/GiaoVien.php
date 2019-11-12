<?php

class GiaoVien extends Controller{


    function Default(){
        // $teo = $this->model("SinhVienModel");
        // echo $teo->GetSV();
        echo "Default";
        // $this->view("doExam");
    }

    function TestAdmin(){
        $this->view("TestAdmin");
    }
}
?>