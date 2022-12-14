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

@WebServlet("/FindJobByPidServlet")
public class FindJobByPidServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JobService jobService = new JobServiceImpl();
        int position_id = Integer.parseInt(req.getParameter("position_id"));
        ArrayList<Job> jobs = null;
        try {
            jobs = jobService.findByPid(position_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(jobs);
        req.setAttribute("jobs", jobs);
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
