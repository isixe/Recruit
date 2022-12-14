package dao.impl;

import bean.Resume;
import bean.User;
import dao.ResumeDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ResumeDaoImpl implements ResumeDao {
    private ResultSet rs;
    private final Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    /**
     * 简历增删改
     */
    @Override
    public int add(Resume resume) throws Exception {
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
        return 0;
    }

    @Override
    public int insert(Resume resume) throws Exception {
        return 0;
    }

    @Override
    public int update(Resume resume) throws Exception {
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
