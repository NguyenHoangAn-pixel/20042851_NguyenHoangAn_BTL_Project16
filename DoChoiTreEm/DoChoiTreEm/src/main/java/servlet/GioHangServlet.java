package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DoChoiTreEmDAO;
import entities.DoChoiTreEm;

@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DoChoiTreEmDAO doChoiTreEmDAO;

    @Override
    public void init() {
    	doChoiTreEmDAO = new DoChoiTreEmDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<DoChoiTreEm> gioHang = (List<DoChoiTreEm>) session.getAttribute("gioHang");

        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }

        List<DoChoiTreEm> doChoiTreEmList = new ArrayList<>();
        int totalPrice = 0;

        try {
            for (DoChoiTreEm doChoiTreEm : gioHang) {
            	DoChoiTreEm doChoiTreEmDetail = doChoiTreEmDAO.getDoChoiTreEmByMa(doChoiTreEm.getMaDoChoi());
                if (doChoiTreEmDetail != null) {
                	doChoiTreEmList.add(doChoiTreEmDetail);
                    totalPrice += doChoiTreEmDetail.getGia();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("doChoiTreEmList", doChoiTreEmList);
        request.setAttribute("totalPrice", totalPrice);
        request.getRequestDispatcher("GioHang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<DoChoiTreEm> gioHang = (List<DoChoiTreEm>) session.getAttribute("gioHang");

        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }

        if ("checkout".equals(action)) {
            try {
                // Get the current date and time
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                String orderDate = dateFormat.format(now);

                // Save the order details (you might want to add this functionality)
                // Example: Save order to database (implementation required)

                // Save order date to session
                session.setAttribute("orderDate", orderDate);

                // Redirect to success page
                response.sendRedirect("ThanhToanThanhCong.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            
            String maDoChoi = request.getParameter("maDoChoi");
            try {
            	DoChoiTreEm doChoiTreEm = doChoiTreEmDAO.getDoChoiTreEmByMa(maDoChoi);
                if (doChoiTreEm != null) {
                    gioHang.add(doChoiTreEm);
                    session.setAttribute("gioHang", gioHang);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
            response.sendRedirect("ChiTietDoChoiTreEm.jsp?maDoChoi=" + maDoChoi);
        }
    }

}