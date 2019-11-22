<!-- $TenDe = $_POST["TenDe"];
$LoaiDe = $_POST["LoaiDe"];
$SoCauHoi = $_POST["SoCauHoi"];
$HienDapAn = $_POST["HienDapAn"];
$Lop = $_POST["Lop"]; -->

<form>
    <div class="form-group">
        <label for="tende">Tên đề</label>
        <input type="email" class="form-control" id="tende" placeholder="Tên đề">
    </div>
    <div class="form-group">
        <!-- cần chuyển thành select list  -->
        <label for="loaide">Loại đề</label>
        <input type="password" class="form-control" id="loaide" placeholder="Loại đề">
    </div>
    <div class="form-check">
        <input type="checkbox" class="form-check-input" id="hiendapan">
        <label class="form-check-label" for="hiendapan">Hiện đáp án sau khi học sinh làm bài</label>
    </div>
    <div class="form-group">
        <!-- cần chuyển thành select list  -->
        <label for="lop">Lớp</label>
        <input type="number" min="10" max="12" class="form-control" id="lop" placeholder="Lớp">
    </div>
    <button name="btnSubmit" type="submit" class="btn btn-primary">Tạo đề</button>
</form>