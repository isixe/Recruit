package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.JobService;
import service.impl.JobServiceImpl;

import java.io.IOException;

@WebServlet("/deleteJobServlet")
public class deleteJobServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("id");
        System.out.println(id);
        JobService jobService = new JobServiceImpl();
        Integer count =jobService.delete(Integer.parseInt(id));
        if(count > 0){
            System.out.println("删除用户成功");
        }else{
            System.out.println("删除用户失败...");
        }
        resp.sendRedirect("/Recruit_war/pages/findJob.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
