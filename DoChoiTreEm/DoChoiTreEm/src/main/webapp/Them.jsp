<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Đồ Chơi</title>
<link rel="stylesheet" href="css/style.css">
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	color: #fff;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	margin-top: 20px;
}

.button:hover {
	background-color: #0056b3;
}

.centered {
	text-align: center; 
	margin-top: 20px; 
}
h2{
    text-align: center; 
    margin-top: 20px;   
}
</style>
</head>
<body>
	<header>
		<h1>Trang Chủ Quản Trị</h1>
		<nav>
			<ul>
                <li><a href="Them.jsp">Thêm</a></li>
                <li><a href="Xoa.jsp">Xóa</a></li>
                <li><a href="CapNhat.jsp">Cập Nhật</a></li>
                
            </ul>
		</nav>
	</header>
	<h2>Thêm Đồ Chơi Mới</h2>
	<form action="them" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="maDoChoi">Mã Đồ Chơi</label></td>
				<td><input type="text" id="maDoChoi" name="maDoChoi" required></td>
			</tr>
			<tr>
				<td><label for="tenDoChoi">Tên Đồ Chơi</label></td>
				<td><input type="text" id="tenDoChoi" name="tenDoChoi" required></td>
			</tr>
			<tr>
				<td><label for="gia">Giá</label></td>
				<td><input type="number" id="gia" name="gia" required></td>
			</tr>
			<tr>
				<td><label for="tinhTrang">Tình Trạng</label></td>
				<td><input type="text" id="tinhTrang" name="tinhTrang" required></td>
			</tr>
			<tr>
				<td><label for="loaiDoChoi">Loại Đồ Chơi</label></td>
				<td><input type="text" id="loaiDoChoi" name="loaiDoChoi"
					required></td>
			</tr>
			<tr>
				<td><label for="anh">Ảnh</label></td>
				<td><input type="file" id="anh" name="anh" accept="image/*"
					required></td>
			</tr>
		</table>
		<br>
		<div class="centered">
			<input type="submit" value="Thêm Đồ Chơi"> <a
				href="TrangChuAdmin.jsp">Quay lại Trang Chủ Admin</a>
		</div>
		<%
		if (request.getAttribute("errorMessage") != null) {
		%>
		<p class="error-message"><%=request.getAttribute("errorMessage")%></p>
		<%
		}
		%>
	</form>
</body>
</html>
