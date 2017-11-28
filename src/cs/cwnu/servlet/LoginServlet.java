package cs.cwnu.servlet;

import cs.cwnu.bean.User;
import cs.cwnu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");

        response.setContentType("gb2312");
        UserDao userDao = new UserDao();

        HttpSession session = request.getSession();

        User l = (User) session.getAttribute("login");

        if(l == null) {
            l = userDao.checkLogin(request.getParameter("name"));
            request.getParameter("password");
        }
        if (l != null) {
            session.setAttribute("login", l);

            //查询messages数据库里面的消息然后加入到al这个数组里面去
            ArrayList al = userDao.findMbInfo();
            //并且将al的值“存储”在会话里面
            session.setAttribute("al", al);


            response.sendRedirect("main.jsp");
        } else {
            request.setAttribute("loginError", "输入的用户名不存在或者密码错误");

            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
