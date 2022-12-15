package dao.impl;

import bean.User;
import dao.UserDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    // TODO: 2022/12/7 用户增删改查

    /**
     * 用户的增加
     * @param user 用户实体类
     * @return int 影响的行数
     * @throws Exception
     */
    @Override
    public int add(User user) throws Exception {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "insert into user (name,password,register_date,role) values(?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            Date date = new Date();
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3,user.getRegisterTime());
            pstmt.setString(4,user.getRole());
            result = pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt,rs);
        }
        return result;
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

    /**
     * 根据用户名和密码，匹配查询数据库是否有此用户
     * @param username 用户名
     * @param password 密码
     * @return boolean
     * @throws Exception
     */
    @Override
    public boolean findUser(String username, String password) throws Exception {
        boolean flag = false;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select * from user where name=? and password = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            rs = pstmt.executeQuery();
            if (rs.next()){
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt,rs);
        }
        return flag;
    }

}
