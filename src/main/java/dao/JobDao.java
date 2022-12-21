package dao;

import bean.Job;
import bean.User;

import java.util.ArrayList;
import java.util.List;

public interface JobDao {
    public Integer add(Job job) ;

    public Integer delete(Integer id);

    public Integer update(Job job) ;

    public Job findById(int id) throws Exception;

    public List<Job> findByName(String name) throws Exception;
    //根据公司id查询job
    public ArrayList<Job> findByCid(int company_id);
    //根据职业id查询job
    public ArrayList<Job> findByPid(int position_id);
    //查询所有job
    //public List<Job> findAllJob(Job job);
}
