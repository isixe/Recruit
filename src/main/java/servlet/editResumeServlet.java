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

@WebServlet("/editResumeServlet")
public class editResumeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        Resume resume=new Resume();
        resume.setUserid(uid);
        resume.setName(req.getParameter("name"));
        resume.setSex(req.getParameter("sex"));
        resume.setEducation(req.getParameter("education"));
        resume.setSchool(req.getParameter("school"));
        resume.setWorkexp(req.getParameter("workexp"));
        resume.setEmail(req.getParameter("email"));
        resume.setPhone(req.getParameter("phone"));
        resume.setHope(req.getParameter("hope"));
        resume.setProjectexp(req.getParameter("projectexp"));
        ResumeService resumeService = new ResumeServiceImpl();
        resumeService.update(resume);
        req.getRequestDispatcher("findResumeByIdServlet?uid="+uid+"&type=preview").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
