package dao.impl;

import bean.Resume;
import dao.ResumeDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        int rs = 0;
        try {
            conn = utils.getConn();
            sql = "insert into resume (name,phone,email,sex,school,education,datetime,userid) values(?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, resume.getName());
            pstmt.setString(2, resume.getPhone());
            pstmt.setString(3, resume.getEmail());
            pstmt.setString(4,resume.getSex());
            pstmt.setString(5,resume.getSchool());
            pstmt.setString(6,resume.getEducation());
            pstmt.setString(7,resume.getDatetime());
            pstmt.setInt(9,resume.getUserid());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (rs > 0) {
            return 1;
        } else {
            return 0;
        }
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
                resume.setEmail(rs.getString("email"));
                resume.setSchool(rs.getString("school"));
                resume.setSex(rs.getString("sex"));
                resume.setStatus(rs.getString("status"));
                resume.setPhone(rs.getString("phone"));
                resume.setPicture(rs.getString("picture"));
                resume.setUserid(rs.getInt("userid"));
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
    public boolean update(Resume resume) {
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "update resume set name = ?, sex = ?, education = ?, school = ?, workexp = ?, email = ?, phone =?, hope = ?, projectexp = ? where userid =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, resume.getName());
            pstmt.setString(2, resume.getSex());
            pstmt.setString(3, resume.getEducation());
            pstmt.setString(4, resume.getSchool());
            pstmt.setString(5, resume.getWorkexp());
            pstmt.setString(6, resume.getEmail());
            pstmt.setString(7, resume.getPhone());
            pstmt.setString(8, resume.getHope());
            pstmt.setString(9, resume.getProjectexp());
            pstmt.setInt(10, resume.getUserid());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return false;
    }

    //简历删除功能
    public boolean delete(int id) {
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "delete from resume where userid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return false;
    }
    //根据ID查找简历
    public Resume findByUserId(int id)  {
        Resume resume = new Resume();
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "select * from resume where userid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                resume.setId(rs.getInt("id"));
                resume.setName(rs.getString("name"));
                resume.setCity(rs.getString("city"));
                resume.setYear(rs.getString("year"));
                resume.setDatetime(rs.getString("datetime"));
                resume.setEducation(rs.getString("education"));
                resume.setEmail(rs.getString("email"));
                resume.setSchool(rs.getString("school"));
                resume.setSex(rs.getString("sex"));
                resume.setStatus(rs.getString("status"));
                resume.setPhone(rs.getString("phone"));
                resume.setPicture(rs.getString("picture"));
                resume.setHope(rs.getString("hope"));
                resume.setWorkexp(rs.getString("workexp"));
                resume.setProjectexp(rs.getString("projectexp"));
                resume.setUserid(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return resume;
    }

    @Override
    public int findTotalCount(String status) {
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "select count(*) from resume where status = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            rs = pstmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return -1;
    }

    @Override
    public List<Resume> findByPage(int start, int rows, String status) {
        ConnectionUtils utils = new ConnectionUtils();
        try {
            conn = utils.getConn();
            sql = "select * from resume where status = ? limit ?, ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setInt(2, start);
            pstmt.setInt(3, rows);
            rs = pstmt.executeQuery();
            resumes.clear();
            while (rs.next()) {
                Resume resume = new Resume();
                resume.setId(rs.getInt("id"));
                resume.setName(rs.getString("name"));
                resume.setCity(rs.getString("city"));
                resume.setYear(rs.getString("year"));
                resume.setDatetime(rs.getString("datetime"));
                resume.setEducation(rs.getString("education"));
                resume.setEmail(rs.getString("email"));
                resume.setSchool(rs.getString("school"));
                resume.setSex(rs.getString("sex"));
                resume.setStatus(rs.getString("status"));
                resume.setPhone(rs.getString("phone"));
                resume.setPicture(rs.getString("picture"));
                resume.setUserid(rs.getInt("userid"));
                resumes.add(resume);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return resumes;
    }
}





