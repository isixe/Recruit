<%--
  Created by IntelliJ IDEA.
  User: 15110
  Date: 2022/12/17
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/addJobServlet" method="post">
    发布id：<input type="text" name="id" required="required"><br>
    企业id：<input type="text" name="company_id"><br>
    职位id： <input type="text" name="position_id"><br>
    工作地区：<input type="text" name="area"><br>
    发布时间：<input type="text" name="time"><br>
    联系方式：<input type="text" name="contact"><br>
    最高薪资：<input type="text" name="maxsalary"><br>
    最低薪资：<input type="text" name="minsalary"><br>
    岗位职责：<input type="text" name="job_requirements"><br>
    任职要求：<input type="text" name="job_require"><br>
    福利：<input type="text" name="welfare"><br>
    <input type="submit"  value="提交">
</form>
</body>
</html>
