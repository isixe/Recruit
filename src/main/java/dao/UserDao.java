package dao;

import bean.User;

import java.util.List;

public interface UserDao {
    public int add(User user) throws Exception;;

    public int delete(int id) throws Exception;;

    public int insert(User user) throws Exception;

    public int update(User user) throws Exception;

    public User findById(int id) throws Exception;

    public List<User> findByName(String name) throws Exception;

    public boolean findUser(String username, String password) throws Exception;

}
