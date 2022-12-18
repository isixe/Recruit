<%@ page import="bean.Job" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.Impl.JobServiceImpl" %>
<%@ page import="dao.JobDao" %>
<%@ page import="service.JobService" %><%--
  Created by IntelliJ IDEA.
  User: 15110
  Date: 2022/12/17
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>职位信息</title>
</head>
<body>
<input typeq="text" name="key" id="key"  placeholder="请输入公司id">不知道怎么获取这个值
<br/>

<a href=${pageContext.request.contextPath}/FindJobByCidServlet?company_id=>company_id=key的公司招聘的职业</a>
<br/>
<a href=${pageContext.request.contextPath}/FindJobByCidServlet?company_id=1>company_id=1的公司招聘的职业</a>
<br/>
<a href=${pageContext.request.contextPath}/FindJobByPidServlet?position_id=1>position_id=1的公司招聘的职业</a>
<br/>
<a href=${pageContext.request.contextPath}/FindJobByPidServlet?position_id=2>position_id=2的公司招聘的职业</a>
<br/>
<%--打印表单信息--%>
<c:forEach items="${jobs }" var="job">
    ${job.id}--
    ${job.company_id}--
    ${job.position_id}--
    ${job.area}--
    ${job.time}--
    ${job.contact}--
    ${job.maxsalary}--
    ${job.minsalary}--
    ${job.job_requirements}--
    ${job.job_require}--
    ${job.welfare}--
    <hr/>
</c:forEach>
</body>
</html>
