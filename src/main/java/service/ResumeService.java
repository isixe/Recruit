package service;

import bean.Page;
import bean.Resume;

import java.util.ArrayList;

public interface ResumeService {



    public ArrayList<Resume> FindResume(String status);//查询简历状态

    public Integer add(Resume resume);

    public  boolean update(Resume resume);

    public  boolean delete(int id);

    public Resume findByUserId(int id);

    Page<Resume> findResumeByPage(int currentPage, int rows, String status);
}
