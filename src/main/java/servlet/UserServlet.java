package servlet;

import bean.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import service.impl.UserServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet{
    public UserServlet() {}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        UserService service = new UserServiceImpl();
        int result = 0;
        String action = request.getParameter("action");
        if (action.equals("update")){
            User user = new User();
            user.setName(request.getParameter("name"));
            user.setAge(Integer.parseInt(request.getParameter("age")));
            user.setEmail(request.getParameter("email"));
            user.setPhone(request.getParameter("phone"));
            user.setSex(request.getParameter("sex"));
            UserDao userDao = new UserDaoImpl();
            try {
                result = userDao.update(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result>0){
                response.getWriter().write("修改成功，正在跳转主页！");
                response.setHeader("refresh", "1;url=index.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('修改失败，请重新填写！'); window.location='pages/userCenter.jsp' ;</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
