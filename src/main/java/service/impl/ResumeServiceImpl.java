package service.impl;

import bean.Page;
import bean.Resume;
import dao.ResumeDao;
import dao.impl.ResumeDaoImpl;
import service.ResumeService;

import java.util.ArrayList;
import java.util.List;

public class ResumeServiceImpl implements ResumeService {
    private ResumeDao resumeDao = new ResumeDaoImpl();


    @Override
    public ArrayList<Resume> FindResume(String status) {
        return resumeDao.FindResume(status);

    }

    public Integer add(Resume resume) {
        return resumeDao.add(resume);
    }

    public boolean update(Resume resume) {
        return resumeDao.update((resume));
    }

    public boolean delete(int id) {
        return resumeDao.delete((id));
    }

    public Resume findByUserId(int id) {
        return resumeDao.findByUserId(id);
    }

    @Override
    public Page<Resume> findResumeByPage(int currentPage, int rows, String status) {
        //实例化一个Page对象, 之后返回给Servlet层
        Page<Resume> page = new Page<>();
        //将Servlet层传过来的currentPage(当前页码)赋值给page的currentPage属性
        page.setCurrentPage(currentPage);

        //调用findTotalCount方法来获取所有订单的数量
        int totalCount = resumeDao.findTotalCount(status);
        //设置page的总记录数属性
        page.setTotalCount(totalCount);
        //从第几条记录开始 假设请求的是第三页,一页显示5条记录, 所以start就为15,也就是稍后从数据库中的第15条开始查询5条记录
        int start = (currentPage - 1) * rows;
        //调用findByPage查找从第start条开始的rows条订单信息
        List<Resume> Resumes = resumeDao.findByPage(start, rows, status);
        //将返回的订单信息存储到page中的list集合中
        page.setList(Resumes);

        //总页数 = 所有的记录数/一页显示的行数,  除的尽就是刚好能显示完所有, 除不尽就多加一页显示
        int totalPage = (totalCount % rows) == 0 ? totalCount / rows : (totalCount / rows) + 1;
        //设置page的总页数属性
        page.setTotalPage(totalPage);

        return page;
    }
}

