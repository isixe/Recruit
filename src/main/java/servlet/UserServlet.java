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
public class UserServlet extends HttpServlet {
    public UserServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        int result = 0;
        String sid = null;
        User user = new User();
        UserDao userDao = new UserDaoImpl();
        UserService service = new UserServiceImpl();

        String action = request.getParameter("action");
        sid = (String) request.getSession().getAttribute("userid");
        int id = Integer.parseInt(sid);

        switch (action) {
            case "update": //用户资料更新
                user.setName(request.getParameter("name"));
                user.setAge(Integer.parseInt(request.getParameter("age")));
                user.setEmail(request.getParameter("email"));
                user.setPhone(request.getParameter("phone"));
                user.setSex(request.getParameter("sex"));
                user.setId(id);
                try {
                    result = userDao.update(user);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (result > 0) {
                    response.getWriter().write("修改成功，正在跳转主页！");
                    response.setHeader("refresh", "1;url=index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('修改失败，请重新填写！'); window.location='pages/userCenter.jsp' ;</script>");
                }
                break;
            case "updatePsd": //密码修改
                try {
                    user = userDao.findById(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                String password = user.getPassword();
                String oldPassword = request.getParameter("oldPassword");
                String newPassword1 = request.getParameter("newPassword1");
                String newPassword2 = request.getParameter("newPassword2");

                if (oldPassword.equals("") || newPassword1.equals("") || newPassword2.equals("")) {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('密码不能为空，请重新填写！'); window.location='pages/updatePassword.jsp' ;</script>");
                } else {
                    if (!newPassword1.equals(newPassword2) || !password.equals(oldPassword)) {
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('密码错误，请重新填写！'); window.location='pages/updatePassword.jsp' ;</script>");
                    } else {
                        try {
                            result = userDao.setPassword(id, newPassword1);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        if (result > 0) {
                            response.getWriter().write("修改成功，正在跳转主页！");
                            response.setHeader("refresh", "1;url=index.jsp");
                        } else {
                            PrintWriter out = response.getWriter();
                            out.print("<script>alert('修改失败，请重新填写！'); window.location='pages/updatePassword.jsp' ;</script>");
                        }
                    }
                }
                break;
            case "delete": //用户删除
                try {
                    result = userDao.delete(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if (result > 0) {
                    request.getSession().removeAttribute("username");
                    request.getSession().removeAttribute("userid");
                    response.getWriter().write("账户注销成功，正在跳转登录界面！");
                    response.setHeader("refresh", "1;url=pages/login.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('账户注销失败！'); window.location='pages/deleteUserAccount.jsp' ;</script>");
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
