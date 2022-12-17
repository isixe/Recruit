package dao;

import bean.Job;
import bean.User;

import java.util.List;

public interface JobDao {
    public int add(Job job) throws Exception;;

    public int delete(int id) throws Exception;;

    public int update(Job job) throws Exception;

    public User findById(int id) throws Exception;

    public User findByName(String name) throws Exception;

    public List<Job> list(Job job);
}
