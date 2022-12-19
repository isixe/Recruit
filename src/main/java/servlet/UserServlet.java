package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;
import service.impl.UserServiceImpl;

import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/User")
public class UserServlet extends HttpServlet{
    public UserServlet() {}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        UserService service = new UserServiceImpl();
        int result = 0;
        String path = "error.jsp";
        String action = request.getParameter("action");


        path = "index.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
