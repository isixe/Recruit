<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = null;
    username = (String) request.getSession().getAttribute("username");
    if (username != null) {
        String path = request.getContextPath();
        response.sendRedirect(path + "/index.jsp");
    }
%>
<html>

<head>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>前程似锦招聘平台</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../static/css/login-register.css"/>
    <!-- Script -->
    <script id="allmobilize" charset="utf-8" src="../static/js/allmobilize.min.js"></script>
</head>

<body id="login_bg">
<div class="login_wrapper">
    <div class="login_header">
        <a href="/index.jsp"><img src="../static/images/logo.png" width="285" height="92"/></a>
        <div id="cloud_s"><img src="../static/images/cloud_s.png" width="81" height="52" alt="cloud"/></div>
        <div id="cloud_m"><img src="../static/images/cloud_m.png" width="136" height="95" alt="cloud"/></div>
    </div>

    <input type="hidden" id="resubmitToken" value="9b207beb1e014a93bc852b7ba450db27"/>
    <div class="login_box">
        <form id="loginForm" method="post" action="${pageContext.request.contextPath}/login?action=register">
            <ul class="register_radio clearfix">
                <li>
                    找工作
                    <input type="radio" value="user" name="role"/>
                </li>
                <li>
                    招人
                    <input type="radio" value="company" name="role"/>
                </li>
            </ul>
            <input type="text" id="name" name="name" tabindex="1" placeholder="请输入用户名"/>
            <span class="error" style="display:none;" id="beError"></span>
            <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"/>
            <label class="fl registerJianJu" for="checkbox">
                <input type="checkbox" id="checkbox" name="checkbox" checked class="checkbox valid"/>我已阅读并同意<a
                    href="h/privacy.html" target="_blank">《前程似锦用户协议》</a>
            </label>
            <input type="submit" id="submitLogin" value="注 &nbsp; &nbsp; 册"/>
        </form>
        <div class="login_right">
            <div>已有帐号</div>
            <a href="login.jsp" class="registor_now">直接登录</a>
        </div>
    </div>
    <div class="login_box_btm"></div>
</div>
<script src="../static/vendor/jquery.3.4.1.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function (e) {
        $('.register_radio li input').click(function (e) {
            $(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
        });
    });
</script>
</body>

</html>