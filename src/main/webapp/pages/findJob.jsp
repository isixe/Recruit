<%--
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
<a href=${pageContext.request.contextPath}/JobServlet?id=1>id1</a>

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
