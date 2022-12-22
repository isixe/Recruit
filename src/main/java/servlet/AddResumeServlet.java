package servlet;

import bean.Resume;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ResumeService;
import service.impl.ResumeServiceImpl;

import java.io.IOException;

@WebServlet("/AddResumeServlet")
public class AddResumeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Resume resume=new Resume();
        resume.setId(Integer.parseInt(req.getParameter("id")));
        resume.setName(req.getParameter("name"));
        resume.setCity(req.getParameter("city"));
        resume.setYear(req.getParameter("year"));
        resume.setDatetime(req.getParameter("datetime"));
        resume.setEducation(req.getParameter("education"));
        resume.setEmail(req.getParameter("email"));
        resume.setSchool(req.getParameter("school"));
        resume.setSex(req.getParameter("sex"));
        resume.setStatus(req.getParameter("status"));
        resume.setPicture(req.getParameter("picture"));
        resume.setPhone(req.getParameter("phone"));
        System.out.println(resume);
        ResumeService resumeService = new ResumeServiceImpl();
        Integer count =resumeService.add(resume);
        if(count > 0){
            System.out.println("添加简历成功！");
        }else{
            System.out.println("添加简历失败...");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}