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


    // TODO: 2022/12/15 简历增删改查

    //简历添加功能
    public Integer add(Resume resume) {
        ConnectionUtils utils = new ConnectionUtils();
        int result = 0;
        try {
            conn = utils.getConn();
            sql = "insert into resume (id,name,phone,email) values(?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, resume.getId());
            pstmt.setString(2, resume.getName());
            pstmt.setString(3, resume.getPhone());
            pstmt.setString(4, resume.getEmail());
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt, rs);
        }
        return result;

    }
//简历查询功能(通过状态)

    public ArrayList<Resume> FindResume(String status) {
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "select * from resume where status = ?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句
            pstmt.setString(1, status); //设置sql语句的值
            rs = pstmt.executeQuery();//执行查询
            resumes.clear();//清除上一次查询
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



    //简历修改功能
    public Integer update(Resume resume) {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "update resume set name = ?,email = ?,age = ?,phone =?,school = ?,education = ?, where id =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, resume.getName());
            pstmt.setString(2, resume.getEmail());
            pstmt.setString(3, resume.getSchool());
            pstmt.setString(4, resume.getPhone());
            pstmt.setString(5, resume.getEducation());
            pstmt.setInt(6, resume.getId());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    //简历删除功能
    public Integer delete(int id) {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "delete from resume where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }
    //根据ID查找简历
    public ArrayList<Resume> findById(int id)  {
        Resume resume = new Resume();
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "select * from resume where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Integer.toString(id));
            rs = pstmt.executeQuery();
            resumes.clear();
            while (rs.next()) {
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
            System.out.println(resume.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return resumes;
    }
}





