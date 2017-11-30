package cs.cwnu.servlet;

import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteMessageServlet")
public class DeleteMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");

        String id1 =  request.getParameter("id");

        System.out.println("Servlet中获取的id是："+id1);

        int id = Integer.parseInt(id1);


        if(new UserDao().delInfo(id)){
            response.sendRedirect("delsuccess.jsp");
        }
    }
}
