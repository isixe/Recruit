package service;

import bean.Resume;

import java.util.ArrayList;

public interface ResumeService {

    public ArrayList<Resume> FindResume(String status);

}
