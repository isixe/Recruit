package service;

import bean.Resume;

import java.util.ArrayList;

public interface ResumeService {



    public ArrayList<Resume> FindResume(String status);//查询简历状态

    public Integer add(Resume resume);

    public  Integer update(Resume resume);

    public  Integer delete(int id);

    public Resume findByUserId(int id);



}
