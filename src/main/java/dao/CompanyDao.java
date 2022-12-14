package dao;

import bean.Company;
import bean.User;

public interface CompanyDao {
    public int add(Company company) throws Exception;;

    public int delete(int id) throws Exception;;

    public int insert(Company company) throws Exception;

    public int update(Company company) throws Exception;

    public User findById(int id) throws Exception;

    public User findByName(String name) throws Exception;
}
