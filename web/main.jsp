<%--
  Created by IntelliJ IDEA.
  User: lisuc
  Date: 2017/11/21
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cs.cwnu.bean.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="cs.cwnu.bean.User" pageEncoding="GB2312" %>
<%@ page import="cs.cwnu.dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>���԰����</title>
</head>
<body bgcolor="#CCCFFF">
    <div style="margin-left: 35%;margin-top: 100px;font-family: 'Microsoft YaHei UI'">
        <h1>���������԰�������</h1>
        <form action="leavemessage.jsp" method="post">
            <table border="1">

                <% ArrayList<Message> al = new ArrayList<Message>();
                    al = (ArrayList) session.getAttribute("al");

                    User logUser = (User) request.getSession().getAttribute("login");
                %>
                <caption>����������Ϣ</caption><br>
                �û�����<%= logUser.getName()%>
                ����Ȩ�ޣ�<%
                    if ((new UserDao().getUserRole(logUser.getName())) == 0){
                        out.print("����Ա");
                    }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                        out.print("��ͨ�û�");
                    }else {
                        out.print("δ֪�û�");
                    }
                %><br>
                ��ǰ״̬��<%
                    if((new UserDao().getUserStatus(logUser.getName())) == 0){
                        out.print("��������������");
                    }else if((new UserDao().getUserStatus(logUser.getName())) == 1){
                        out.print("������������");
                    }else if((new UserDao().getUserStatus(logUser.getName())) == 2){
                        out.print("����״̬");
                        session.setAttribute("loguser",logUser.getName());
                    %>
                ���<a  href="SetStatusAskingServlet">����</a>����������

                    <%
                    }else{
                        out.print("δ֪����");
                    }

                    %>
                <br>
                <tr>
                    <th>����������</th>
                    <th>����Ȩ��</th>
                    <th>����ʱ��</th>
                    <th>���Ա���</th>
                    <th>��������</th>
                    <th>���ò���</th>
                    <th>��Ա����</th>
                </tr>

                <%
                   if(al != null){
                       Iterator it = al.iterator();
                       while (it.hasNext()){
                           Message mb = (Message)it.next();

                %>
                <tr>
                    <td><%= mb.getName()%></td>
                    <td><%
                            if ((new UserDao().getUserRole(mb.getName())) == 0){
                                out.print("����Ա");
                            }else if((new UserDao().getUserRole(mb.getName())) == 1){
                                out.print("��ͨ�û�");
                            }else {
                                out.print("δ֪�û�");
                            }

                    %></td>
                    <td><%= mb.getTime().toString()%></td>
                    <td><%= mb.getTitle()%></td>
                    <td><%= mb.getMessage()%></td>


                    <%--����Ա����ɾ������--%>
                    <td><%
                            if ((new UserDao().getUserRole(logUser.getName())) == 0){
                                int id  = mb.getId();
                                session.setAttribute("id",id);
                                out.print("<a  href=\"DeleteMessageServlet\">ɾ��</a>");
                            }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                                out.print("���ܲ���");
                            }else {
                                out.print("δ֪Ȩ��");
                            }
                    %></td>


                    <%--����Ա�������ó�Ա״̬--%>
                    <td>
                        <%
                            /*����ǹ���Ա����Խ��ԡ�������ԣ������û����룩*/
                            if ((new UserDao().getUserRole(logUser.getName())) == 0){
                                if((new UserDao().getUserStatus(mb.getName()) == 1)) {
                                    String banname  = mb.getName();
                                    session.setAttribute("banname",banname);
                                    out.print("<a  href=\"SetStatusBanServlet\">����</a>");
                                }else if (((new UserDao().getUserStatus(mb.getName()) == 0))){
                                    String activatedname  = mb.getName();
                                    session.setAttribute("activatedname",activatedname);
                                    out.print("<a  href=\"SetStatusActivatedServlet\">�������</a>");
                                } else {
                                    out.print("����״̬");
                                }
                            /*�������ͨ�û�������δ֪�û����������������*/
                            }else if((new UserDao().getUserRole(logUser.getName())) == 1){
                                out.print("Ȩ�޲���");
                            }else {
                                out.print("Ȩ�޲���");
                            }
                        %>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
        </form>
        <%
            if ((new UserDao().getUserStatus(logUser.getName())) == 1 || (new UserDao().getUserRole(logUser.getName())) == 0){
        %>
        <a style="margin-left: 22%" href="leavemessage.jsp">����</a>
        <%
            }else {
                out.print("�����ڻ����ܷ���");
            }
        %>
    </div>
</body>
</html>
