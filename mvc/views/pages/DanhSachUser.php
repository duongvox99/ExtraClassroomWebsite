
            <div class="page-header zvn-page-header clearfix">
                <div class="zvn-page-header-title">
                    <h3>Danh sách người dùng</h3>
                </div>
                <div class="zvn-add-new pull-right">
                    <a href="/form" class="btn btn-success"><i class="fas fa-plus-circle"></i> Thêm mới</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Bộ lọc</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="row">
                                <div class="col-md-6"><a
                                        href="?filter_status=all" type="button"
                                        class="btn btn-primary">
                                    Tất cả <span class="badge bg-white">4</span>
                                </a><a href="?filter_status=active"
                                       type="button" class="btn btn-success">
                                    Lớp 10 <span class="badge bg-white">2</span>
                                </a><a href="?filter_status=inactive"
                                       type="button" class="btn btn-success">
                                    Lớp 11 <span class="badge bg-white">2</span>

                                </a><a href="?filter_status=active"
                                       type="button" class="btn btn-success">
                                    Lớp 12 <span class="badge bg-white">2</span>
                                </a>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group">                                        
                                        <input type="text" class="form-control" name="search_value" value="">
                                        <span class="input-group-btn">
                                    <button id="btn-search" type="button" class="btn btn-primary">Tìm kiếm</button>
                                    </span>
                                        <input type="hidden" name="search_field" value="all">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--box-lists-->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Danh sách</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li class="pull-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                                <table class="table table-striped jambo_table bulk_action">
                                    <thead>
                                    <tr class="headings">
                                        <th class="column-title">STT</th>
                                        <th class="column-title">Avatar</th>
                                        <th class="column-title">Tên đăng nhập</th>
                                        <th class="column-title">Họ và Tên</th>
                                        <th class="column-title">Năm Sinh</th>                                       
                                        <th class="column-title">Lớp</th>
                                        <th class="column-title">Id Nhóm</th>
                                        <th class="column-title">Email</th>
                                        <th class="column-title">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="even pointer">
                                        <td class="">1</td>
                                        <td width="5%"><img src="/ExtraClassroomWebsite/public/admin/img/img.jpg"
                                                            alt="admin" class="zvn-thumb"></td>
                                        <td width="10%">admin1</td>
                                        <td>Võ Văn Dương</td>
                                        <td>1999</td>                                        
                                        <td>0</td>
                                        <td>0</td>
                                        <td>duongvox99@gmail.com</td>
                                        <td class="last">
                                            <div class="zvn-box-btn-filter"><a
                                                    href="/form/1"
                                                    type="button" class="btn btn-icon btn-success" data-toggle="tooltip"
                                                    data-placement="top" data-original-title="Chỉnh sửa">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a><a href="/delete/1"
                                                   type="button" class="btn btn-icon btn-danger btn-delete"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-original-title="Xóa">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="even pointer">
                                        <td class="">1</td>
                                        <td width="5%"><img src="/ExtraClassroomWebsite/public/admin/img/img.jpg"
                                                            alt="admin" class="zvn-thumb"></td>
                                        <td width="10%">admin1</td>
                                        <td>Võ Văn Dương</td>
                                        <td>1999</td>                                        
                                        <td>0</td>
                                        <td>0</td>

                                        <td>duongvox99@gmail.com</td>
                                        <td class="last">
                                            <div class="zvn-box-btn-filter"><a
                                                    href="/form/1"
                                                    type="button" class="btn btn-icon btn-success" data-toggle="tooltip"
                                                    data-placement="top" data-original-title="Chỉnh Sửa">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a><a href="/delete/1"
                                                   type="button" class="btn btn-icon btn-danger btn-delete"
                                                   data-toggle="tooltip" data-placement="top"
                                                   data-original-title="Xóa">
                                                <i class="fa fa-trash"></i>
                                            </a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end-box-lists-->
            <!--box-pagination-->
            <!--end-box-pagination-->
