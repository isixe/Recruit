package dao;

import bean.Job;
import bean.User;

import java.util.ArrayList;

public interface JobDao {
    public Integer add(Job job) ;;

    public int delete(int id) throws Exception;;

    public int update(Job job) throws Exception;

    public User findById(int id) throws Exception;

    public User findByName(String name) throws Exception;
    //查询职位信息
    public ArrayList<Job> findJob(int id);
}
