package service;

import bean.Job;

import java.util.ArrayList;
import java.util.List;

public interface JobService {
    public Job findById(int jobid) throws Exception;
    public ArrayList<Job> findByCid(int company_id) throws Exception;
    public ArrayList<Job> findByPid(int position_id) throws Exception;
    public Integer delete(Integer id);
    public Integer addJob(Job job);
    public Integer updateJob(Job job);
    public List<Job> findByNameAndCid(String keyword,int cid) throws Exception;
    public List<Job> findByName(String title) throws Exception;
}
