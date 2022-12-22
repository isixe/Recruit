<%@ page import="bean.Company" %>
<%@ page import="dao.CompanyDao" %>
<%@ page import="dao.impl.CompanyDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
        String username = null;
        String sid = null;
        //获取登录传递的Session变量（用户id, 用户名）
        username = (String) request.getSession().getAttribute("username");
        sid = (String) request.getSession().getAttribute("userid");
        request.setAttribute("username", username);
        //System.out.println("用户id："+sid);

        Company company = new Company();
        //通过id获取用户用户角色，根据用户角色，跳转相应界面
        if (sid != null) {
            int id = Integer.parseInt(sid);
            CompanyDao dao = new CompanyDaoImpl();
            try {
                company = dao.findByUserID(id);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        request.setAttribute("company",company);
%>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../static/css/base.css" />
    <link rel="stylesheet" href="../static/css/info-reg.css" />
    <title>公司信息修改界面</title>
    <style type="text/css">
        .error{
            color:Red;
            font-size:13px;
            margin-left:5px;
            padding-left:16px;
        }
    </style>
</head>
<body>
<div class="title">
    <h2>公司信息修改</h2>
</div>
<form id="fm" action="${pageContext.request.contextPath}/company?action=update&id=${company.id}" method="post">
    <div class="main">
        <p class="short-input ue-clear">
            <label>公司名</label>
            <input name="name" type="text" value="${company.name}" style="width:258px;height:27px;border:1px solid #C5D6E0"/>
        </p>
        <p class="long-input ue-clear">
            <label>公司地址：</label>
            <input name="area" type="text" value="${company.area}"/>
        </p>
        <p class="long-input ue-clear">
            <label>公司描述：</label>
            <input name="desc" type="text" value="${company.desc}"/>
        </p>

        <div class="btn ue-clear">
            <input style="height:50px;width:150px;background-color:#68B86C;color:white;border-radius:10px" type="submit" value="提交"/>
            <input style="height:50px;width:150px;background-color:#EFF6FA;color:black;border-radius:5px" type="reset" value="清空"/>
        </div>
    </div>
</form>
</body>
<script type="text/javascript" src="../static/vendor/jquery.3.4.1.js"></script>
<script type="text/javascript" src="../static/js/common.js"></script>
<script type="text/javascript" src="../static/js/WdatePicker.js"></script>
<script type="text/javascript" src="../static/js/jquery.validate.min.js"></script>
</html>

