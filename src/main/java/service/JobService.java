package service;

import bean.Job;

import java.util.ArrayList;

public interface JobService {
    public ArrayList<Job> findJob(int id);
}
