<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.CapNhatDAO"%>
<%@ page import="entities.DoChoiTreEm"%>
<%
CapNhatDAO capNhatDAO = new CapNhatDAO();
    List<DoChoiTreEm> doChoiTreEmList = capNhatDAO.getAllDoChoiTreEm();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập Nhật</title>
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
        <h1>Trang Chủ Quản Trị</h1>
        <nav>
            <ul>
                <li><a href="Them.jsp">Thêm</a></li>
                <li><a href="Xoa.jsp">Xóa</a></li>
                <li><a href="CapNhat.jsp">Cập Nhật</a></li>
                <li><a href="QuanLyTaiKhoan.jsp">Tài Khoản</a></li>
                <li><a href="LogoutServlet">Đăng Xuất</a></li> 
            </ul>
        </nav>
    </header>
    <section>
        <h2>Cập Nhật Thông Tin Đồ Chơi Trẻ Em</h2>
        <form action="CapNhatServlet" method="post">
            <table>
                <tr>
                    <th>Mã Đồ Chơi</th>
                    <th>Tên Đồ Chơi</th>
                    <th>Giá</th>
                    <th>Tình Trạng</th>
                    <th>Loại Đồ Chơi</th>
                    <th>Hành Động</th>
                </tr>
                <%
                for (DoChoiTreEm doChoiTreEm : doChoiTreEmList) {
                %>
                <tr>
                    <form action="CapNhatServlet" method="post">
                        <td><%= doChoiTreEm.getMaDoChoi() %><input type="hidden" name="maDoChoi" value="<%= doChoiTreEm.getMaDoChoi() %>"></td>
                        <td><input type="text" name="tenDoChoi" value="<%= doChoiTreEm.getTenDoChoi() %>"></td>
                        <td><input type="number" name="gia" value="<%= doChoiTreEm.getGia() %>"></td>
                        <td><input type="text" name="tinhTrang" value="<%= doChoiTreEm.getTinhTrang() %>"></td>
                        <td><input type="text" name="loaiDoChoi" value="<%= doChoiTreEm.getLoaiDoChoi() %>"></td>
                        <td><input type="submit" value="Cập Nhật"></td>
                    </form>
                </tr>
                <%
                }
                %>
            </table>
        </form>
    </section>
    <div>
        <a href="TrangChuAdmin.jsp" class="button">Quay Lại Trang Chủ</a>
    </div>
</body>
</html>
