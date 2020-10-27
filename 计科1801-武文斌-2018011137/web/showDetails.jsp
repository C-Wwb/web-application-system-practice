<%--
  Created by IntelliJ IDEA.
  User: wwb
  Date: 2020/10/7
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wwb.connection.jdbcAdd" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>
<form name = "qd" onsubmit="return check()" action="text.jsp">
<%
    request.setCharacterEncoding("utf-8");
    String name=request.getParameter("userName");//用户名
    String pwd=request.getParameter("userPassword");//用户密码
    String year=request.getParameter("select2");//用户生日
    String month=request.getParameter("select3");//用户生日
    String day=request.getParameter("select4");//用户生日
    String xue=request.getParameter("bloodType");//用户血型
    String area=request.getParameter("address");//用户所在地
    String email=request.getParameter("email");//邮件地址

    //jdbcAdd ja = new jdbcAdd(name, pwd, year, month, day, xue, area, email);
    jdbcAdd ja = new jdbcAdd();
    ja.setUserName(name);
    ja.setUserPassword(pwd);
    ja.setYear(year);
    ja.setMonth(month);
    ja.setDay(day);
    ja.setUserBloodType(xue);
    ja.setUserAddress(area);
    ja.setUserEmail(email);
    ja.add();

%>
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
<hr size="5px" align="center" color="red" width="100%"/>
    <input type="button" value="数据库查询" onclick='document.qd.submit()' />
    <input type="button" value="人员信息修改" onclick='window.open("modify.jsp")' />
    <input type="button" value="人员信息删除" onclick='window.open("delete.jsp")' />
        </form>
    </body>
</html>
<%!
%>