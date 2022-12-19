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
import java.util.ArrayList;

@WebServlet("/findResumeServlet")
public class FindResumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResumeService resumeService = new ResumeServiceImpl();
        String status = req.getParameter("status");
        ArrayList<Resume> resumes = resumeService.FindResume(status);
        System.out.println(resumes);
        System.out.println(status);
        req.setAttribute("resumes", resumes);
        req.getRequestDispatcher("pages/viewUserResumes.jsp").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
