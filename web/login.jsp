<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="gb2312"
         import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>��½����</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 120px">
        <h1>���¼</h1>
        <form action="LoginServlet" method="post">
            <c:if test="${loginError != null}">
                <p style="color: red"><%= request.getAttribute("loginError")%></p>
            </c:if>

            <table style="margin-left: 40%">
                <caption>�û���½</caption>
                <tr>
                    <td>��½��:</td>
                    <td><input name="name" type="text" size="20"></td>
                </tr>
                <tr>
                    <td>����:</td>
                    <td><input name="password" type="password" size="21"></td>
                </tr>
            </table>
            <input type="submit" value="��½">
            <input type="reset" value="����">
        </form>
        <br><a href="register.jsp">ע��</a>

    </div>


</body>
</html>
