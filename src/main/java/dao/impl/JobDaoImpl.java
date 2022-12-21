package dao.impl;

import bean.Job;
import dao.JobDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: tiantong007
 * Status: 已完成
 */
public class JobDaoImpl implements JobDao {
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;
    private ConnectionUtils utils;
    private ArrayList<Job> jobs = new ArrayList<>();

    /**
     * 工作的增加
     * ===================================================================
     *
     * @param job
     * @return Integer
     */
    @Override
    public Integer add(Job job) {
        utils = new ConnectionUtils();
        int result = 0;
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "insert into job(company_id,position_id,area,time,contact,salary,job_requirements,job_require,welfare,title)values(?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.
            pstmt.setInt(1, job.getCompany_id());
            pstmt.setInt(2, job.getPosition_id());
            pstmt.setString(3, job.getArea());
            pstmt.setString(4, job.getTime());
            pstmt.setString(5, job.getContact());
            pstmt.setString(6, job.getSalary());
            pstmt.setString(7, job.getJob_requirements());
            pstmt.setString(8, job.getJob_require());
            pstmt.setString(9, job.getWelfare());
            pstmt.setString(10,job.getTitle());
            result = pstmt.executeUpdate();//执行查询

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt, rs);
        }
        if (result > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    /**
     * 工作的删除
     * ===================================================================
     *
     * @param id
     * @return Integer
     */
    @Override
    public Integer delete(Integer id) {
        int result = 0;
        utils = new ConnectionUtils();
        sql = "delete from job where id=?";
        try{
            conn=utils.getConn();//获取数据库连接
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.
            pstmt.setInt(1, id); //设置sql语句的值
            result = pstmt.executeUpdate();//执行查询
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 工作的更新
     * ===================================================================
     *
     * @param job
     * @return Integer
     */
    @Override
    public Integer update(Job job)  {
        utils = new ConnectionUtils();
        int result = 0; 
        try {
            conn = utils.getConn(); //获取数据库连接
            sql = "update job set area=?,contact=?,salary=?,job_requirements=?,job_require=?,welfare=?,title=? where id=?";
            pstmt = conn.prepareStatement(sql);   //定义预编译sql语句.

            pstmt.setString(1, job.getArea());
            pstmt.setString(2, job.getContact());
            pstmt.setString(3, job.getSalary());
            pstmt.setString(4, job.getJob_requirements());
            pstmt.setString(5, job.getJob_require());
            pstmt.setString(6, job.getWelfare());
            pstmt.setString(7, job.getTitle());
            pstmt.setInt(8,job.getId());
            result = pstmt.executeUpdate();//执行查询
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    /**
     * 根据id查询工作
     * ===================================================================
     *
     * @param id
     * @return Job
     * @throws Exception
     */
    @Override
    public Job findById(int id) throws Exception {
        Job job =new Job();
        utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "select * from job where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Integer.toString(id));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                job.setId(rs.getInt("id"));
                job.setJob_require(rs.getString("job_require"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setCompany_id(rs.getInt("company_id"));
                job.setPosition_id(rs.getInt("position_id"));
                job.setContact(rs.getString("contact"));
                job.setSalary(rs.getString("salary"));
                job.setArea(rs.getString("area"));
                job.setTime(rs.getString("time"));
                job.setWelfare(rs.getString("welfare"));
                job.setTitle(rs.getString("title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return job;
    }

    /**
     * 工作的模糊查询
     * ===================================================================
     *
     * @param name
     * @return
     * @throws Exception
     */
    @Override
    public List<Job> findByName(String name) throws Exception {
        utils = new ConnectionUtils();
        conn = utils.getConn();
        String s = "'%"+name+"%'";
        List<Job> list = new ArrayList<>();
        sql = "select * from job where title like "+s;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Job job =new Job();
                job.setId(rs.getInt("id"));
                job.setJob_require(rs.getString("job_require"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setCompany_id(rs.getInt("company_id"));
                job.setPosition_id(rs.getInt("position_id"));
                job.setContact(rs.getString("contact"));
                job.setSalary(rs.getString("salary"));
                job.setArea(rs.getString("area"));
                job.setTime(rs.getString("time"));
                job.setWelfare(rs.getString("welfare"));
                job.setTitle(rs.getString("title"));
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return jobs;
    }

    /**
     * 工作的查询
     * ===================================================================
     *
     * @param name
     * @return List
     * @throws Exception
     */
    @Override
    public List<Job> findByNameAndCompanyId(String name,int cid) throws Exception {
        utils = new ConnectionUtils();
        conn = utils.getConn();
        String s = "'%"+name+"%'";
        List<Job> list = new ArrayList<>();
        sql = "select * from job where company_id = ? and title like "+s;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Job job =new Job();
                job.setId(rs.getInt("id"));
                job.setJob_require(rs.getString("job_require"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setCompany_id(rs.getInt("company_id"));
                job.setPosition_id(rs.getInt("position_id"));
                job.setContact(rs.getString("contact"));
                job.setSalary(rs.getString("salary"));
                job.setArea(rs.getString("area"));
                job.setTime(rs.getString("time"));
                job.setWelfare(rs.getString("welfare"));
                job.setTitle(rs.getString("title"));
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return jobs;
    }

    /**
     * 根据公司id查找所有工作
     * ===================================================================
     *
      * @param company_id
     * @return ArrayList
     */
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
                job.setSalary(rs.getString("salary"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setJob_require(rs.getString("job_require"));
                job.setWelfare(rs.getString("welfare"));
                job.setTitle(rs.getString("title"));
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
                job.setSalary(rs.getString("salary"));
                job.setJob_requirements(rs.getString("job_requirements"));
                job.setJob_require(rs.getString("job_require"));
                job.setWelfare(rs.getString("welfare"));
                job.setTitle(rs.getString("title"));
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
