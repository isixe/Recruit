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
import java.util.ArrayList;

@WebServlet("/FindJobByCidServlet")
public class FindJobByCidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            JobService jobService = new JobServiceImpl();
            int company_id = Integer.parseInt(req.getParameter("company_id"));
            ArrayList<Job> jobs = jobService.findByCid(company_id);
            System.out.println(jobs);
            req.setAttribute("jobs", jobs);
            req.getRequestDispatcher("pages/findJob.jsp").forward(req, resp);
        }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
