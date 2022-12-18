package service.Impl;

import bean.Job;
import dao.JobDao;
import dao.impl.JobDaoImpl;
import service.JobService;

import java.util.ArrayList;

public class JobServiceImpl implements JobService {
    private JobDao jobDao = new JobDaoImpl();

    @Override
    public ArrayList<Job> findJob(int id) {
        return jobDao.findJob(id);
    }
}
