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
    public Integer add(Job job) {
        ConnectionUtils utils = new ConnectionUtils();
        int rs = 0;
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "insert into job(id,company_id,position_id,area,time,contact,maxsalary,minsalary,job_requirements,job_require,welfare)values(?,?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.
            pstmt.setInt(1, job.getId());
            pstmt.setInt(2, job.getCompany_id());
            pstmt.setInt(3, job.getPosition_id());
            pstmt.setString(4, job.getArea());
            pstmt.setString(5, job.getTime());
            pstmt.setString(6, job.getContact());
            pstmt.setDouble(7, job.getMaxsalary());
            pstmt.setDouble(8, job.getMinsalary());
            pstmt.setString(9, job.getJob_requirements());
            pstmt.setString(10, job.getJob_require());
            pstmt.setString(11, job.getWelfare());
            rs = pstmt.executeUpdate();//执行查询

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (rs > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public Integer delete(Integer id) {
        ConnectionUtils utils = new ConnectionUtils();
        sql = "delete from job where id=?";
        try{
            conn=utils.getConn();//获取数据库连接
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.
            pstmt.setInt(1, id); //设置sql语句的值
            pstmt.executeUpdate();//执行查询
            return 1;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return -1;
    }



    @Override
    public Integer update(Job job)  {
        ConnectionUtils utils = new ConnectionUtils();
        int rs = 0;
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "update job set company_id=?,position_id=?,area=?,time=?,contact=?,maxsalary=?,minsalary=?,job_requirements=?,job_require=?,welfare=? where id=?";

            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.

            pstmt.setInt(1, job.getCompany_id());
            pstmt.setInt(2, job.getPosition_id());
            pstmt.setString(3, job.getArea());
            pstmt.setString(4, job.getTime());
            pstmt.setString(5, job.getContact());
            pstmt.setDouble(6, job.getMaxsalary());
            pstmt.setDouble(7, job.getMinsalary());
            pstmt.setString(8, job.getJob_requirements());
            pstmt.setString(9, job.getJob_require());
            pstmt.setString(10, job.getWelfare());
            rs = pstmt.executeUpdate();//执行查询

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (rs > 0) {
            System.out.println("更新成功");
            return 1;
        } else {
            System.out.println("更新失败");
            return 0;
        }
    }

    @Override
    public User findById(int id) throws Exception {
        return null;
    }

    @Override
    public User findByName(String name) throws Exception {
        return null;
    }

    //根据公司id查询job
    @Override
    public ArrayList<Job> findByCid(int company_id) {
        ConnectionUtils utils = new ConnectionUtils();

        try {
            conn = utils.getConn(); //获取数据库连接

            //查询job 根据公司id
            sql = "select * from job where company_id = ?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句
            pstmt.setInt(1, company_id); //设置sql语句的值
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

    //根据职位id查询job
    @Override
    public ArrayList<Job> findByPid(int position_id) {
        ConnectionUtils utils = new ConnectionUtils();

        try {
            conn = utils.getConn(); //获取数据库连接

            //查询job 根据职位id
            sql = "select * from job where position_id = ?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句
            pstmt.setInt(1, position_id); //设置sql语句的值
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
