<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="GB2312" %>
<html>
<head>
    <title>注册界面</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 120px">
        <h1>请注册</h1>
        <form action="RegisterServlet" method="post">
            <table style="margin-left: 40%">
                <caption>用户注册</caption>
                <tr>
                    <td>登陆名:</td>
                    <td><input name="name" type="text" size="20"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input name="password" type="password" size="21"></td>
                </tr>
            </table>
            角色：
            <select name="role">
                <option value="ADMIN">管理员</option>
                <option value="MEMBER">普通成员</option>
            </select>
            <br>

            <input type="submit" value="注册">
            <input type="reset" value="重置">
        </form>
        <br>
        <a href="login.jsp">登陆</a>
    </div>


</body>
</html>
