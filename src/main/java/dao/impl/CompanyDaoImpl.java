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
        return 0;
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
                company.setContact(rs.getInt("contact"));
                company.setDesc(rs.getString("desc"));
                company.setBuildTime(rs.getDate("buildTime"));
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
