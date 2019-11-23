<script type="text/javascript" src="/ExtraClassroomWebsite/public/js/DeleteButton.js"></script>

<div class="page-header zvn-page-header clearfix">
    <div class="zvn-page-header-title">
        <h2><?php echo $data["DataNhom"]["TenNhom"] ?></h2>
    </div>
    <div class="zvn-add-new pull-right">
        <a href="/ExtraClassroomWebsite/GiaoVien/XemHocSinhTrongNhom/<?php echo $data["DataNhom"]["IdNhom"] ?>" class="btn btn-success"><i class="fas fa-eye"></i> Xem danh sách học sinh</a>
    </div>
</div>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Danh sách thông báo</h2>
                <div class="zvn-add-new pull-right">
                    <a href="/ExtraClassroomWebsite/GiaoVien/ThemThongBaoNhom/<?php echo $data["DataNhom"]["IdNhom"];?>" class="btn btn-success"><i class="fas fa-plus-circle"></i> Thêm thông báo nhóm mới</a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <!-- responsive table -->
                <div style="overflow-x:auto;">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                            <tr class="headings">
                                <th class="column-title">STT</th>
                                <th class="column-title">Tiêu đề thông báo</th>
                                <th class="column-title">Nội dung thông báo</th>
                                <th class="column-title">Ngày tạo thông báo</th>
                                <th class="column-title">#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            for ($i = 0; $i < count($data["DanhSachThongBaoNhom"]); $i++) {
                                ?>
                                <tr class="even pointer">
                                    <td class=""><?php echo ($i + 1); ?></td>
                                    <td><?php echo $data["DanhSachThongBaoNhom"][$i]["TieuDe"]; ?></td>
                                    <td><?php echo $data["DanhSachThongBaoNhom"][$i]["NoiDung"]; ?></td>
                                    <td><?php echo $data["DanhSachThongBaoNhom"][$i]["NgayTao"]; ?></td>
                                    <td class="last">
                                        <div class="zvn-box-btn-filter">
                                            <a href="/ExtraClassroomWebsite/GiaoVien/ChinhSuaThongBaoNhom/<?php echo $data["DanhSachThongBaoNhom"][$i]["IdThongBao"]; ?>/<?php echo $data["DanhSachThongBaoNhom"][$i]["IdNhom"]; ?>" type="input" class="btn btn-icon btn-success" data-toggle="tooltip" data-placement="top" data-original-title="Chỉnh sửa">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a href="/ExtraClassroomWebsite/GiaoVien/XoaThongBaoNhom/<?php echo $data["DanhSachThongBaoNhom"][$i]["IdThongBao"]; ?>/<?php echo $data["DanhSachThongBaoNhom"][$i]["IdNhom"]; ?>" type="input" class="deleteButton btn btn-icon btn-danger btn-delete" data-toggle="tooltip" data-placement="top" data-original-title="Xóa">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Danh sách đề kiểm tra</h2>
                <div class="zvn-add-new pull-right">
                    <a href="/ExtraClassroomWebsite/GiaoVien/ThemDeNhom/<?php echo $data["DataNhom"]["IdNhom"];?>" class="btn btn-success"><i class="fas fa-plus-circle"></i> Thêm đề kiểm tra cho nhóm</a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <!-- responsive table -->
                <div style="overflow-x:auto;">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                            <tr class="headings">
                                <th class="column-title">STT</th>
                                <th class="column-title">Tên đề</th>
                                <th class="column-title">Loại đề</th>
                                <th class="column-title">Thời gian mở</th>
                                <th class="column-title">Thời gian đóng</th>
                                <th class="column-title">Lớp</th>
                                <th class="column-title">Tuần</th>
                                <th class="column-title">Dễ</th>
                                <th class="column-title">Trung bình</th>
                                <th class="column-title">Khó</th>
                                <th class="column-title">Cho xem đáp án sau khi làm</th>
                                <th class="column-title">Ngày tạo đề</th>
                                <th class="column-title">#</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            for ($i = 0; $i < count($data["DanhSachDeNhom"]); $i++) {
                                if ($data["DanhSachDeNhom"][$i]["LoaiDe"] == 0) {
                                    $LoaiDe = "Đề kiểm tra";
                                } else {
                                    $LoaiDe = "Đề thi thử";
                                }

                                if ($data["DanhSachDeNhom"][$i]["HienDapAn"] == 1) {
                                    $HienDapAn = "Cho phép";
                                } else {
                                    $HienDapAn = "Không cho phép";
                                }
                                ?>
                                <tr class="even pointer">
                                    <td class=""><?php echo ($i + 1); ?></td>

                                    <td><?php echo $data["DanhSachDeNhom"][$i]["TenDe"]; ?></td>
                                    <td><?php echo $LoaiDe; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["ThoiGianMo"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["ThoiGianDong"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["Lop"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["Tuan"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["SoCauDe"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["SoCauTrungBinh"]; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["SoCauKho"]; ?></td>
                                    <td><?php echo $HienDapAn; ?></td>
                                    <td><?php echo $data["DanhSachDeNhom"][$i]["NgayTaoDe"]; ?></td>
                                    <td class="last">
                                        <div class="zvn-box-btn-filter">
                                            <a href="/ExtraClassroomWebsite/GiaoVien/ChinhSuaDeNhom/<?php echo $data["DanhSachDeNhom"][$i]["IdDe"]; ?>/<?php echo $data["DataNhom"]["IdNhom"]; ?>" type="input" class="btn btn-icon btn-success" data-toggle="tooltip" data-placement="top" data-original-title="Chỉnh sửa">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <a href="/ExtraClassroomWebsite/GiaoVien/XoaDeNhom/<?php echo $data["DanhSachDeNhom"][$i]["IdDe"]; ?>/<?php echo $data["DataNhom"]["IdNhom"]; ?>" type="input" class="deleteButton btn btn-icon btn-danger btn-delete" data-toggle="tooltip" data-placement="top" data-original-title="Xóa">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>