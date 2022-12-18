package dao.impl;

import bean.Job;
import bean.User;
import dao.JobDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class JobDaoImpl implements JobDao {
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    private ArrayList<Job> jobs = new ArrayList<>();

    // TODO: 2022/12/15 工作招聘增删改

    @Override
    public Integer add(Job job){
        ConnectionUtils utils = new ConnectionUtils();
        sql = "insert into job(id,company_id,position_id,area,time,contact,maxsalary,minsalary,job_requirements,job_require,welfare)values(?,?,?,?,?,?,?,?,?,?,?)";
        int result=0;
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "insert into job(id,company_id,position_id,area,time,contact,maxsalary,minsalary,job_requirements,job_require,welfare)values(?,?,?,?,?,?,?,?,?,?,?)";
            
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.

            rs = pstmt.executeQuery();//执行查询
            pstmt.setInt(1,job.getId());
            pstmt.setInt(2,job.getCompany_id());
            pstmt.setInt(3,job.getPosition_id());
            pstmt.setString(4,job.getArea());
            pstmt.setString(5,job.getTime());
            pstmt.setString(6,job.getContact());
            pstmt.setDouble(7,job.getMaxsalary());
            pstmt.setDouble(8,job.getMinsalary());
            pstmt.setString(9,job.getJob_requirements());
            pstmt.setString(10,job.getJob_require());
            pstmt.setString(11,job.getWelfare());
            result=pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int delete(int id) throws Exception {
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

    //工作查询
    @Override
    public ArrayList<Job> findJob(int id) {
        ConnectionUtils utils = new ConnectionUtils();

        try {
            conn = utils.getConn(); //获取数据库连接

            //查询job 根据id
            sql = "select * from job where id = ?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句
            pstmt.setInt(1, id); //设置sql语句的值
            rs = pstmt.executeQuery();//执行查询
            jobs.clear();//清楚上一次查询

            while (rs.next()) {
                Job job = new Job();
                job.setId(rs.getInt("id"));
                job.setCompany_id(rs.getInt("company_id"));
                job.setPosition_id(rs.getInt("position_id"));
                job.setArea(rs.getString("area"));
                job.setTime(rs.getString("time"));
                job.setContact(rs.getString("contact"));
                job.setMaxsalary(rs.getDouble("maxsalary"));
                job.setMinsalary(rs.getDouble("minsalary"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setJob_require(rs.getString("job_require"));
                job.setWelfare(rs.getString("welfare"));
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();          //错误抓取异常
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return jobs;
    }

}
