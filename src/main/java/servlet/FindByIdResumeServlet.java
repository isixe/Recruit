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

@WebServlet("/FindByIdResumeServlet")
public class FindByIdResumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ResumeService resumeService = new ResumeServiceImpl();
        int id = Integer.parseInt(req.getParameter("id"));
        Resume resumes = resumeService.findByUserId(id);
        System.out.println(resumes);
        req.setAttribute("resumes", resumes);
        req.getRequestDispatcher("").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
