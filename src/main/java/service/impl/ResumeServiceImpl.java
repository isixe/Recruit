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


}

