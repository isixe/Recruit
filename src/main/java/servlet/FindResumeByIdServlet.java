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

@WebServlet("/findResumeByIdServlet")
public class FindResumeByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        String type = req.getParameter("type");
        ResumeService resumeService = new ResumeServiceImpl();
        Resume resume = resumeService.findByUserId(uid);
        req.setAttribute("resume", resume);
        if ("preview".equals(type)) {
            req.getRequestDispatcher("pages/preview.jsp").forward(req, resp);
        } else if ("edit".equals(type)) {
            req.getRequestDispatcher("pages/editResume.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
