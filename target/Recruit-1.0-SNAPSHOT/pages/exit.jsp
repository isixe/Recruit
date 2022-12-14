<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.getWriter().write("退出成功，3秒后跳转登录界面！");
    request.getSession().setAttribute("username",null);
    response.setHeader("refresh", "3;url=login.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
