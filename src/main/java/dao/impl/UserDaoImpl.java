package dao.impl;

import bean.User;
import dao.UserDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    // TODO: 2022/12/7 增加用户Session全局登录验证
    // TODO: 2022/12/7 用户增删改查
    @Override
    public int add(User user) throws Exception {
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
        return 0;
    }

    @Override
    public int insert(User user) throws Exception {
        return 0;
    }

    @Override
    public int update(User user) throws Exception {
        return 0;
    }

    @Override
    public User findById(int id) throws Exception {
        return null;
    }

    @Override
    public List<User> findByName(String name) throws Exception {
        return null;
    }

    @Override
    public boolean findUser(String username, String password) throws Exception {
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select * from user where name=? and password = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            rs = pstmt.executeQuery();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rs.next();
    }

}
