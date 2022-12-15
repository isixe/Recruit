package servlet;

import bean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    public LoginServlet() {}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");


        String vCode = request.getParameter("code");
        String sessionVerifyCode = (String)request.getSession().getAttribute("vCode");

        boolean flag = false;
        UserService service = new UserService();
        String action = request.getParameter("action");
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        //登录验证
        if (action.equals("login")){
            int id = 0;
            UserService userService = new UserService();
            id = userService.login(username,password);
            if (id>0){
                request.getSession().setAttribute("userid", Integer.toString(id));
                request.getSession().setAttribute("username", username);
                response.getWriter().write("登录成功，3秒后跳转主页！");
                response.setHeader("refresh", "3;url=index.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('帐号或密码错误，请重新登录...'); window.location='pages/login.jsp' </script>");
            }
        }

        //用户注册
        if (action.equals("register")){
            UserService userService = new UserService();
            Date date = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String local_date = format.format(date);
            User user = new User();
            user.setName(username);
            user.setPassword(password);
            user.setRegisterTime(local_date);
            user.setRole(role);
            flag = userService.register(user);
            if (flag){
                response.getWriter().write("注册成功，3秒后跳转登录界面！");
                response.setHeader("refresh", "3;url=pages/login.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('注册失败，请重新注册...'); window.location='pages/register.jsp' </script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException, ServletException {
        doGet(req, resp);
    }

}
