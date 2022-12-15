package service;

import bean.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;

import java.util.List;

public class UserService {

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public Integer login(String username, String password) {
        int id = 0;
        try {
            UserDao userDao = new UserDaoImpl();
            id = userDao.findUserId(username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    /**
     * 用户注册
     * @param user 用户实体类
     * @return
     */
    public boolean register(User user) {
        int result = -1;
        try {
            UserDao userDao = new UserDaoImpl();
            result = userDao.add(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result>0;
    }

}
