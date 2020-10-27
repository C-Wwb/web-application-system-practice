        <%@ page import="com.wwb.connection.jdbcQuery" %>
<%@ page import="java.sql.PreparedStatement" %>
        <%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Wwb
  Date: 2020/10/18
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据库查询</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("userName");//用户名
    String pwd = request.getParameter("userPassword");//用户密码
    String year = request.getParameter("select2");//用户生日
    String month = request.getParameter("select3");//用户生日
    String day = request.getParameter("select4");//用户生日
    String xue = request.getParameter("bloodType");//用户血型
    String area = request.getParameter("address");//用户所在地
    String email = request.getParameter("email");//邮件地址

    jdbcQuery jq = new jdbcQuery();
    jq.setUserName(name);
    jq.query();
%>你要查询的数据库中共有
<hr size="5px" align="center" color="red" width="100%"/>
<table align="center">
    <tr><td colspan="3" align="center" height="40">个人信息</td></tr>
    <tr><td>用户名：</td><td><%=name%></td></tr>
    <tr><td>用户密码：</td><td><%=pwd%></td></tr>
    <tr><td>用户生日：</td><td><%=year + "年" + month + "月" + day + "日"%></td></tr>
    <tr><td>用户血型：</td><td><%=xue%></td></tr>
    <tr><td>用户所在地：</td><td><%=area%></td></tr>
    <tr><td>邮箱：</td><td><%=email%></td></tr>
</table>
</center>
</body>
</html>