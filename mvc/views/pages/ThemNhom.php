<!-- $TenDe = $_POST["TenDe"];
$LoaiDe = $_POST["LoaiDe"];
$SoCauHoi = $_POST["SoCauHoi"];
$HienDapAn = $_POST["HienDapAn"];
$NgayTaoDe = $_POST["NgayTaoDe"];
$Lop = $_POST["Lop"]; -->
<script type="text/javascript" src="/ExtraClassroomWebsite/public/js/DeleteButton.js"></script>

<?php
if (isset($data["result"])) {
    $title = $data["action"] . " " . $data["type"];
    if ($data["result"]) {
        echo
            "<script type='text/javascript'>
                $.confirm({
                    theme: 'modern',
                    columnClass: 'medium',
                    title: '$title thành công',
                    content: 'Bạn có thể xem kết quả ở danh sách nhóm!',
                    type: 'green',
                    typeAnimated: true,
                    buttons: {
                        OK: {
                            text: 'Đồng ý',
                            btnClass: 'btn-green',
                            action: function(){
                            }
                        }
                    },
                });            
            </script>";
    } else {
        echo
            "<script type='text/javascript'>
                $.confirm({
                    theme: 'modern',
                    columnClass: 'medium',
                    title: '$title thất bại',
                    content: 'Bạn vui lòng kiểm tra lại thông tin nhập vào!',
                    type: 'red',
                    typeAnimated: true,
                    autoClose: 'tryAgain|5000',
                    buttons: {
                        tryAgain: {
                            text: 'Thử lại',
                            btnClass: 'btn-red',
                            action: function(){
                            }
                        }
                    },
                });            
            </script>";
    }
}
?>
<form action="" method="POST">
    <div class="form-group">
        <label for="tennhom">Tên nhóm</label>
        <input type="text" class="form-control" id="tennhom" name="TenNhom" placeholder="Tên nhóm" value="<?php echo (isset($data["DataNhomChinhSua"])) ? $data["DataNhomChinhSua"]["TenNhom"] : ""; ?>">
    </div>

    <div class="form-group">
        <label for="lop">Lớp</label>
        <select class="form-control" id="lop" name="Lop">
            <option <?php
                    if (isset($data["DataNhomChinhSua"])) {
                        if ($data["DataNhomChinhSua"]["Lop"] == 12) {
                            echo 'selected="selected"';
                        }
                    };
                    ?>>12</option>
            <option <?php
                    if (isset($data["DataNhomChinhSua"])) {
                        if ($data["DataNhomChinhSua"]["Lop"] == 11) {
                            echo 'selected="selected"';
                        }
                    };
                    ?>>11</option>
            <option <?php
                    if (isset($data["DataNhomChinhSua"])) {
                        if ($data["DataNhomChinhSua"]["Lop"] == 10) {
                            echo 'selected="selected"';
                        }
                    };
                    ?>>10</option>
        </select>
    </div>

    <button name="btnSubmit" type="submit" class="btn btn-primary"><?php echo (isset($data["DataNhomChinhSua"])) ? "Chỉnh sửa nhóm" : "Tạo nhóm mới"; ?></button>
</form>

<script type="text/javascript">
    $(function() {
        $('#datetimepicker1').datetimepicker();
    });
</script>