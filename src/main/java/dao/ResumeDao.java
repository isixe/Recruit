package dao;

import bean.Resume;
import bean.User;

public interface ResumeDao {
    public int add(Resume resume) throws Exception;;

    public int delete(int id) throws Exception;;

    public int update(Resume resume) throws Exception;

    public User findById(int id) throws Exception;

    public User findByName(String name) throws Exception;
}
