<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>CKEditor 5 – Classic editor</title>
    <script src="./public/ckeditor5-build-classic/build/ckeditor.js"></script>
</head>

<body>
    <h1>Classic editor</h1>
    <textarea name="content" id="editor">
    </textarea>
    <button onclick="myFunction()">Submit</button>
    <script>
        ClassicEditor
            .create(document.querySelector('#editor'))
            .catch(error => {
                console.error(error);
            });

        function myFunction() {
            alert(document.getElementById('editor').value);
        }
    </script>
</body>

</html>