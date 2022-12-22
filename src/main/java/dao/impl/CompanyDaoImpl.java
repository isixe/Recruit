package dao.impl;

import bean.Company;
import bean.User;
import dao.CompanyDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CompanyDaoImpl implements CompanyDao {
    private ConnectionUtils utils;
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    @Override
    public int add(Company company) throws Exception {
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
        return 0;
    }

    @Override
    public int update(Company company) throws Exception {
        utils = new ConnectionUtils();
        int result = 0;
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "update company set `name`=? ,`area`=?,`desc`=? where id=?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.

            pstmt.setString(1, company.getName());
            pstmt.setString(2,company.getArea());
            pstmt.setString(3,company.getDesc());
            pstmt.setInt(4,company.getId());
            System.out.println(pstmt.toString());

            result = pstmt.executeUpdate()          ;//执行查询
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    @Override
    public Company findById(int cid) throws Exception {
        return null;
    }

    /**
     * 根据公司负责人查找公司信息
     * ===================================================================
     *
     * @param uid
     * @return Company
     * @throws Exception
     */
    @Override
    public Company findByUserID(int uid) throws Exception {
        Company company = new Company();
        utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select * from company where uid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                company.setId(rs.getInt("id"));
                company.setName(rs.getString("name"));
                company.setArea(rs.getString("area"));
                company.setDesc(rs.getString("desc"));
                company.setUid(rs.getInt("uid"));
            }
//            System.out.println("======================");
//            System.out.println(user.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return company;
    }

    @Override
    public List<Company> findByName(String name) throws Exception {
        return null;
    }

    // TODO: 2022/12/15 公司增删改

}
