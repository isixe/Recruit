package service;

import bean.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;

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
            User user = new User();
            int result = userDao.add(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
