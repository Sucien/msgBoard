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
    <title>���Խ���</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 140px">
        <h1>������</h1>

        <form action="LeaveMessageServlet" method="post">
            <table style="margin-left: 37%" border="1">
                <caption>��д������Ϣ</caption>
                <tr>
                    <td>���Ա���</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>��������</td>
                    <td><textarea name="message" rows="5" cols="35"></textarea> </td>
                </tr>
            </table>
            <input type="submit" value="�ύ"/>
            <input type="reset" value="����"/>
        </form>

        <a href="main.jsp">�������԰����</a>
    </div>
</body>
</html>
