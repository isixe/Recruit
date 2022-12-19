<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String username = null;
    String sid = null;
    //获取登录传递的Session变量（用户id, 用户名）
    username = (String) request.getSession().getAttribute("username");
    request.setAttribute("username", username);
    sid = (String) request.getSession().getAttribute("userid");

    if (sid != null) {
        int id = Integer.parseInt(sid);
        User user = new User();
        UserDao userDao = new UserDaoImpl();
        try {
            user = userDao.findById(id);
            String role = user.getRole();
            request.getSession().setAttribute("role", role);
            request.setAttribute("role", role);
            request.setAttribute("user", user);
            String path = request.getContextPath();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
<html>

<head>
    </script>
    <script type="text/javascript" async="" src="../static/js/conversion.js"></script>
    <script src="../static/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <link media="handheld" rel="alternate">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>修改资料</title>
    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="../static/css/index.css">
    <link href="../static/css/user.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" src="../static/vendor/jquery.1.10.1.min.js"></script>
    <script src="../static/js/jquery.lib.min.js" type="text/javascript"></script>
    <script src="../static/js/additional-methods.js" type="text/javascript"></script>
    <script src="../static/js/conv.js" type="text/javascript"></script>
    <script src="../static/js/ajaxCross.json" charset="UTF-8"></script>
</head>

<body>
<div id="body">
    <div class="header">
        <div class="wrapper">
            <!-- 左边城市 -->

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

                    <c:if test="${requestScope.role=='user'}">
                        <li>
                            <!-- 一级导航 -->
                            <div class="first"><a href="${pageContext.request.contextPath}/pages/userCenter.jsp">个人中心</a></div>
                            <!-- 二级导航 -->
                            <div class="second">
                                <ul>
                                    <a href="${pageContext.request.contextPath}/pages/preview.jsp"><li>我的简历</li></a>
                                    <li>我的求职</li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- 右边导航栏 -->
        </div>
    </div>
    <div id="container">
        <div class="user_bindSidebar">
            <dl id="user_sideBarmenu" class="user_sideBarmenu">
                <dt>
                    <br>
                    <h3>帐号设置</h3>
                    <br>
                </dt>
                <dd><a class="hover-active" href="${pageContext.request.contextPath}/pages/userCenter.jsp">资料修改</a></dd>
                <dd><a class="hover" href="#">密码修改</a></dd>
                <dd><a class="hover-active" href="#">用户注销</a></dd>
            </dl>
        </div>
        <input type="hidden" id="hasSidebar" value="1">
        <div class="content user_modifyContent">
            <dl class="c_section">
                <dt>
                    <h2><em></em>密码修改</h2>
                </dt>
                <dd>
                    <form id="updatePswForm" method="post" action="${pageContext.request.contextPath}/user?action=updatePsd">
                        <table class="savePassword">
                            <tr>
                                <td class="label">旧密码</td>
                                <td>
                                    <input type="password" maxlength="16" class="input-password" name="oldPassword">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">新密码</td>
                                <td>
                                    <input type="password" maxlength="16" class="input-password" name="newPassword1">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">再次输入密码</td>
                                <td>
                                    <input type="password" maxlength="16" class="input-password" name="newPassword2">
                                </td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="修 改"></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </dd>
            </dl>
        </div>
    </div><!-- end #container -->
</div><!-- end #body -->

<script src="../static/js/core.min.js" type="text/javascript"></script>
<script src="../static/js/popup.min.js" type="text/javascript"></script>

</body>

</html>
