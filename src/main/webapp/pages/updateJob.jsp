<%@ page import="service.JobService" %>
<%@ page import="service.impl.JobServiceImpl" %>
<%@ page import="bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String jid = request.getParameter("jobid");
    JobService service = new JobServiceImpl();

    if (jid == null){
        jid = (String) request.getSession().getAttribute("jobid");
    }else {
        request.getSession().setAttribute("jobid", jid);
    }
    int jobid = Integer.parseInt(jid);
    Job job = null;
    try {
        job = service.findById(jobid);
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("job",job);
%>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../static/css/base.css" />
    <link rel="stylesheet" href="../static/css/info-reg.css" />
    <title>招聘信息修改界面</title>
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
    <h2>招聘修改</h2>
</div>
<form id="fm" action="${pageContext.request.contextPath}/job?action=update&jobid=${jobid}" method="post">
    <div class="main">
        <p class="short-input ue-clear">
            <label>标题</label>
            <input name="title" type="text" style="width:258px;height:27px;border:1px solid #C5D6E0" value="${job.title}"/>
        </p>
        <p class="long-input ue-clear">
            <label>公司地址：</label>
            <input name="area" type="text" value="${job.area}"/>
        </p>
        <p class="long-input ue-clear">
            <label>联系方式：</label>
            <input name="contact" type="text" value="${job.contact}"/>
        </p>
        <div class="short-input select ue-clear">
            <label>职位需求：</label>
            <select name="position" style="width:200px;height:30px;border:1px solid #C5D6E0" disabled>
                <option value="${job.id}" selected>软件工程师</option>
                <option value="2">会计</option>
                <option value="3">文员</option>
                <option value="4">客户经理</option>
                <option value="5">网站策划</option>
                <option value="6">平面设计师</option>
            </select>
        </div>
        <p class="long-input ue-clear">
            <label>岗位职责：</label>
            <input name="requirement" type="text" value="${job.job_requirements}"/>
        </p>
        <p class="long-input ue-clear">
            <label>任职要求：</label>
            <input name="require" type="text" value="${job.job_require}"/>
        </p>
        <div class="short-input select ue-clear">
            <label>工作时间：</label>
            <select name="time" style="width:200px;height:30px;border:1px solid #C5D6E0">
                <option value="全职">全职</option>
                <option value="兼职">兼职</option>
            </select>
        </div>
        <div class="short-input select ue-clear">
            <label>薪资待遇：</label>
            <select name="salary"style="width:200px;height:30px;border:1px solid #C5D6E0">
                <option value="${job.salary}" selected>${job.salary}</option>
                <option value="3000-4000">3000-4000</option>
                <option value="4001-5000">4001-5000</option>
                <option value="5001-6000">5001-6000</option>
                <option value="6001-7000">6001-7000</option>
                <option value="7001-8000">7001-8000</option>
            </select>
        </div>
        <p class="long-input ue-clear">
            <label>福利：</label>
            <input name="welfalre" type="text" value="${job.welfare}"/>
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

