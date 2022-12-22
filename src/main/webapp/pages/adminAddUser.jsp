<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
    </script>
    <script type="text/javascript" async="" src="../static/js/conversion.js"></script>
    <script src="../static/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>
    <link media="handheld" rel="alternate">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>用户添加界面</title>
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
    <div id="container">
        <div class=" user_modifyContent">
            <dl class="c_section">
                <dt>
                    <h2><em></em>用户新增</h2>
                </dt>
                <dd>
                    <form id="updatePswForm" method="post"
                          action="${pageContext.request.contextPath}/admin?function=user&action=add">
                        <table class="savePassword">
                            <tr>
                                <td class="label">用户名</td>
                                <td>
                                    <input type="text" maxlength="16" id="input-name" name="name">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">密码</td>
                                <td>
                                    <input type="password" maxlength="16" id="input-password" name="password">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">性别</td>
                                <td>
                                    <select name="sex">
                                        <option value="男" selected>男</option>
                                        <option value="女">女</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">角色</td>
                                <td>
                                    <select name="role">
                                        <option value="user" selected>用户</option>
                                        <option value="company" selected>公司</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">年龄</td>
                                <td><input type="number" maxlength="16" id="input-age" name="age"></td>
                            </tr>
                            <tr>
                                <td class="label">电话</td>
                                <td><input type="tel" maxlength="16" id="input-tel" name="phone">
                                </td>
                            </tr>
                            <tr>
                                <td class="label">邮箱</td>
                                <td><input type="email" maxlength="16" id="input-email" name="email"></td>
                            </tr>
                            <tr>
                                <td><input type="submit" value="新 增"></td>
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
