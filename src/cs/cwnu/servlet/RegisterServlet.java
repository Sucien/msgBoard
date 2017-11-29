package cs.cwnu.servlet;

import cs.cwnu.bean.User;
import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        User user = new User();

        String role = request.getParameter("role");

        if(role.equals("ADMIN")){
            user.setRole(User.ADMIN);
            System.out.println(user.getRole());
        }else if(role.equals("MEMBER")) {
            user.setRole(User.MEMBER);
            System.out.println(user.getRole());
        }else {
            System.out.println("Something Wrong with this programme");
        }


        int userRole = user.getRole();

        //insertUser返回executeUpdate对象，插入成功则返回true
        if (new UserDao().insertUser(name,password,userRole)){
            response.sendRedirect("login.jsp");
        }
    }

}
