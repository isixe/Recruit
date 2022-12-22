package dao.impl;

import bean.Job;
import bean.Record;
import dao.RecordDao;
import utils.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RecordDaoImpl implements RecordDao {
    private ConnectionUtils utils;
    private ResultSet rs;
    private Connection conn = null;
    private String sql;
    private PreparedStatement pstmt;

    @Override
    public Integer add(Record record) {
        return null;
    }

    @Override
    public Integer delete(Integer id) throws SQLException {
        int result = 0;
        ConnectionUtils utils = new ConnectionUtils();
        conn = utils.getConn();
        sql = "delete from record where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            Date date = new Date();
            pstmt.setInt(1, id);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return result;
    }

    @Override
    public Integer update(Record record) {
        return null;
    }

    @Override
    public Job findById(int id) throws Exception {
        return null;
    }

    @Override
    public List<Record> findByName(String name) throws Exception {
        utils = new ConnectionUtils();
        conn = utils.getConn();
        List<Record> list = new ArrayList<>();
        String str = "'%" + name + "%'";
        sql = "select * from record where rid like " + str+" or cid like " + str+" or uid like "+ str;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Record record = new Record();
                    record.setId(rs.getInt(1));
                    record.setCid(rs.getInt("cid"));
                    record.setRid(rs.getInt("rid"));
                    record.setTime(rs.getDate("time"));
                    record.setUid(rs.getInt("uid"));
                    list.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            utils.closeAll(pstmt, rs);
        }
        return list;
    }
}
