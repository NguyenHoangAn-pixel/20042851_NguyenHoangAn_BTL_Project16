<%@ page import="java.util.List"%>
<%@ page import="dao.DoChoiTreEmDAO"%>
<%@ page import="entities.DoChoiTreEm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
DoChoiTreEmDAO doChoiTreEmDAO = new DoChoiTreEmDAO();
List<DoChoiTreEm> doChoiTreEmList = doChoiTreEmDAO.getAllDoChoiTreEm();
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Chủ Khách Hàng</title>
<link rel="stylesheet" href="css/style.css">
<style>
.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.card {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 20px;
	width: calc(33.333% - 20px);
	box-sizing: border-box;
	text-align: center;
	transition: box-shadow 0.3s;
}

.card:hover {
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}

.card img {
	max-width: 100%;
	height: auto;
	border-radius: 5px;
}

.card h2 {
	margin: 15px 0;
	font-size: 1.2em;
}

.card p {
	margin: 10px 0;
	font-size: 1em;
}

.card a {
	display: inline-block;
	padding: 10px 20px;
	color: #fff;
	background-color: #007bff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.card a:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<header>
		<h1>Trang Chủ Khách Hàng</h1>
		<nav>
			<ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="GioHang.jsp">Giỏ Hàng</a></li>
                <li><a href="TaiKhoan.jsp">Tài Khoản</a></li>
                 <li><a href="LogoutServlet">Đăng Xuất</a></li> <!-- Thêm liên kết đăng xuất -->
			</ul>
		</nav>
	</header>
	<section class="card-container">
		<%
		for (DoChoiTreEm doChoiTreEm : doChoiTreEmList) {
		%>
		<div class="card">
			                    <%
                        
                        String maDoChoi = doChoiTreEm.getMaDoChoi();
                        if (maDoChoi != null && !maDoChoi.isEmpty()) {
                            
                            String imagePath = request.getContextPath() + "/img/" + maDoChoi + ".jpg";
                    %>
                        <img src="<%= imagePath %>" alt="Hình Ảnh" width="100" />
                    <%
                        } else {
                    %>
                        Không có hình ảnh
                    <%
                        }
                    %>
			<h2><%=doChoiTreEm.getTenDoChoi()%></h2>
			<p>
				Giá:
				<%=doChoiTreEm.getGia()%>
				VND
			</p>
			<p>
				Tình Trạng:
				<%=doChoiTreEm.getTinhTrang()%></p>
			<a href="ChiTietDoChoiTreEmServlet?maDoChoi=<%=doChoiTreEm.getMaDoChoi()%>">Xem
				Chi Tiết</a>
		</div>
		<%
		}
		%>
	</section>
</body>
</html>
