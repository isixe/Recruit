package dao.impl;

import bean.Resume;
import dao.ResumeDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ResumeDaoImpl implements ResumeDao {
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    private ArrayList<Resume> resumes = new ArrayList<>();


    // TODO: 2022/12/15 简历增删改
    public ArrayList<Resume> FindResume(String status) {
        ConnectionUtils utils = new ConnectionUtils();


        try {
            conn = utils.getConn(); //获取数据库连接

            sql = "select * from resume where status = ?";

            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句

            pstmt.setString(1, status); //设置sql语句的值

            rs = pstmt.executeQuery();//执行查询

            resumes.clear();//清楚上一次查询

            while (rs.next()) {
                Resume resume = new Resume();
                resume.setId(rs.getInt("id"));
                resume.setName(rs.getString("name"));
                resume.setCity(rs.getString("city"));
                resume.setYear(rs.getString("year"));
                resume.setDatetime(rs.getString("datetime"));
                resume.setEducation(rs.getString("education"));
                resume.setMajor(rs.getString("major"));
                resume.setEmail(rs.getString("email"));
                resume.setSchool(rs.getString("school"));
                resume.setSex(rs.getString("sex"));
                resume.setStatus(rs.getString("status"));
                resume.setPhone(rs.getString("phone"));
                resume.setPicture(rs.getString("picture"));
                resumes.add(resume);
            }
        } catch (SQLException e) {
            e.printStackTrace();          //错误抓取异常
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return resumes;
    }
}




