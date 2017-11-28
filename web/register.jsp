<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="GB2312" %>
<html>
<head>
    <title>×¢²á½çÃæ</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 120px">
        <h1>Çë×¢²á</h1>
        <form action="RegisterServlet" method="post">
            <table style="margin-left: 40%">
                <caption>ÓÃ»§×¢²á</caption>
                <tr>
                    <td>µÇÂ½Ãû:</td>
                    <td><input name="name" type="text" size="20"></td>
                </tr>
                <tr>
                    <td>ÃÜÂë:</td>
                    <td><input name="password" type="password" size="21"></td>
                </tr>
            </table>
            <input type="submit" value="×¢²á">
            <input type="reset" value="ÖØÖÃ">
        </form>
        <br>
        <a href="login.jsp">µÇÂ½</a>
    </div>


</body>
</html>
