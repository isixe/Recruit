package servlet;

import bean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import service.impl.UserServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    public LoginServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        String vCode = request.getParameter("vCode").toLowerCase();
        String verifyCode = ((String) request.getSession().getAttribute("vCode")).toLowerCase();

        if (!vCode.equals(verifyCode)) {
            PrintWriter out = response.getWriter();
            out.print("<script>alert('验证码输入错误，请重新输入...'); window.history.go(-1);</script>");
        } else {
            boolean flag = false;
            UserService service = new UserServiceImpl();

            String action = request.getParameter("action");
            String username = request.getParameter("name");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            if (role ==null ){
                role ="user";
            }

            //登录验证
            if (action.equals("login")) {
                int id = 0;
                UserService userService = new UserServiceImpl();
                id = userService.login(username, password);
                if (id > 0) {
                    request.getSession().setAttribute("userid", Integer.toString(id));
                    request.getSession().setAttribute("username", username);
                    response.getWriter().write("登录成功，正在跳转主页！");
                    response.setHeader("refresh", "1;url=index.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('帐号或密码错误，请重新登录...'); window.location='pages/login.jsp' </script>");
                }
            }

            //用户注册
            if (action.equals("register")) {
                UserService userService = new UserServiceImpl();
                Date date = new Date();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                String local_date = format.format(date);
                User user = new User();
                user.setName(username);
                user.setPassword(password);
                user.setRegisterTime(local_date);
                user.setRole(role);
                flag = userService.register(user);
                if (flag) {
                    response.getWriter().write("注册成功，正在跳转登录界面！");
                    response.setHeader("refresh", "1;url=pages/login.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('注册失败，请重新注册...'); window.location='pages/register.jsp' </script>");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doGet(req, resp);
    }

}
