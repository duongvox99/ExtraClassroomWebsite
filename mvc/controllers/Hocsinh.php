<?php

class Hocsinh extends Controller{

    function Default(){
        $this->view("BangDieuKhienHocSinh");
    }

    function LamBai(){
        $this->view("LamBai");
    }
}
?>