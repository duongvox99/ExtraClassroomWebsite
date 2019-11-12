<?php

class Hocsinh extends Controller{

    function Default(){
        // $teo = $this->model("SinhVienModel");
        // echo $teo->GetSV();
        echo "Default";
        // $this->view("doExam");
    }

    function LamBai(){
        $this->view("LamBai");
    }
}
?>