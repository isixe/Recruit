package dao;

import utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao{
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    // TODO: 2022/12/7 增加用户Session全局登录验证 
    public Boolean login(String username,String password) throws SQLException {
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

    // TODO: 2022/12/7 用户增删改查
}
