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

    public ArrayList<Job> findByCid(int company_id) throws Exception;

    public ArrayList<Job> findByPid(int position_id) throws Exception;

    public List<Job> findByNameAndCompanyId(String name,int cid) throws Exception;
}
