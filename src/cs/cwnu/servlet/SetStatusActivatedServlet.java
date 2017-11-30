package cs.cwnu.servlet;

import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SetStatusActivatedServlet")
public class SetStatusActivatedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        String name = request.getParameter("activatedname");

        if(new UserDao().setStatusActivated(name)){
            System.out.println("更新数据成功！！！！！");
            response.sendRedirect("activatedsuccess.jsp");
        }
    }
}
