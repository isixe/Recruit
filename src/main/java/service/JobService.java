package service;

import bean.Job;

import java.util.ArrayList;

public interface JobService {
    public ArrayList<Job> findByCid(int company_id);
    public ArrayList<Job> findByPid(int position_id);

    public Integer addJob(Job job);
}
