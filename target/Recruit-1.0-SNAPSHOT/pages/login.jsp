<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = null;
    username = (String) request.getSession().getAttribute("username");
    if (username != null){
        String path = request.getContextPath ();
        response.sendRedirect(path+"/index.jsp");
    }
%>
<html>
<head>
    <head>
        <meta http-equiv="Cache-Control" content="no-siteapp"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>前程似锦招聘平台</title>

        <!-- CSS -->
        <link rel="Shortcut Icon" href="../static/images/logo.png">
        <link rel="stylesheet" type="text/css" href="../static/css/login-register.css"/>
        <!-- Script -->
        <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
        <script id="allmobilize" charset="utf-8" src="../static/js/allmobilize.min.js"></script>
    </head>

<body id="login_bg">
<div class="login_wrapper">
    <div class="login_header">
        <a href="../index.jsp"><img src="../static/images/logo.png" width="285" height="92"/></a>
        <div id="cloud_s"><img src="../static/images/cloud_s.png" width="81" height="52" alt="cloud"/></div>
        <div id="cloud_m"><img src="../static/images/cloud_m.png" width="136" height="95" alt="cloud"/></div>
    </div>

    <input type="hidden" id="resubmitToken" value=""/>
    <div class="login_box">
        <form id="loginForm" action="${pageContext.request.contextPath}/login?action=login" method="post">
            <input type="text" id="name" name="name" value="" tabindex="1" placeholder="请输入登录用户名"/>
            <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
            <span class="error" style="display:none;" id="beError"></span>
            <label class="fl" for="remember"><input type="checkbox" id="remember" value="" checked="checked"
                                                    name="autoLogin"/> 记住我</label>
            <a href="#" class="fr" target="_blank">忘记密码？</a>

            <input type="submit" class="submitLogin" value="登 &nbsp; &nbsp; 录">

            <input type="hidden" id="callback" name="callback" value=""/>
            <input type="hidden" id="authType" name="authType" value=""/>
            <input type="hidden" id="signature" name="signature" value=""/>
            <input type="hidden" id="timestamp" name="timestamp" value=""/>
        </form>
        <div class="login_right">
            <div>还没有帐号？</div>
            <a href="register.jsp" class="registor_now">立即注册</a>
        </div>
    </div>
    <div class="login_box_btm"></div>
</div>
</body>

</html>
