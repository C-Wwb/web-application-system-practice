<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Wwb
  Date: 2020/10/18
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;
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
        Statement stmt=conn.createStatement();
        //执行sql语句，并返回结果
        ResultSet rs=stmt.executeQuery("select * from information");
        //处理结果
        while (rs.next()) {
            for (int i = 1; i <= 6; i++) {
                out.print(rs.getString(i) + "\t");
            }
            System.out.println();
        }
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } finally {
        try {
            //当conn不为空时
            if(conn != null)
                //关闭conn资源
                conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
%>
</body>
</html>
