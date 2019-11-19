<!DOCTYPE html>
<html lang="vi">

<head>
	<?php
		if (isset($data["SubView"])) {
			require("heads/" . $data["SubView"] . ".php");
		}
		else {
			require("heads/ThongBao.php");
		}
	?>
</head>

<body >
	<?php 
		require("pages/headerHocSinh.php");
		if (isset($data["SubView"])) {
			require("pages/" .$data["SubView"] . ".php");
		}
		else {
			require("pages/ThongBao.php");
		}
		require("pages/footerHocSinh.php");
	?>
</body>
</html>