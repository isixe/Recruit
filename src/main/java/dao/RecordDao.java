package dao;

import bean.Job;
import bean.Record;

import java.sql.SQLException;
import java.util.List;

public interface RecordDao {
    public Integer add(Record record) ;

    public Integer delete(Integer id) throws SQLException;

    public Integer update(Record record) ;

    public Job findById(int id) throws Exception;

    public List<Record> findByName(String name) throws Exception;
}
