package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CapNhatDAO;
import entities.DoChoiTreEm;

@WebServlet("/CapNhatServlet")
public class CapNhatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CapNhatDAO capNhatDAO;

    public void init() {
        capNhatDAO = new CapNhatDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<DoChoiTreEm> doChoiTreEmList = capNhatDAO.getAllDoChoiTreEm();
            request.setAttribute("doChoiTreEmList", doChoiTreEmList);
            request.getRequestDispatcher("CapNhat.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDoChoi = request.getParameter("maDoChoi");
        String tenDoChoi = request.getParameter("tenDoChoi");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String tinhTrang = request.getParameter("tinhTrang");
        String loaiDoChoi = request.getParameter("loaiDoChoi");

        DoChoiTreEm doChoiTreEm = new DoChoiTreEm();
        doChoiTreEm.setMaDoChoi(maDoChoi);
        doChoiTreEm.setTenDoChoi(tenDoChoi);
        doChoiTreEm.setGia(gia);
        doChoiTreEm.setTinhTrang(tinhTrang);
        doChoiTreEm.setLoaiDoChoi(loaiDoChoi);

        try {
            capNhatDAO.updateDoChoiTreEm(doChoiTreEm);
            response.sendRedirect("CapNhat.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
