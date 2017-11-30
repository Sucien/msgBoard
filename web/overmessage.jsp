<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/30
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
<div style="text-align: center;margin-top: 140px">
    <h1>请覆盖标题以及内容</h1>

    <%

        String id1 =  request.getParameter("id");
        System.out.println("Servlet中获取的id是："+id1);
        int id = Integer.parseInt(id1);

        session.setAttribute("oid",id);

    %>

    <form action="OverMessagesServlet" method="post">
        <table style="margin-left: 37%" border="1">
            <caption>填写覆盖信息</caption>
            <tr>
                <td>覆盖标题</td>
                <td><input type="text" name="otitle"></td>
            </tr>
            <tr>
                <td>覆盖内容</td>
                <td><textarea name="omessage" rows="5" cols="35"></textarea> </td>
            </tr>
        </table>
        <input type="submit" value="确认修改"/>
        <input type="reset" value="重置"/>
    </form>

    <a href="main.jsp">返回留言板界面</a>
</div>
</body>
</html>
