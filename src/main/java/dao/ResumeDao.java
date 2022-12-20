package dao;

import bean.Resume;

import java.util.ArrayList;

public interface ResumeDao {
           public ArrayList<Resume> FindResume(String status);//查询简历状态

          public Integer add(Resume resume);

          public  Integer update(Resume resume);

          public  Integer delete(int id);

      public ArrayList<Resume> findById(int id);



}
