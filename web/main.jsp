<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cs.cwnu.bean.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="GB2312" %>
<html>
<head>
    <title>���԰����</title>
</head>
<body bgcolor="#CCCFFF">
    <div style="margin-left: 35%;margin-top: 100px;font-family: 'Microsoft YaHei UI'">
        <h1>���������԰�������</h1>
        <form action="leavemessage.jsp" method="post">
            <table border="1">
                <caption>����������Ϣ</caption>
                <tr>
                    <th>����������</th>
                    <th>����ʱ��</th>
                    <th>���Ա���</th>
                    <th>��������</th>
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
        <a style="margin-left: 22%" href="leavemessage.jsp">����</a>
    </div>
</body>
</html>
