package servlet;

import bean.Record;
import bean.Resume;
import dao.RecordDao;
import dao.impl.RecordDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ResumeService;
import service.impl.ResumeServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/record")
public class MyResumeRecoedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        int result = 0;
        RecordDao dao = new RecordDaoImpl();
        String action = req.getParameter("action");
        String id = req.getParameter("id");
        if (action.equals("delete")){
            try {
                result = dao.delete(Integer.parseInt(id));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (result > 0) {
                resp.getWriter().write("修改成功，正在跳转求职记录页面！");
                resp.setHeader("refresh", "1;url=pages/myRecord.jsp");
            } else {
                PrintWriter out = resp.getWriter();
                out.print("<script>alert('删除失败！'); window.location='pages/myRecord.jsp' ;</script>");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}