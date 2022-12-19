package service;

import bean.User;

public interface UserService {
    public Integer login(String username, String password);

    public boolean register(User user);
}
