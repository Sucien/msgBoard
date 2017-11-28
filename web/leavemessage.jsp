<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="GB2312" %>
<html>
<head>
    <title>留言界面</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 140px">
        <h1>请留言</h1>

        <form action="LeaveMessageServlet" method="post">
            <table style="margin-left: 37%" border="1">
                <caption>填写留言信息</caption>
                <tr>
                    <td>留言标题</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>留言内容</td>
                    <td><textarea name="message" rows="5" cols="35"></textarea> </td>
                </tr>
            </table>
            <input type="submit" value="提交"/>
            <input type="reset" value="重置"/>
        </form>

        <a href="main.jsp">返回留言板界面</a>
    </div>
</body>
</html>
