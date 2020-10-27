package com.wwb.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcDelete {
    public static void main(String[] args) {
        //private static final String URL="jdbc:mysql://localhost:3306/数据库名";//jdbc:mysql//服务器地址/数据库名
        //private static final String USER="用户名";//用户名
        //private static final String PASSWORD="密码";//密码
        try {
            //1.加载驱动程序
            //此语句固定，使用MySQL数据库无需更改，在JSP中可不加异常处理
            Class.forName("com.mysql.jdbc.Driver");
            //2.获取数据库的连接
            //此语句只需更改端口、数据库名称、用户名及密码，使用MySQL数据库格式固定，在JSP中可不加异常处理
            //可以在括号内使用上述注释的URL、USER、PASSWORD
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?serverTimezone=Asia/Shanghai","wwb","123456");
            //3.通过数据库的连接操作数据库，实现新增数据
            Statement sql = con.createStatement();
            String new_member="delete from stu where userId=3";
            //id=6或user='qjh'
            sql.executeUpdate(new_member);
            con.close();
        }
        catch(SQLException | ClassNotFoundException E) {
            System.out.println("SQL异常！！！！");
        }
    }
}
