package cs.cwnu.servlet;

import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SetStatusBanServlet")
public class SetStatusBanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setContentType("gb2312");

        String name = (String) request.getSession().getAttribute("banname");

        if(new UserDao().setStatusBan(name)){
            response.sendRedirect("bansuccess.jsp");
        }
    }
}
