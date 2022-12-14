package service;

import bean.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;

import java.util.List;

public class UserService {
    public boolean login(String username, String password){
        boolean flag = true;
        try {
            UserDao userDao = new UserDaoImpl();
            flag= userDao.findUser(username,password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean register(String username, String password){
        boolean flag = true;
        try {
            UserDao userDao = new UserDaoImpl();
            List<User> users = userDao.findByName(username);
            User user = new User();
            user.s
//            int result = userDao.add(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
