package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.DoChoiTreEm;
import dao.DoChoiTreEmDAO;
import java.sql.SQLException;

@WebServlet("/ChiTietDoChoiTreEmServlet")
public class ChiTietDoChoiTreEmServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DoChoiTreEmDAO doChoiTreEmDAO;

    @Override
    public void init() {
    	doChoiTreEmDAO = new DoChoiTreEmDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maDoChoi = request.getParameter("maDoChoi");
        DoChoiTreEm doChoiTreEm = null;
        try {
        	doChoiTreEm = doChoiTreEmDAO.getDoChoiTreEmByMa(maDoChoi);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("doChoiTreEm", doChoiTreEm);
        request.getRequestDispatcher("ChiTietDoChoiTreEm.jsp").forward(request, response);
    }
}
