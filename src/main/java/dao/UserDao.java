package dao;

import bean.User;

import java.util.List;

public interface UserDao {
    public Integer add(User user) throws Exception;;

    public Integer delete(int id) throws Exception;;

    public Integer update(User user) throws Exception;

    public Integer setPassword(int id, String passwoed) throws Exception;

    public User findById(int id) throws Exception;

    public List<User> findByName(String name) throws Exception;

    public Integer findUserId(String username, String password) throws Exception;

    public Integer addUser(User user) throws Exception;
}
