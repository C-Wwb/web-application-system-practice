package com.wwb.connection;

import java.sql.*;

public class connection {
    public static void connect() throws ClassNotFoundException, IllegalAccessException, InstantiationException, SQLException {
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/stu?serverTimezone=Asia/Shanghai";
        String user = "wwb";
        String password = "123456";
        String driverName = "com.mysql.jdbc.Driver";
        Class clazz = Class.forName(driverName);
        Driver driver = (Driver) clazz.newInstance();
        DriverManager.registerDriver(driver);
        conn = DriverManager.getConnection(url, user, password);
        System.out.println(conn);
    }
}
