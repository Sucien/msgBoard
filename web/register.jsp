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
    <title>ע�����</title>
</head>
<body bgcolor="#CCCFFF" style="font-family: 'Microsoft YaHei UI'">
    <div style="text-align: center;margin-top: 120px">
        <h1>��ע��</h1>
        <form action="RegisterServlet" method="post">
            <table style="margin-left: 40%">
                <caption>�û�ע��</caption>
                <tr>
                    <td>��½��:</td>
                    <td><input name="name" type="text" size="20"></td>
                </tr>
                <tr>
                    <td>����:</td>
                    <td><input name="password" type="password" size="21"></td>
                </tr>
            </table>
            ��ɫ��
            <select name="role">
                <option value="ADMIN">����Ա</option>
                <option value="MEMBER">��ͨ��Ա</option>
            </select>
            <br>

            <input type="submit" value="ע��">
            <input type="reset" value="����">
        </form>
        <br>
        <a href="login.jsp">��½</a>
    </div>


</body>
</html>
