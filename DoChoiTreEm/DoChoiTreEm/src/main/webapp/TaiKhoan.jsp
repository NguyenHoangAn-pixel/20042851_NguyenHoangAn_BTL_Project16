<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="entities.Customer"%>
<%
Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông Tin Tài Khoản</title>
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
</style>
</head>
<body>
    <header>
        <h1>Thông Tin Tài Khoản</h1>
        <nav>
            <ul>
                <li><a href="TrangChuKhach.jsp">Trang Chủ</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li>
            </ul>
        </nav>
    </header>
    <section>
        <h2>Thông Tin Cá Nhân</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Địa Chỉ</th>
            </tr>
            <tr>
                <td><%= customer != null ? customer.getCustomerId() : "N/A" %></td>
                <td><%= customer != null ? customer.getFullName() : "N/A" %></td>
                <td><%= customer != null ? customer.getPhoneNumber() : "N/A" %></td>
                <td><%= customer != null ? customer.getAddress() : "N/A" %></td>
            </tr>
        </table>
    </section>
    <div>
        <a href="TrangChuKhach.jsp" class="button">Quay lại Trang Chủ</a>
    </div>
</body>
</html>
