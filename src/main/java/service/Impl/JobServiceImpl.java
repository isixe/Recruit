package service.Impl;

import bean.Job;
import dao.JobDao;
import dao.impl.JobDaoImpl;
import service.JobService;

import java.util.ArrayList;

public class JobServiceImpl implements JobService {
    private JobDao jobDao = new JobDaoImpl();

    @Override
    public ArrayList<Job> findByCid(int company_id) {
        return jobDao.findByCid(company_id);
    }

    @Override
    public Integer addJob(Job job) {
        return jobDao.add(job);
    }
}
