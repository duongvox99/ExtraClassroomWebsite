<!DOCTYPE html>
<html lang="vi">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Lam Bai Thi</title>

    <script type="text/javascript" src="../public/js/ckeditor.js"></script>
    <script id="MathJax-script" async src="../public/js/tex-mml-chtml.js"></script>
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