package cs.cwnu.servlet;

import cs.cwnu.bean.Message;
import cs.cwnu.bean.User;
import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "LeaveMessageServlet")
public class LeaveMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        String title = request.getParameter("title");
        String message = request.getParameter("message");


        User user = (User) request.getSession().getAttribute("login");

        Message mb = new Message();
        mb.setName(user.getName());
        mb.setTime(new Date(System.currentTimeMillis()));
        mb.setTitle(title);
        mb.setMessage(message);

        if(new UserDao().addInfo(mb)){
            response.sendRedirect("success.jsp");
        }
    }
}
