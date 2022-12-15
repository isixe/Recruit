package dao.impl;

import bean.Company;
import bean.User;
import dao.CompanyDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CompanyDaoImpl implements CompanyDao {
    private ResultSet rs;
    private final Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    // TODO: 2022/12/15 公司增删改

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
    public User findById(int id) throws Exception {
        return null;
    }

    @Override
    public User findByName(String name) throws Exception {
        return null;
    }
}
