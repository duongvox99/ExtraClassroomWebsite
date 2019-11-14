<?php
session_start();

class App{

    protected $controller="HocSinh";
    protected $action="Default";
    protected $params=[];

    function __construct(){
        $arr = $this->UrlProcess();

        // Kiểm tra đã đăng nhập hay chưa
        if (!isset($_SESSION["user"])) {
            // Cần phải check loại tài khoản
            $arr = array("0" => "HocSinh", "1" => "LamBai");
        }
        else {
            if(isset($arr[1])){
                if ($arr[1] == "QuenMatKhau") {
                    $arr = array("0" => "TrangChu", "1" => "QuenMatKhau");
                }
            }
            else {
                $arr = array("0" => "TrangChu", "1" => "DangNhap");
            }
        }
        
        // print_r($arr);

        // Controller
        if( file_exists("./mvc/controllers/" . $arr[0] . ".php") ){
            $this->controller = $arr[0];
            unset($arr[0]);
        }

        require_once "./mvc/controllers/" . $this->controller . ".php";
        $this->controller = new $this->controller;

        // Action
        if(isset($arr[1])){
            if( method_exists( $this->controller , $arr[1]) ){
                $this->action = $arr[1];
            }
            unset($arr[1]);
        }

        // Params
        $this->params = $arr?array_values($arr):[];
        
        // print_r($this->controller);
        // print_r($this->action);
        // print_r($this->params);

        call_user_func_array([$this->controller, $this->action], $this->params );

    }

    function UrlProcess(){
        if( isset($_GET["url"]) ){
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }

}
?>