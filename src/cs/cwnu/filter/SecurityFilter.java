package cs.cwnu.filter;

import cs.cwnu.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "SecurityFilter")
public class SecurityFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        if(!request.getRequestURI().endsWith("login.jsp")
                &&!request.getRequestURI().endsWith("loginServlet")
                &&!request.getRequestURI().endsWith("registerServlet")
                &&!request.getRequestURI().endsWith("register.jsp")){
            User user = (User) request.getSession().getAttribute("login");

            if(user == null){
                request.setAttribute("message","请先登录！！！");
                response.sendRedirect("/msgBoard/login.jsp");
                return;
            }
        }
            chain.doFilter(request,response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
