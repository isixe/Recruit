package service.impl;

import bean.Job;
import dao.JobDao;
import dao.impl.JobDaoImpl;
import service.JobService;

import java.util.ArrayList;
import java.util.List;

public class JobServiceImpl implements JobService {
    private JobDao jobDao = (JobDao) new JobDaoImpl();

    @Override
    public Job findById(int jobid) throws Exception {
        return jobDao.findById(jobid);
    }

    @Override
    public ArrayList<Job> findByCid(int company_id) throws Exception {
        return jobDao.findByCid(company_id);
    }

    @Override
    public ArrayList<Job> findByPid(int position_id) throws Exception {
        return jobDao.findByPid(position_id);
    }

    @Override
    public Integer delete(Integer id) {
        return jobDao.delete(id);
    }

    @Override
    public Integer updateJob(Job job) {
        return jobDao.update(job);
    }

    @Override
    public List<Job> findByNameAndCid(String keyword, int cid) throws Exception {
        return jobDao.findByNameAndCompanyId(keyword, cid);
    }

    @Override
    public List<Job> findByName(String title) throws Exception {
        return jobDao.findByName(title);
    }

    @Override
    public Integer addJob(Job job) {
        return jobDao.add(job);
    }
}
