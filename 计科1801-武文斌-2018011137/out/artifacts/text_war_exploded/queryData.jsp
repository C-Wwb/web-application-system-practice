        <%@ page import="java.sql.*" %>
<%@ page import="javax.print.attribute.standard.PresentationDirection" %><%--
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

    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    try {
        //1.数据库连接的4个基本要素
        //①JDBC URL用于标识一个被注册的驱动程序，驱动程序管理器通过这个URL选择正确的驱动程序，从而建立到数据库的连接；
        //jdbc：表示URL中的协议
        //mysql：子协议，用于标识mysql数据库驱动程序
        //localhost:本机的IP地址
        //3306：端口号
        //test：表示访问test数据库
        String url = "jdbc:mysql://localhost:3306/stu?serverTimezone=Asia/Shanghai";
        //user:登录数据库的用户名
        String user = "wwb";
        //password:用户名对应的密码，这些都是自己之前设定的
        String password = "123456";
        //mySql的驱动：com.mysql.jdbc.Driver
        String driverName = "com.mysql.jdbc.Driver";

        //2.实例化Driver
        Class clazz = Class.forName(driverName);
        Driver driver = (Driver) clazz.newInstance();

        //3.通过DriverManager来注册驱动
        DriverManager.registerDriver(driver);
        //4.通过DriverManager的getConnection方法，获取Connection类的对象
        conn = DriverManager.getConnection(url, user, password);
        //5.打印出conn对象
        System.out.println(conn);
        Statement stmt = conn.createStatement();

        //处理结果
        String sql = "select * from information";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        rs.last();
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally {
        try {
            //当conn不为空时
            if (conn != null)
                //关闭conn资源
                conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
%>你要查询的数据库中共有
<hr size = "5" color = "red"><%=rs.getRow()%></hr>人
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
<%if (rs != null) {
    rs.close();
}
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
%>
</body>
</html>