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
		require("pages/header.php");
		if (isset($data["SubView"])) {
			require("pages/" .$data["SubView"] . ".php");
		}
		else {
			require("pages/ThongBao.php");
		}
		require("pages/footer.php");
	?>
</body>
</html>