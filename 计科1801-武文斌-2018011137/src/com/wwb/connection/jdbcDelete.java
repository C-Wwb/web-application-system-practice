package com.wwb.connection;

import java.sql.*;

public class jdbcDelete {
    String userName;
    public jdbcDelete(){}

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void delete(){
        Connection conn = null;
        try {
            String url = "jdbc:mysql://localhost:3306/stu?serverTimezone=Asia/Shanghai";
            String user = "wwb";
            String password = "123456";
            String driverName = "com.mysql.jdbc.Driver";
            Class clazz = Class.forName(driverName);
            Driver driver = (Driver) clazz.newInstance();
            DriverManager.registerDriver(driver);
            conn = DriverManager.getConnection(url, user, password);
            System.out.println(conn);

            String sql = "delete from information where userName = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userName);
            int n = pstmt.executeUpdate();
            if (pstmt!=null)
            {
                pstmt.close();
            }
            if (conn!=null)
            {
                conn.close();
            }
        } catch (Exception e) {
            System.out.println("错误");
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
    }
}
/*
1.数据库连接的4个基本要素
①JDBC URL用于标识一个被注册的驱动程序，驱动程序管理器通过这个URL选择正确的驱动程序，从而建立到数据库的连接；
jdbc：表示URL中的协议
mysql：子协议，用于标识mysql数据库驱动程序
localhost:本机的IP地址
3306：端口号
test：表示访问test数据库
user:登录数据库的用户名
password:用户名对应的密码，这些都是自己之前设定的
mySql的驱动：com.mysql.jdbc.Driver
2.实例化Driver
3.通过DriverManager来注册驱动
4.通过DriverManager的getConnection方法，获取Connection类的对象
5.打印出conn对象
处理结果
 */