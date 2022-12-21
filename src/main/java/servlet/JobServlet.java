package servlet;

import bean.Job;
import dao.JobDao;
import dao.impl.JobDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.JobService;
import service.impl.JobServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "JobServlet", value = "/job")
public class JobServlet extends HttpServlet {
    private int result = 0;
    private int id;
    private final Job job = new Job();
    private final JobDao jobDao = new JobDaoImpl();

    public JobServlet() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        JobService service = new JobServiceImpl();
        String action = request.getParameter("action");
        String sid = (String) request.getSession().getAttribute("userid");
        id = Integer.parseInt(sid);

        switch (action) {
            case "add":
                result = addJob(request);
                if (result > 0) {
                    response.getWriter().write("添加成功，正在跳转主页！");
                    response.setHeader("refresh", "1;url=index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('修改失败，请重新填写！'); window.location='pages/addJob.jsp' ;</script>");
                }
                break;
            case "update":
                result = updateJobData(request);
                if (result > 0) {
                    response.getWriter().write("修改成功，正在跳转主页！");
                    response.setHeader("refresh", "1;url=index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('修改失败，请重新填写！'); window.location='pages/updateJob.jsp' ;</script>");
                }
                break;
            case "delete":
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                result = jobDao.delete(jobid);
                if (result > 0) {
                    response.getWriter().write("删除成功，正在跳转主页！");
                    response.setHeader("refresh", "1;url=index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('修改失败，请重新输入...'); window.history.go(-1);</script>");
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public int addJob(HttpServletRequest req) {
        job.setCompany_id((Integer) req.getSession().getAttribute("cid"));
        job.setPosition_id(Integer.parseInt(req.getParameter("position")));
        job.setArea(req.getParameter("area"));
        job.setTime(req.getParameter("time"));
        job.setContact(req.getParameter("contact"));
        job.setSalary(req.getParameter("salary"));
        job.setJob_requirements(req.getParameter("requirement"));
        job.setJob_require(req.getParameter("require"));
        job.setWelfare(req.getParameter("welfalre"));
        job.setTitle(req.getParameter("title"));
        job.setTime(req.getParameter("time"));
        JobService jobService = new JobServiceImpl();
        result = jobService.addJob(job);
        return result;
    }

    public Integer updateJobData(HttpServletRequest req){
        job.setId(Integer.parseInt(req.getParameter("jobid")));
        job.setArea(req.getParameter("area"));
        job.setContact(req.getParameter("contact"));
        job.setSalary(req.getParameter("salary"));
        job.setJob_requirements(req.getParameter("requirement"));
        job.setJob_require(req.getParameter("require"));
        job.setWelfare(req.getParameter("welfalre"));
        job.setTitle(req.getParameter("title"));
        job.setTime(req.getParameter("time"));
        JobService jobService = new JobServiceImpl();
        result = jobService.updateJob(job);
        return result;
    }
}
