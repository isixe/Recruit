<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="bean.Job" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.JobService" %>
<%@ page import="service.impl.JobServiceImpl" %>
<%@ page import="dao.CompanyDao" %>
<%@ page import="dao.impl.CompanyDaoImpl" %>
<%@ page import="bean.Company" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String username = null;
    String sid = null;
    //获取登录传递的Session变量（用户id, 用户名）
    username = (String) request.getSession().getAttribute("username");
    request.setAttribute("username", username);

    sid = (String) request.getSession().getAttribute("userid");
    //System.out.println("用户id："+sid);
    int id = Integer.parseInt(sid);

    //通过id获取用户用户角色，根据用户角色，跳转相应界面
    if (!sid.equals("")) {
        User user = new User();
        UserDao userDao = new UserDaoImpl();
        try {
            user = userDao.findById(id);
            String role = user.getRole();
            request.getSession().setAttribute("role", role);
            request.setAttribute("role", role);
            String path = request.getContextPath();
            if ("admin".equals(role)) {
                response.sendRedirect(path + "/pages/admin.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        //根据用户id获取公司id
        int cid = 0;
        CompanyDao companyDao = new CompanyDaoImpl();
        Company company = null;
        try {
            company = companyDao.findByUserID(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //获取工作列表
        List<Job> jobs = new ArrayList<>();
        JobService service = new JobServiceImpl();
        jobs = service.findByCid(company.getId());
        request.setAttribute("jobs", jobs);

    }
%>
<script type="text/javascript">
    function deleteJob(id) {
        if (window.confirm("确定要删除这条记录吗?" + id)) {
            location.href = "${pageContext.request.contextPath}/deleteJobServlet?id=" + id;
        }
    }
</script>
<html>
<head>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>前程似锦招聘网</title>
        <!-- CSS -->
        <link rel="stylesheet" href="../static/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="../static/css/index.css">
        <!-- JS -->
        <script src="../static/vendor/bootstrap.min.js"></script>
    </head>

<body>
<div class="box">
    <!-- ==============顶栏============== -->
    <div class="header">
        <div class="wrapper">

            <!-- 右边导航栏 -->
            <div class="right">
                <ul>
                    <li>
                        <c:if test="${requestScope.username==null}">
                            <a href="${pageContext.request.contextPath}/pages/login.jsp">登录/注册</a>
                        </c:if>
                        <c:if test="${requestScope.username!=null}">
                            <div class="first">欢迎，&nbsp;${requestScope.username}</div>
                            <div class="second">
                                <ul>
                                    <a href="${pageContext.request.contextPath}/pages/exit.jsp">
                                        <li>退出</li>
                                    </a>
                                </ul>
                            </div>
                        </c:if>
                    </li>

                    <c:if test="${requestScope.role=='company'}">
                        <li>
                            <!-- 一级导航 -->
                            <a href="${pageContext.request.contextPath}/pages/myCompany.jsp">
                                <div class="first">企业中心</div>
                            </a>
                            <!-- 二级导航 -->
                            <div class="second">
                                <ul>
                                    <li>我的发布</li>
                                    <li>信息更改</li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- 右边导航栏 -->
        </div>
    </div>
    <!-- ==============顶栏============== -->

    <!-- ==============中间logo、搜索============== -->
    <div class="search">
        <div class="wrapper">
            <!-- 左边logo -->
            <div class="left">
                <img src="../static/images/logo.png" alt="">
            </div>
            <!-- 左边logo -->


            <!-- 发布职位按钮 -->
            <div class="right">
                <button class="btn btn-warning shadow-sm"><span class="iconfont icon-jinggao"></span>发布招聘</button>
            </div>
            <!-- 发布职位按钮 -->
        </div>
    </div>
    <!-- ==============中间logo、搜索============== -->

    <!-- ==============地点、职位、福利============== -->
    <div id="menu">
        <div class="wrapper">

        </div>
    </div>
    <br><br><br>

    <!-- ==============工作============== -->
    <div class="recruit">
        <div class="wrapper">
            <%--打印表单信息--%>
            <c:forEach items="${requestScope.jobs }" var="job">
                <!-- 信息 -->
                <div class="information">
                    <div class="left">
                        <p>${job.title}</p>
                        <p> ${job.minsalary}-${job.maxsalary}元/月</p>
                        <p>
                            <span class="bg-info text-light">${job.welfare}</span>
                                <%--              <span class="bg-danger text-light">保吃</span>--%>
                                <%--              <span class="bg-success text-light">包住</span>--%>
                        </p>
                    </div>
                    <div class="center">
                        <div class="top">
                            <span>工作时间：${job.time}&emsp;&emsp;&emsp;工作类型：${job.position_id}</span><br/>
                            <span>联系人：${job.contact}&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：${job.area}</span>
                        </div>
                        <div class="buttom">
<%--                            <span>岗位职责：${job.job_requirements}</span><br/>--%>
<%--                            <span>任职要求：${job.job_require}</span>--%>
                        </div>
                    </div>
                    <div class="right">
                        <a href="{pageContext.request.contextPath}/updateJobServlet?id=${job.id})">
                            <button class="btn btn-primary">修改</button>
                        </a>
                        <a href="JavaScript:deleteJob(${job.id})">
                            <button class="btn btn-primary">删除</button>
                        </a>
                    </div>
                </div>
            </c:forEach>
            <!-- 信息 -->
        </div>

        <!-- ==============工作============== -->


    </div>
</div>
</body>

</html>
