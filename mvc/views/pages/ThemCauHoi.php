<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Them Cau Hoi Giao Dien So Sai</title>
    <script type="text/javascript" src="../public/js/ckeditor.js"></script>
</head>

<body>
    <?php
    if (isset($data['result'])) {
        print_r($data);
        if ($data['result']) {
            echo "<script type='text/javascript'>alert('Add successfull');</script>";
        } else {
            echo "<script type='text/javascript'>alert('Add fail');</script>";
        }
    }
    ?>
    <h1>Classic editor</h1>
    <?php echo 'php' ?>
    <form action="ThemCauHoi" method="post">
        <h1>CauHoi</h1>
        <textarea name="CauHoi" id="editorCauHoi"></textarea>
        <h1>DapAn1</h1>
        <textarea name="DapAn1" id="editorDapAn1"></textarea>
        <h1>DapAn2</h1>
        <textarea name="DapAn2" id="editorDapAn2"></textarea>
        <h1>DapAn3</h1>
        <textarea name="DapAn3" id="editorDapAn3"></textarea>
        <h1>DapAn4</h1>
        <textarea name="DapAn4" id="editorDapAn4"></textarea>
        <h1>DapAnDung</h1>
        <textarea name="DapAnDung" class="editor"></textarea>
        <h1>LoiGiai</h1>
        <textarea name="LoiGiai" id="editorLoiGiai"></textarea>
        <h1>LoaiCauHoi</h1>
        <textarea name="LoaiCauHoi" class="editor"></textarea>
        <h1>Lop</h1>
        <textarea name="Lop" class="editor"></textarea>
        <p><input type="submit" name="btnSubmit" value="Submit"></p>
    </form>
    <script>
        ClassicEditor
            .create(document.querySelector('#editorCauHoi'))
            .catch(error => {
                console.error(error);
            });
        ClassicEditor
            .create(document.querySelector('#editorDapAn1'))
            .catch(error => {
                console.error(error);
            });
        ClassicEditor
            .create(document.querySelector('#editorDapAn2'))
            .catch(error => {
                console.error(error);
            });
        ClassicEditor
            .create(document.querySelector('#editorDapAn3'))
            .catch(error => {
                console.error(error);
            });
        ClassicEditor
            .create(document.querySelector('#editorDapAn4'))
            .catch(error => {
                console.error(error);
            });
        ClassicEditor
            .create(document.querySelector('#editorLoiGiai'))
            .catch(error => {
                console.error(error);
            });
    </script>
</body>

</html>