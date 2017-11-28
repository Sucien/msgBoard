<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cs.cwnu.bean.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="cs.cwnu.dao.UserDao" pageEncoding="GB2312" %>
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
                <caption>所有留言信息</caption>
                <tr>
                    <th>留言人姓名</th>
                    <th>所属权限</th>
                    <th>留言时间</th>
                    <th>留言标题</th>
                    <th>留言内容</th>
                </tr>
                <% ArrayList<Message> al = new ArrayList<Message>();
                   al = (ArrayList) session.getAttribute("al");

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
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
        <a style="margin-left: 22%" href="leavemessage.jsp">留言</a>
    </div>
</body>
</html>
