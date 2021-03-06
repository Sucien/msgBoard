package cs.cwnu.servlet;

import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OverMessagesServlet")
public class OverMessagesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        int oid = (int) request.getSession().getAttribute("oid");

        String otitle = request.getParameter("otitle");
        String omessage = request.getParameter("omessage");

        if(new UserDao().overInfo(oid,otitle,omessage)){
            response.sendRedirect("delsuccess.jsp");
        }
    }
}
