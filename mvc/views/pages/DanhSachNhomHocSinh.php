<script type="text/javascript" src="/ExtraClassroomWebsite/public/js/DeleteButton.js"></script>

<div class="page-header zvn-page-header clearfix">
    <div class="zvn-page-header-title">
        <h3>Danh sách nhóm</h3>
    </div>
    <div class="zvn-add-new pull-right">
        <a href="/ExtraClassroomWebsite/GiaoVien/ThemNhom/" class="btn btn-success"><i class="fas fa-plus-circle"></i> Thêm nhóm mới</a>
    </div>
</div>

<div class="row">
    <?php
    for ($i = 0; $i < count($data["DanhSachNhomHocSinh"]); $i++) {
        ?>
        <div class="col col-lg-3 col-md-4 col-sm-6 col-12 mb-4">
            <div class="card h-100 <?php
                                        if ($data["DanhSachNhomHocSinh"][$i]["Lop"] == 10) {
                                            echo "text-success border-success";
                                        } else if ($data["DanhSachNhomHocSinh"][$i]["Lop"] == 11) {
                                            echo "text-warning border-warning ";
                                        } else {
                                            echo "text-danger border-danger";
                                        }
                                        ?>">
                <div class="card-header">
                    <span class="badge badge-primary">Lớp <?php echo $data["DanhSachNhomHocSinh"][$i]["Lop"]; ?></span>
                </div>
                <div class="card-body">
                    <h2 class="card-title">
                        <?php echo $data["DanhSachNhomHocSinh"][$i]["TenNhom"]; ?>
                    </h2>
                    <!-- <p class="card-text"><?= $description ?></p> -->
                </div>
                <div class="card-footer">
                    <a class="btn btn-success" href="/ExtraClassroomWebsite/GiaoVien/NhomHocSinh/<?php echo $data["DanhSachNhomHocSinh"][$i]["IdNhom"]; ?>">Chi tiết</a>
                    <a href="/ExtraClassroomWebsite/GiaoVien/XoaNhom/<?php echo $data["DanhSachNhomHocSinh"][$i]["IdNhom"]; ?>" class="deleteButton btn btn-danger float-right" style="margin-left: 10px">
                        <i class="fas fa-trash"></i>
                    </a>
                    <a href="/ExtraClassroomWebsite/GiaoVien/ChinhSuaNhom/<?php echo $data["DanhSachNhomHocSinh"][$i]["IdNhom"]; ?>" class="btn btn-secondary float-right">
                        <i class="fas fa-pencil-alt"></i>
                    </a>
                    
                </div>
            </div>
        </div>
    <?php
    }
    ?>
</div>