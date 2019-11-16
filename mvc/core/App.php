<?php
session_start();

class App{

    protected $controller="HocSinh";
    protected $action="Default";
    protected $params=[];

    function isLoginSessionExpired() {
        $login_session_duration = 120 * 60; // in second
        $current_time = time();
        if (isset($_SESSION['loggedin_time']) && isset($_SESSION["IdNguoiDung"]) && isset($_SESSION["LoaiTaiKhoan"])) {  
            if(((time() - $_SESSION['loggedin_time']) > $login_session_duration)){ 
                return true;
            }
            else {
                return false;
            }
        }
        else {
            return true;
        }
        
    }

    function __construct(){
        $arr = $this->UrlProcess();

        // Kiểm tra đã đăng nhập hay chưa
        if (!$this->isLoginSessionExpired()) {
            // echo 'Da Dang Nhap';
            if ($arr[0] != "TrangChu") {
                if ($_SESSION['LoaiTaiKhoan'] == "0") {
                    $arr[0] = "GiaoVien";
                }
                else {
                    $arr[0] = "HocSinh";
                }
            }
        }
        else {
            // echo 'Chua Dang Nhap';
            $arr[0] = "TrangChu";
            if (!isset($arr[1])) {
                $arr[1] = "DangNhap";
            }
        }

        // $arr = array("0" => "GiaoVien", "1" => "uploadImgCauHoi");

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
        
        // print_r($this->params);
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