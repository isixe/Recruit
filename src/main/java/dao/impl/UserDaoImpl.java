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
    private ConnectionUtils utils;
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;


    /**
     * 用户的增加
     * ===================================================================
     *
     * @param user 用户实体类
     * @return int 影响的行数
     * @throws Exception
     */
    @Override
    public Integer add(User user) throws Exception {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "insert into user (name,password,register_date,role) values(?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            Date date = new Date();
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRegisterTime());
            pstmt.setString(4, user.getRole());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 用户账户删除
     * ===================================================================
     *
     * @param id
     * @return Integer
     * @throws Exception
     */
    @Override
    public Integer delete(int id) throws Exception {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "delete from user where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            Date date = new Date();
            pstmt.setInt(1, id);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 用户资料的修改
     * ===================================================================
     *
     * @param user
     * @return Ineger
     * @throws Exception
     */
    @Override
    public Integer update(User user) throws Exception {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "update user set name = ?,sex = ?,age = ?,phone =?,email = ? where id =?";
        try {
            pstmt = conn.prepareStatement(sql);
            Date date = new Date();
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getSex());
            pstmt.setInt(3, user.getAge());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getEmail());
            pstmt.setInt(6, user.getId());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 用户密码修改
     * ===================================================================
     *
     * @param id
     * @param password
     * @return Integer
     * @throws Exception
     */
    @Override
    public Integer setPassword(int id, String password) throws Exception {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "update user set password = ? where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setInt(2, id);
            result = pstmt.executeUpdate();
            System.out.println(pstmt.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 根据id查找用户
     * ===================================================================
     *
     * @param id
     * @return User
     * @throws Exception
     */
    @Override
    public User findById(int id) throws Exception {
        User user = new User();
        utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select * from user where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Integer.toString(id));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setAvatars(rs.getString(4));
                user.setSex(rs.getString(5));
                user.setAge(rs.getInt(6));
                user.setPhone(rs.getString(7));
                user.setEmail(rs.getString(8));
                user.setRegisterTime(rs.getString(9));
                user.setRole(rs.getString(10));
            }
            System.out.println("======================");
            System.out.println(user.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return user;
    }

    @Override
    public List<User> findByName(String name) throws Exception {
        utils = new ConnectionUtils();
        return null;
    }

    /**
     * 根据用户名和密码，匹配查询数据库是否有此用户
     * ===================================================================
     *
     * @param username 用户名
     * @param password 密码
     * @return boolean
     * @throws Exception
     */
    @Override
    public Integer findUserId(String username, String password) throws Exception {
        int id = 0;
        utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select id from user where name = ? and password = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return id;
    }

}
