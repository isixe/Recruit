package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ResumeService;
import service.impl.ResumeServiceImpl;

import java.io.IOException;

@WebServlet("/delSelectedResumesServlet")
public class DelSelectedResumesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] userIds = req.getParameterValues("userId");
        String status = req.getParameter("status");
        ResumeService resumeService = new ResumeServiceImpl();
        for(String userId : userIds) {
            resumeService.delete(Integer.parseInt(userId));
        }
        req.setAttribute("status", status);
        req.getRequestDispatcher("findResumeByPageServlet").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
