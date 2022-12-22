package servlet;

import bean.Company;
import dao.CompanyDao;
import dao.impl.CompanyDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CompanyServlet", value = "/company")
public class CompanyServlet extends HttpServlet {
    private Company company = new Company();
    private int result = 0;
    private int id;
    private CompanyDao companyDao = new CompanyDaoImpl();

    public CompanyServlet(){}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        String action = request.getParameter("action");
        String cid = request.getParameter("id");
        id = Integer.parseInt(cid);
        if (action.equals("update")){
            company.setId(id);
            company.setName(request.getParameter("name"));
            company.setArea(request.getParameter("area"));
            company.setDesc(request.getParameter("desc"));
            try {
                result = companyDao.update(company);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (result > 0) {
                response.getWriter().write("修改成功，正在跳转公司主页！");
                response.setHeader("refresh", "1;url=pages/myCompany.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.print("<script>alert('修改失败，请重新填写！');  window.history.go(-1);</script>");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doGet(req, resp);
    }

}
