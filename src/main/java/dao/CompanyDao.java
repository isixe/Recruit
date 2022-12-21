package dao;

import bean.Company;
import bean.User;

import java.util.List;

public interface CompanyDao {
    public int add(Company company) throws Exception;;

    public int delete(int id) throws Exception;;

    public int update(Company company) throws Exception;

    public Company findById(int cid) throws Exception;

    public Company findByUserID(int uid) throws Exception;

    public List<Company> findByName(String name) throws Exception;
}
