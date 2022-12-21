package servlet;

import bean.Job;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.impl.JobServiceImpl;
import service.JobService;

import java.io.IOException;

@WebServlet("/addJobServlet")
public class addJobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Job job=new Job();
        job.setId(Integer.parseInt(req.getParameter("id")));
        job.setCompany_id(Integer.parseInt(req.getParameter("company_id")));
        job.setPosition_id(Integer.parseInt(req.getParameter("position_id")));
        job.setArea(req.getParameter("area"));
        job.setTime(req.getParameter("time"));
        job.setContact(req.getParameter("contact"));
        job.setSalary(req.getParameter("salary"));
        job.setJob_requirements(req.getParameter("job_requirements"));
        job.setJob_require(req.getParameter("job_require"));
        job.setWelfare(req.getParameter("welfare"));
        job.setTitle(req.getParameter("title"));
        System.out.println(job);
        JobService jobService = new JobServiceImpl();
        Integer count =jobService.addJob(job);
        if(count > 0){
            System.out.println("添加用户成功");
        }else{
            System.out.println("添加用户失败...");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
