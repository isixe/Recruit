package service.impl;

import bean.Resume;
import dao.ResumeDao;
import dao.impl.ResumeDaoImpl;
import service.ResumeService;

import java.util.ArrayList;

public class ResumeServiceImpl implements ResumeService {
    private ResumeDao resumeDao = new ResumeDaoImpl();


    @Override
    public ArrayList<Resume> FindResume(String status) {
        return resumeDao.FindResume(status);

    }
    public Integer add(Resume resume) {
        return resumeDao.add(resume);
    }
    public boolean update(Resume resume){
        return  resumeDao.update((resume));
    }
    public boolean delete(int id){
        return  resumeDao.delete((id));
    }
    public Resume findByUserId(int id) {
        return resumeDao.findByUserId(id);
    }
}

