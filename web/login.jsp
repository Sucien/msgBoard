<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>登陆界面</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 120px">
        <h1>请登录</h1>
        <form action="LoginServlet" method="post">
            <c:if test="${loginError != null}">
                <p style="color: red"><%= request.getAttribute("loginError")%></p>
            </c:if>

            <table style="margin-left: 40%">
                <caption>用户登陆</caption>
                <tr>
                    <td>登陆名:</td>
                    <td><input name="name" type="text" size="20"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input name="password" type="password" size="21"></td>
                </tr>
            </table>
            <input type="submit" value="登陆">
            <input type="reset" value="重置">
        </form>
        <br><a href="register.jsp">注册</a>

    </div>


</body>
</html>
