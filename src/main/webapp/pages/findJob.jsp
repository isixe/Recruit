<%@ page import="bean.Job" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="service.impl.JobServiceImpl" %>
<%@ page import="dao.JobDao" %>
<%@ page import="service.JobService" %>
<%--
  Created by IntelliJ IDEA.
  User: 1511
  Date: 2022/12/17
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<script type="text/javascript">
    function deleteJob(id) {
        if (window.confirm("确定要删除这条记录吗?"+id)){
            location.href="${pageContext.request.contextPath}/deleteJobServlet?id="+id;
        }
    }
    function FindJobByCid(company_id) {

        if (window.confirm("确定要查询这条记录吗?"+company_id)){
            location.href="/FindJobByCidServlet?company_id="+company_id;
        }
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>职位信息</title>
</head>
<body>
<input type="text" name="key" id="key"  placeholder="请输入公司id">不知道怎么获取这个值
<br/>
<a href="JavaScript:FindJobByCid(${job.company_id})">查询company_id=key的公司招聘的职业</a>
<br/>
<a href="${pageContext.request.contextPath}/pages/addjob.jsp" >添加job招聘</a>
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
    <a href="{pageContext.request.contextPath}/updateJobServlet?id=${job.id})">删除</a>
    <a href="JavaScript:deleteJob(${job.id})">删除</a>
    <br/>
    <hr/>
</c:forEach>
</body>
</html>
