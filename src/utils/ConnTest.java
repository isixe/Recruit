package utils;

import dao.UserDao;
import java.sql.Connection;
import java.sql.SQLException;

//测试数据库连接
public class ConnTest {
    public static void main(String[] args) throws SQLException {
        ConnectionUtils util = new ConnectionUtils();
        Connection conn = util.getConn();
        System.out.println(conn);

        UserDao userDao = new UserDao();
        System.out.println(userDao.login("user","123456"));
    }
}
