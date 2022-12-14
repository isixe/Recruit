package dao.impl;

import bean.Job;
import bean.User;
import dao.JobDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JobDaoImpl implements JobDao {
    private ResultSet rs;
    private final Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    /**
     * 工作招聘增删改
     */
    @Override
    public int add(Job job) throws Exception {
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
        return 0;
    }

    @Override
    public int insert(Job job) throws Exception {
        return 0;
    }

    @Override
    public int update(Job job) throws Exception {
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
