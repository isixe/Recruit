package utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.*;
import java.util.Properties;

/**
 * 工具类-数据库交互，已完成
 *
 * @author isixe
 * @description: 只用于调用，不需要修改
 */
public class ConnectionUtils {
    private static String url;
    private static String username;
    private static String password;
    private Connection conn = null;


    //初始化配置文件和装载数据库驱动
    static {
        Properties p = new Properties();
        String configFile = "config.properties";
        URL resource =ConnectionUtils.class.getClassLoader().getResource(configFile);
        try {
            InputStream is=new FileInputStream(resource.getPath());
            p.load(is);
            String driver = p.getProperty("driver");
            url = p.getProperty("url");
            username = p.getProperty("user");
            password = p.getProperty("password");
            Class.forName(driver);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    //建立数据库连接
    public Connection getConn() throws SQLException {
        conn = DriverManager.getConnection(url, username, password);
        return conn;
    }

    //关闭数据库连接
    public void closeAll(Statement stmt, ResultSet rs) {
        closeConnection();
        closeStatement(stmt);
        closeResultSet(rs);
    }

    public void closeConnection() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeStatement(Statement stmt) {
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeResultSet(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
