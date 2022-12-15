import dao.impl.UserDaoImpl;
import utils.ConnectionUtils;

import java.sql.Connection;

//测试数据库连接
public class ConnTest {
    public static void main(String[] args) throws Exception {
        ConnectionUtils util = new ConnectionUtils();
        Connection conn = util.getConn();
        System.out.println(conn);

        UserDaoImpl userDao = new UserDaoImpl();
        System.out.println(userDao.findUserId("user","123456")>0);
    }
}
