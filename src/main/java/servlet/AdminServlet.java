package servlet;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int result = 0;
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action.equals("delete")){
            UserDao userDao = new UserDaoImpl();
            try {
                result = userDao.delete(Integer.parseInt(id));
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (result>0){
                response.getWriter().write("删除成功，正在跳转管理主页！");
                response.setHeader("refresh", "1;url=pages/admin.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('删除失败！'); window.location='pages/admin.jsp' </script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

