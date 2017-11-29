<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cs.cwnu.bean.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="cs.cwnu.bean.User" pageEncoding="utf-8" %>
<%@ page import="cs.cwnu.dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>留言板界面</title>
</head>
<body bgcolor="#CCCFFF">
    <div style="margin-left: 35%;margin-top: 100px;font-family: 'Microsoft YaHei UI'">
        <h1>这里是留言板主界面</h1>
        <form action="leavemessage.jsp" method="post">
            <table border="1">

                <% ArrayList<Message> al = new ArrayList<Message>();
                    al = (ArrayList) session.getAttribute("al");

                    User logUser = (User) request.getSession().getAttribute("login");
                %>
                <caption>所有留言信息</caption><br>
                用户名：<%= logUser.getName()%>
                所属权限：<%
                    if ((new UserDao().getUserRole(logUser.getName())) == 0){
                        out.print("管理员");
                    }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                        out.print("普通用户");
                    }else {
                        out.print("未知用户");
                    }
                %><br>
                当前状态：<%
                    if((new UserDao().getUserStatus(logUser.getName())) == 0){
                        out.print("正在申请解除禁言");
                    }else if((new UserDao().getUserStatus(logUser.getName())) == 1){
                        out.print("可以正常发言");
                    }else if((new UserDao().getUserStatus(logUser.getName())) == 2){
                        out.print("禁言状态");
                        session.setAttribute("loguser",logUser.getName());
                    %>
                点击<a  href="SetStatusAskingServlet">这里</a>申请解除禁言

                    <%
                    }else{
                        out.print("未知错误");
                    }

                    %>
                <br>
                <tr>
                    <th>留言人姓名</th>
                    <th>所属权限</th>
                    <th>留言时间</th>
                    <th>留言标题</th>
                    <th>留言内容</th>
                    <th>可用操作</th>
                    <th>成员管理</th>
                </tr>

                <%
                   if(al != null){
                       Iterator it = al.iterator();
                       while (it.hasNext()){
                           Message mb = (Message)it.next();

                %>
                <tr>
                    <td><%= mb.getName()%></td>
                    <td><%
                            if ((new UserDao().getUserRole(mb.getName())) == 0){
                                out.print("管理员");
                            }else if((new UserDao().getUserRole(mb.getName())) == 1){
                                out.print("普通用户");
                            }else {
                                out.print("未知用户");
                            }

                    %></td>
                    <td><%= mb.getTime().toString()%></td>
                    <td><%= mb.getTitle()%></td>
                    <td><%= mb.getMessage()%></td>


                    <%--管理员可以删除留言--%>
                    <td><%
                            if ((new UserDao().getUserRole(logUser.getName())) == 0){
                                int id  = mb.getId();
                                session.setAttribute("id",id);
                                out.print("<a  href=\"DeleteMessageServlet\">删除</a>");
                            }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                                out.print("不能操作");
                            }else {
                                out.print("未知权限");
                            }
                    %></td>


                    <%--管理员可以设置成员状态--%>
                    <td>
                        <%
                            /*如果是管理员则可以禁言、解除禁言（必须用户申请）*/
                            if ((new UserDao().getUserRole(logUser.getName())) == 0){
                                if((new UserDao().getUserStatus(mb.getName()) == 1)) {

                                    /*获取当前状态下的用户名*/
                                    String banname  = mb.getName();
                                    session.setAttribute("banname",banname);
                                    out.print("<a  href=\"SetStatusBanServlet\">禁言</a>");
                                }else if (((new UserDao().getUserStatus(mb.getName()) == 0))){
                                    /*获取当前状态下的用户名*/
                                    String activatedname  = mb.getName();
                                    session.setAttribute("activatedname",activatedname);

                                    out.print("<a  href=\"SetStatusActivatedServlet\">解除禁言</a>");
                                } else {
                                    out.print("禁言状态");
                                }
                            /*如果是普通用户或者是未知用户则显示权限不足*/
                            }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                                out.print("权限不足");
                            }else {
                                out.print("权限不明");
                            }
                        %>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
        <%
            if ((new UserDao().getUserStatus(logUser.getName())) == 1 || (new UserDao().getUserRole(logUser.getName())) == 0){
        %>
        <a style="margin-left: 22%" href="leavemessage.jsp">留言</a>（管理员不受禁言限制）
        <%
            }else {
                out.print("您现在还不能发言，在上方可查看您的进度以及申请解除禁言");
            }
        %>
    </div>
</body>
</html>
