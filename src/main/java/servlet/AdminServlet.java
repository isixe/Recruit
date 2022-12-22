package servlet;

import bean.Job;
import bean.User;
import dao.JobDao;
import dao.UserDao;
import dao.impl.JobDaoImpl;
import dao.impl.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.JobService;
import service.impl.JobServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private User user = new User();
    private Job job = new Job();
    private int result = 0;
    private int id;
    private final UserDao userDao = new UserDaoImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int result = 0;
        String function = request.getParameter("function");
        String action = request.getParameter("action");
        String uid = request.getParameter("id");
        if (uid != null) {
            id = Integer.parseInt(uid);
        }
        switch (action) {
            case "add":
                result = addUserDate(request);
                if (result > 0) {
                    response.getWriter().write("添加成功，正在跳转管理主页！");
                    response.setHeader("refresh", "1;url=pages/admin.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('添加失败！请重新填写');window.history.go(-1); </script>");
                }
                break;
            case "delete":
                if (function.equals("user")) {
                    UserDao userDao = new UserDaoImpl();
                    try {
                        result = userDao.delete(id);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
                if (function.equals("job")) {
                    JobDao jobDao = new JobDaoImpl();
                    try {
                        result = jobDao.delete(id);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (function.equals("record")) {
//                    JobDao jobDao =new JobDaoImpl();
                    try {
//                        result = jobDao.delete(Integer.parseInt(id));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                if (result > 0) {
                    response.getWriter().write("删除成功，正在跳转管理主页！");
                    response.setHeader("refresh", "1;url=pages/admin.jsp");
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("<script>alert('删除失败！'); window.location='pages/admin.jsp' </script>");
                }
                break;
            case "update":
                if (function.equals("user")) {
                    result = updateUserData(request);
                    if (result > 0) {
                        response.getWriter().write("修改成功，正在跳转管理主页！");
                        response.setHeader("refresh", "1;url=pages/admin.jsp");
                    } else {
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('修改失败！'); window.location='pages/admin.jsp' </script>");
                    }
                }
                if (function.equals("job")) {
                    result = updateJobData(request);
                    if (result > 0) {
                        response.getWriter().write("修改成功，正在跳转管理主页！");
                        response.setHeader("refresh", "1;url=pages/adminJob.jsp");
                    } else {
                        PrintWriter out = response.getWriter();
                        out.print("<script>alert('修改失败！'); window.history.go(-1);' </script>");
                    }
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public int addUserDate(HttpServletRequest request) {
        user.setName(request.getParameter("name"));
        user.setAge(Integer.parseInt(request.getParameter("age")));
        user.setEmail(request.getParameter("email"));
        user.setPhone(request.getParameter("phone"));
        user.setSex(request.getParameter("sex"));
        user.setRole(request.getParameter("role"));
        user.setPassword(request.getParameter("password"));
        try {
            result = userDao.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateUserData(HttpServletRequest request) {
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
        return result;
    }

    public Integer updateJobData(HttpServletRequest req){
        job.setId(Integer.parseInt(req.getParameter("jobid")));
        job.setArea(req.getParameter("area"));
        job.setContact(req.getParameter("contact"));
        job.setSalary(req.getParameter("salary"));
        job.setJob_requirements(req.getParameter("requirement"));
        job.setJob_require(req.getParameter("require"));
        job.setWelfare(req.getParameter("welfalre"));
        job.setTitle(req.getParameter("title"));
        job.setTime(req.getParameter("time"));
        JobService jobService = new JobServiceImpl();
        result = jobService.updateJob(job);
        return result;
    }

}

