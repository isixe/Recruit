package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    public LoginServlet() {}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        boolean flag = false;
        UserService service = new UserService();
        String action = request.getParameter("action");
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        //登录验证
        if (action.equals("login")){
            UserService userService = new UserService();
            flag = userService.login(username,password);
            if (flag){
                request.getSession().setAttribute("username", username);
                response.getWriter().write("登录成功，3秒后跳转主页！");
                response.setHeader("refresh", "3;url=index.jsp");
            }else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('帐号或密码错误，请重新登录...'); window.location='pages/login.jsp' </script>");
            }
        }

        //注册验证
        if (action.equals("register")){
            UserService userService = new UserService();
            flag = userService.register(username,password);
            if (flag){
                response.getWriter().write("注册成功，3秒后跳转登录界面！");
                response.setHeader("refresh", "3;url=login.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException, ServletException {
        doGet(req, resp);
    }

}
