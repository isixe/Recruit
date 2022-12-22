<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.JobDao" %>
<%@ page import="dao.impl.JobDaoImpl" %>
<%@ page import="bean.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String keyword = null;
    List<Job> jobs = new ArrayList<>();
    JobDao jobDao =new JobDaoImpl();

    keyword = request.getParameter("search");
    if (keyword == null) {
        keyword = "";
    }
    request.setAttribute("keyword", keyword);

    if (keyword.equals("")) {
        try {
            jobs = jobDao.findByName("");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        try {
            jobs = jobDao.findByName(keyword);
            System.out.println(jobs.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    request.setAttribute("jobs", jobs);
%>
<html>

<head>
    <meta charset="utf-8">
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="../static/vendor/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="../static/css/admin.css">
</head>

<body>
<div class="main-wrapper">
    <div class="header">
        <div class="header-left">
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
                <img src="../static/images/logo.png" width="120" height="35" alt="">
            </a>
        </div>
        <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
        <ul class="nav user-menu float-right">
            <li class="nav-item dropdown has-arrow">
                <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="../static/images/job.jpg" width="40"
                                                    alt="Admin">
                            <span class="status online"></span></span>
                    <span>Admin</span>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/pages/exit.jsp">退出</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">管理后台</li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/pages/admin.jsp"> <span>用户管理</span></a>
                </li>
                <li class="active">
                    <a href="#"> <span>工作管理</span></a>
                </li>
                <li class="">
                    <a href="${pageContext.request.contextPath}/pages/adminRecord.jsp"> <span>投递记录</span></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="page-wrapper">
    <div class="content">
        <div class="row">
            <div class="col-sm-4 col-3">
                <h4 class="page-title">工作管理</h4>
            </div>
        </div>
        <div class="search">
            <div class="input">
                <input style="padding:0 10px;;width: 600px;height: 40px;border-radius: 50px;" type="text" id="input-search"
                       value="${requestScope.keyword}">
                <a href="JavaScript:search();"
                   style="margin-left:20px ;border-radius: 5px;padding: 10px;text-decoration: none;color: #fff;background: dodgerblue">搜 索</a>
            </div>
        </div>

        <br>
        <a href="JavaScript:selectAll();" style="margin-left:20px ;border-radius: 5px;padding: 10px;text-decoration: none;color: #fff;background: dodgerblue">全选</a>
        <a href="JavaScript:notSelectAll();" style="margin-left:20px ;border-radius: 5px;padding: 10px;text-decoration: none;color: #fff;background: dodgerblue">反选</a>

        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-border table-striped custom-table datatable mb-0">
                        <thead>
                        <tr>
                            <th><input name="checkAll" type="checkbox" id="selAll" onclick="selectAll();"></th>
                            <th>ID</th>
                            <th>工作名</th>
                            <th>联系人</th>
                            <th>职位id</th>
                            <th>公司id</th>
                            <th>地址</th>
                            <th>时间</th>
                            <th>薪水</th>
                            <th>薪水</th>
                            <th>福利</th>

                            <th class="text-center" colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>


                        <c:forEach items="${requestScope.jobs}" var="job">
                            <tr>
                                <td><input name="checkAll" id="checkAll" onclick="setSelectAll();" type="checkbox"></td>
                                <td>${job.id}</td>
                                <td>${job.title}</td>
                                <td>${job.contact}</td>
                                <td>${job.position_id}</td>
                                <td>${job.company_id}</td>
                                <td>${job.area}</td>
                                <td>${job.time}</td>
                                <td>${job.salary}</td>
                                <td>${job.welfare}</td>

                                <td class="text-center">
                                    <a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/pages/adminUpdatejob.jsp?jobid=${job.id}"
                                       data-toggle="modal"
                                       data-target="#delete_patient">修改</a>
                                </td>
                                <td class="text-center">
                                    <a class="dropdown-item"
                                       href="${pageContext.request.contextPath}/admin?action=delete&function=job&id=${job.id}"
                                       data-toggle="modal"
                                       data-target="#delete_patient">删除</a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="delete_patient" class="modal fade delete-modal" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center">
                <img src="../static/images/sent.png" alt="" width="50" height="46">
                <h3>确定删除此用户吗?</h3>
                <div class="m-t-20"><a href="#" class="btn btn-white" data-dismiss="modal">取消</a>
                    <button type="submit" class="btn btn-danger">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
</div>

<div class="sidebar-overlay" data-reff=""></div>
<script>
    function search() {
        let search = document.getElementById("input-search");
        let keyword = search.value;
        if (keyword !== '') {
            location.href = "${pageContext.request.contextPath}/pages/adminJob.jsp?search=" + keyword;
        } else {
            location.href = "${pageContext.request.contextPath}/pages/adminJob.jsp";
        }
    }



        var selAll = document.getElementById("setAll");

        function selectAll() {
            var obj = document.getElementsByName("checkAll");
            if (document.getElementById("setAll").checked = false) {
                for (var i = 0; i < obj.length; i++) {
                    obj[i].checked = false;
                }
            } else {
                for (var i = 0; i < obj.length; i++) {
                    obj[i].checked = true;
                }
                document.getElementById("inverse1").checked === false;
            }
            // notSelectAll();
        }

        function setSelectAll() {
            var obj = document.getElementsByName("checkAll");
            obj[0].checked =true;
            var count = obj.length;
            var selectCount = 0;

            for (var i = 0; i < count; i++) {
                if (obj[i].checked === true) {
                    selectCount++;
                }
            }
            if (count === selectCount) {
                document.all.selAll.checked = true;

            } else {
                document.all.selAll.checked = false;
            }
        }

        function notSelectAll() {
            var checkboxs = document.getElementsByName("checkAll");
            for (var i = 0; i < checkboxs.length; i++) {
                var e = checkboxs[i];
                e.checked = !e.checked;
                setSelectAll();
            }
        }


        var count = 0;
        function selectAll() {
            var checkboxs = document.getElementsByName("checkAll");
            if (count==0){
                for (var i = 0; i < checkboxs.length; i++) {
                    var e = checkboxs[i];
                    e.checked = true;
                }
                count = 1;
            }else {
                for (var i = 0; i < checkboxs.length; i++) {
                    var e = checkboxs[i];
                    e.checked = false;

                }
                count = 0;
            }
    }
</script>
<script src="../static/vendor/jquery.3.4.1.js"></script>
<script src="../static/js/popper.min.js"></script>
<script src="../static/vendor/bootstrap.min.js"></script>
</body>
<style>
    html {
        height: 100%;
    }

    body {
        font-family: 'Rubik', sans-serif;
        font-size: 0.875rem;
        color: #666;
        background-color: #fafafa;
        overflow-x: hidden;
        height: 100%;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
        margin-top: 0;
    }

    h1,
    .h1 {
        font-size: 2.25rem;
    }

    h2,
    .h2 {
        font-size: 1.875rem;
    }

    h3,
    .h3 {
        font-size: 1.5rem;
    }

    h4,
    .h4 {
        font-size: 1.125rem;
    }

    h5,
    .h5 {
        font-size: 0.875rem;
    }

    h6,
    .h6 {
        font-size: 0.75rem;
    }

    a:hover,
    a:active,
    a:focus {
        text-decoration: none;
        color: #009ce7;
        outline: none;
    }

    .form-control {
        border-radius: 0;
        box-shadow: none;
        padding: 0.469rem 0.75rem;
        border-color: #eaeaea;
        font-size: 14px;
        min-height: 40px;
    }

    .form-control:focus {
        border-color: #009efb;
        box-shadow: none;
        outline: 0 none;
    }

    a {
        color: #009ce7;
    }

    input,
    button,
    a {
        transition: all 0.4s ease;
        -moz-transition: all 0.4s ease;
        -o-transition: all 0.4s ease;
        -ms-transition: all 0.4s ease;
        -webkit-transition: all 0.4s ease;
    }

    input,
    button {
        outline: none;
    }

    input[type="file"] {
        height: auto;
        padding: 6px 0.75rem;
    }

    input[type=text],
    input[type=password] {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    textarea.form-control {
        resize: vertical;
    }

    .navbar-nav > li {
        float: left;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .display-block {
        display: block;
    }

    .btn.rounded {
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    }

    .btn.focus,
    .btn:focus {
        box-shadow: inherit !important;
    }

    .list-group-item {
        border: 1px solid #eaeaea;
    }

    /*-----------------
	2. Table
-----------------------*/

    .table {
        color: #000;
        border: 1px solid #f0f0f0;
    }

    .table.table-white {
        background-color: #fff;
    }

    .table > tbody > tr > td {
        font-weight: 300;
    }

    .table-striped > tbody > tr:nth-of-type(2n + 1) {
        background-color: #f6f6f6;
    }

    table.table td .avatar {
        margin: 0 5px 0 0;
    }

    table.table td h2 {
        display: inline-block;
        font-size: inherit;
        font-weight: 400;
        margin: 0;
        padding: 0;
        vertical-align: middle;
    }

    table.table td h2 a {
        color: #757575;
    }

    table.table td h2 a:hover {
        color: #009efb;
    }

    table.table td h2 span {
        color: #9e9e9e;
        display: block;
        font-size: 12px;
        margin-top: 3px;
    }

    /*-----------------
	3. Helper Class
-----------------------*/

    .m-r-5 {
        margin-right: 5px !important;
    }

    .m-r-10 {
        margin-right: 10px !important;
    }

    .m-l-5 {
        margin-left: 5px !important;
    }

    .m-t-0 {
        margin-top: 0 !important;
    }

    .m-t-10 {
        margin-top: 10px !important;
    }

    .m-t-20 {
        margin-top: 20px !important;
    }

    .m-t-30 {
        margin-top: 30px !important;
    }

    .m-t-50 {
        margin-top: 50px !important;
    }

    .m-b-10 {
        margin-bottom: 10px !important;
    }

    .m-b-20 {
        margin-bottom: 20px !important;
    }

    .m-b-30 {
        margin-bottom: 30px !important;
    }

    .w-40 {
        width: 40px;
    }

    .block {
        display: block !important;
    }

    .text-ellipsis {
        display: block;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .text-muted-light {
        color: #aaa;
    }

    .card-box {
        background-color: #fff;
        border-radius: 4px;
        margin-bottom: 30px;
        padding: 20px;
        position: relative;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    }

    .card-title {
        color: #333;
        font-size: 16px;
        margin-bottom: 20px;
    }

    .page-title {
        color: #565656;
        font-size: 21px;
        font-weight: normal;
        margin-bottom: 20px;
    }

    .page-sub-title {
        color: #565656;
        font-size: 18px;
        font-weight: normal;
        margin-bottom: 20px;
    }

    .cal-icon {
        position: relative;
        width: 100%;
    }

    .time-icon {
        position: relative;
        width: 100%;
    }

    .badge-success-border {
        border: 1px solid #55ce63;
        color: #55ce63;
        background-color: #fff;
        display: inline-block;
        min-width: 80px;
    }

    .badge-danger-border {
        border: 1px solid #f62d51;
        color: #f62d51;
        background-color: #fff;
        display: inline-block;
        min-width: 80px;
    }

    .badge-warning-border {
        border: 1px solid #ffbc34;
        color: #ffbc34;
        background-color: #fff;
        display: inline-block;
        min-width: 80px;
    }

    .badge-info-border {
        border: 1px solid #009efb;
        color: #009efb;
        background-color: #fff;
        display: inline-block;
        min-width: 80px;
    }

    .modal-footer.text-left {
        text-align: left;
    }

    .modal-footer.text-center {
        text-align: center;
    }

    .font-18 {
        font-size: 18px;
    }

    .border-right {
        border-right: 1px solid #e7e7e7;
    }

    .blur {
        -webkit-filter: blur(3px);
        -moz-filter: blur(3px);
        -o-filter: blur(3px);
        -ms-filter: blur(3px);
        filter: blur(3px);
    }

    .btn {
        font-size: 0.875rem;
    }

    /*-----------------
	4. Bootstrap Classes
-----------------------*/

    .btn-white {
        background-color: #fff;
        border: 1px solid #ccc;
        color: #333;
    }

    .rounded,
    .circle {
        border-radius: 500px;
    }

    .bg-primary,
    .badge-primary {
        background-color: #009efb !important;
    }

    .bg-success,
    .badge-success {
        background-color: #55ce63 !important;
    }

    .bg-info,
    .badge-info {
        background-color: #009efb !important;
    }

    .bg-warning,
    .badge-warning {
        background-color: #ffbc34 !important;
    }

    .bg-danger,
    .badge-danger {
        background-color: #f62d51 !important;
    }

    .bg-white {
        background-color: #fff;
    }

    .text-primary,
    .dropdown-menu > li > a.text-primary {
        color: #009efb !important;
    }

    .text-success,
    .dropdown-menu > li > a.text-success {
        color: #55ce63;
    }

    .text-danger,
    .dropdown-menu > li > a.text-danger {
        color: #f62d51;
    }

    .text-info,
    .dropdown-menu > li > a.text-info {
        color: #009efb;
    }

    .text-warning,
    .dropdown-menu > li > a.text-warning {
        color: #ffbc34;
    }

    .text-purple,
    .dropdown-menu > li > a.text-purple {
        color: #7460ee;
    }

    .btn-primary {
        border-color: transparent;
        background-color: #009efb;
    }

    .btn-primary:hover,
    .btn-primary:focus,
    .btn-primary.active,
    .btn-primary:active,
    .open > .dropdown-toggle.btn-primary {
        background-color: #009efb;
        border: 1px solid #009efb;
        color: #fff;
    }

    .btn-primary.active.focus,
    .btn-primary.active:focus,
    .btn-primary.active:hover,
    .btn-primary.focus:active,
    .btn-primary:active:focus,
    .btn-primary:active:hover,
    .open > .dropdown-toggle.btn-primary.focus,
    .open > .dropdown-toggle.btn-primary:focus,
    .open > .dropdown-toggle.btn-primary:hover {
        background-color: #009efb;
        border: 1px solid #009efb;
    }

    .btn-primary.active:not(:disabled):not(.disabled),
    .btn-primary:active:not(:disabled):not(.disabled),
    .show > .btn-primary.dropdown-toggle {
        background-color: #009efb;
        border-color: #009efb;
        color: #fff;
    }

    .btn-outline-primary {
        border-color: #009efb;
        color: #009efb;
    }

    .btn-outline-primary:hover {
        background-color: #009efb;
        border-color: #009efb;
        color: #fff;
    }

    .btn-outline-primary.active:not(:disabled):not(.disabled),
    .btn-outline-primary:active:not(:disabled):not(.disabled),
    .show > .btn-outline-primary.dropdown-toggle {
        background-color: #009efb;
        border-color: #009efb;
        color: #fff;
    }

    .btn-success {
        background-color: #55ce63;
        border: 1px solid #55ce63
    }

    .btn-success:hover,
    .btn-success:focus,
    .btn-success.active,
    .btn-success:active,
    .open > .dropdown-toggle.btn-success {
        background: #4ab657;
        border: 1px solid #4ab657
    }

    .btn-success.active.focus,
    .btn-success.active:focus,
    .btn-success.active:hover,
    .btn-success.focus:active,
    .btn-success:active:focus,
    .btn-success:active:hover,
    .open > .dropdown-toggle.btn-success.focus,
    .open > .dropdown-toggle.btn-success:focus,
    .open > .dropdown-toggle.btn-success:hover {
        background: #4ab657;
        border: 1px solid #4ab657
    }

    .btn-info {
        background-color: #009efb;
        border: 1px solid #009efb
    }

    .btn-info:hover,
    .btn-info:focus,
    .btn-info.active,
    .btn-info:active,
    .open > .dropdown-toggle.btn-info {
        background-color: #028ee1;
        border: 1px solid #028ee1
    }

    .btn-info.active.focus,
    .btn-info.active:focus,
    .btn-info.active:hover,
    .btn-info.focus:active,
    .btn-info:active:focus,
    .btn-info:active:hover,
    .open > .dropdown-toggle.btn-info.focus,
    .open > .dropdown-toggle.btn-info:focus,
    .open > .dropdown-toggle.btn-info:hover {
        background-color: #028ee1;
        border: 1px solid #028ee1
    }

    .btn-warning {
        background: #ffbc34;
        border: 1px solid #ffbc34
    }

    .btn-warning:hover,
    .btn-warning:focus,
    .btn-warning.active,
    .btn-warning:active,
    .open > .dropdown-toggle.btn-warning {
        background: #e9ab2e;
        border: 1px solid #e9ab2e
    }

    .btn-warning.active.focus,
    .btn-warning.active:focus,
    .btn-warning.active:hover,
    .btn-warning.focus:active,
    .btn-warning:active:focus,
    .btn-warning:active:hover,
    .open > .dropdown-toggle.btn-warning.focus,
    .open > .dropdown-toggle.btn-warning:focus,
    .open > .dropdown-toggle.btn-warning:hover {
        background: #e9ab2e;
        border: 1px solid #e9ab2e
    }

    .btn-danger {
        background: #f62d51;
        border: 1px solid #f62d51
    }

    .btn-danger:hover,
    .btn-danger:focus {
        background-color: #e6294b;
        border: 1px solid #e6294b
    }

    .pagination > .active > a,
    .pagination > .active > a:focus,
    .pagination > .active > a:hover,
    .pagination > .active > span,
    .pagination > .active > span:focus,
    .pagination > .active > span:hover {
        background-color: #009efb;
        border-color: #009efb;
    }

    .pagination > li > a,
    .pagination > li > span {
        color: #009efb;
        padding: .5rem .75rem !important;
    }

    .page-item.active .page-link {
        background-color: #009efb;
        border-color: #009efb;
    }

    .dropdown-menu {
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 3px;
        transform-origin: left top 0;
        box-shadow: inherit;
        background-color: #fff;
    }

    .navbar-nav .open .dropdown-menu {
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, 0.1);
    }

    .btn-group-xs > .btn,
    .btn-xs {
        min-height: 22px;
        min-width: 22px;
    }

    .dropdown-menu {
        font-size: 13px;
    }

    .btn-link,
    .btn-link:hover,
    .btn-link:focus,
    .btn-link:active {
        box-shadow: none;
    }

    .btn-link {
        color: #333;
    }

    .nav .open > a,
    .nav .open > a:focus,
    .nav .open > a:hover {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .card {
        margin-bottom: 30px;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
        border: 0;
    }

    .card-title {
        margin-bottom: 1.125rem;
    }

    .dropdown-action .dropdown-toggle:after {
        display: none;
    }

    .badge.badge-pill {
        border-radius: 10rem;
    }

    .badge-primary {
        color: #fff;
    }

    .btn.btn-rounded {
        border-radius: 50px;
    }

    .nav-tabs .nav-link:focus,
    .nav-tabs .nav-link:hover {
        background-color: #eee;
        border-color: transparent;
    }

    .nav-tabs .nav-link {
        border-radius: 0;
    }

    .table.dataTable {
        border-collapse: collapse !important;
    }

    textarea.form-control {
        height: auto;
    }

    .progress-example .progress {
        margin-bottom: 1.5rem;
    }

    .progress-xs {
        height: 4px;
    }

    .progress-sm {
        height: 15px;
    }

    .progress.progress-sm {
        height: 6px;
    }

    .progress.progress-md {
        height: 8px;
    }

    .progress.progress-lg {
        height: 18px;
    }

    .form-control.form-control-sm {
        padding: 0.25rem 0.5rem;
    }

    .card .card-header {
        background-color: rgba(255, 255, 255, 0.1);
        border: 0 none;
        font-size: 16px;
        line-height: 30px;
        padding: 15px;
    }

    .card .card-header .card-title {
        font-size: 18px;
        font-weight: 400;
        line-height: 20px;
        margin: 0;
        padding: 5px 0;
    }

    .table h5 {
        font-size: 14px;
        font-weight: 400;
        line-height: 18px;
        margin-bottom: 0;
        vertical-align: middle;
    }

    .table h5 + p {
        color: #9e9e9e;
        font-size: 14px;
        line-height: 18px;
        margin-bottom: 0;
    }

    .page-link:focus {
        box-shadow: unset;
    }

    /*-----------------
	5. Header
-----------------------*/

    .header {
        background-color: #009efb;
        left: 0;
        position: fixed;
        right: 0;
        top: 0;
        z-index: 1039;
        height: 50px;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
    }

    .header .header-left {
        float: left;
        height: 50px;
        padding: 0 20px;
        position: relative;
        text-align: center;
        width: 230px;
        z-index: 1;
    }

    .logo {
        align-items: center;
        display: flex;
        height: 50px;
        justify-content: center;
    }

    .logo span {
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        margin-left: 10px;
    }

    .header .navbar-nav .badge {
        position: absolute;
        right: 7px;
        top: 4px;
    }

    .header .dropdown-menu > li > a {
        position: relative;
    }

    .header .dropdown-toggle:after {
        display: none;
    }

    .header .has-arrow .dropdown-toggle:after {
        display: inline-block;
    }

    .page-title-box {
        border-radius: 0;
        height: 50px;
        margin-bottom: 0;
        padding: 14px 20px;
    }

    .page-title-box h3 {
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        margin: 0;
    }

    .user-menu {
        margin: 0;
        position: relative;
        z-index: 99;
    }

    .user-menu.nav > li > a {
        color: #fff;
        font-size: 16px;
        line-height: 50px;
        padding: 0 15px;
        height: 50px;
    }

    .user-menu.nav > li > a:hover,
    .user-menu.nav > li > a:focus {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .user-img {
        display: inline-block;
        position: relative;
    }

    .header .user-img img {
        width: 24px;
    }

    .user-img .status {
        border: 2px solid #fff;
        bottom: 0;
        height: 10px;
        position: absolute;
        right: 0;
        width: 10px;
    }

    .user-menu .user-img .status {
        bottom: 10px;
    }

    .user-menu .dropdown-menu {
        min-width: 136px;
    }

    .user-menu .bg-primary {
        background-color: #009efb !important;
    }

    .status {
        background-color: #ccc;
        border-radius: 50%;
        display: inline-block;
        height: 10px;
        width: 10px;
    }

    .status.online {
        background-color: #55ce63;
    }

    .status.offline {
        background-color: #f62d51;
    }

    .status.away {
        background-color: #faa937;
    }

    /*-----------------
	6. Sidebar
-----------------------*/

    .sidebar {
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
        top: 50px;
        width: 230px;
        z-index: 1039;
        background-color: #fff;
        bottom: 0;
        margin-top: 0px;
        position: fixed;
        left: 0;
        transition: all 0.2s ease-in-out;
    }

    .sidebar.opened {
        -webkit-transition: all 0.4s ease;
        -moz-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .sidebar-inner {
        height: 100%;
        transition: all 0.2s ease-in-out 0s;
    }

    .sidebar-menu ul {
        font-size: 14px;
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    .sidebar-menu li a {
        color: #888;
        display: block;
        font-size: 15px;
        height: auto;
        padding: 0 20px;
    }

    .sidebar-menu li a:hover {
        color: #009efb;
    }

    .sidebar-menu li.active a {
        color: #009efb;
        background-color: #f3f3f3;
    }

    .menu-title {
        color: #333;
        font-size: 15px;
        font-weight: 500;
        padding: 12px 20px;
    }

    .menu-title > i {
        float: right;
        line-height: 40px;
    }

    .sidebar-menu li.menu-title a {
        color: #009efb;
        display: inline-block;
        float: right;
        padding: 0;
    }

    .sidebar-menu li.menu-title a.btn {
        color: #fff;
        display: block;
        float: none;
        font-size: 15px;
        line-height: inherit;
        margin-bottom: 15px;
    }

    .sidebar-menu ul ul a.active {
        color: #009efb;
        text-decoration: underline;
    }

    .mobile-user-menu {
        color: #fff;
        display: none;
        font-size: 24px;
        height: 50px;
        line-height: 50px;
        padding: 0 20px;
        position: absolute;
        right: 0;
        text-align: right;
        top: 0;
        width: 50px;
        z-index: 10;
    }

    .mobile-user-menu > a {
        color: #fff;
        padding: 0;
    }

    .mobile-user-menu > a:hover {
        color: #fff;
    }

    .mobile-user-menu > .dropdown-menu > a {
        line-height: 23px;
    }

    .profile-rightbar {
        display: none !important;
        color: #009efb;
        font-size: 26px;
        margin-left: 15px;
    }

    .fixed-sidebar-right {
        position: fixed;
        top: 60px;
        right: 0;
        width: 300px;
        margin-right: -300px;
        bottom: 0;
        z-index: 101;
        -webkit-transition: all 0.4s ease;
        -moz-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .mobile_btn {
        display: none;
    }

    .sidebar .sidebar-menu > ul > li > a span {
        transition: all 0.2s ease-in-out 0s;
        display: inline-block;
        margin-left: 10px;
        white-space: nowrap;
    }

    .sidebar .sidebar-menu > ul > li > a span.badge {
        color: #fff;
        margin-left: auto;
    }

    .sidebar-menu ul ul a {
        display: block;
        font-size: 14px;
        padding: 9px 10px 9px 50px;
        position: relative;
    }

    .sidebar-menu ul ul {
        background-color: #f3f3f3;
        display: none;
    }

    .sidebar-menu ul ul ul a {
        padding-left: 70px;
    }

    .sidebar-menu ul ul ul ul a {
        padding-left: 90px;
    }

    .sidebar-menu > ul > li {
        position: relative;
    }

    .sidebar-menu .menu-arrow {
        -webkit-transition: -webkit-transform 0.15s;
        -o-transition: -o-transform 0.15s;
        transition: transform .15s;
        position: absolute;
        right: 15px;
        display: inline-block;
        font-family: 'FontAwesome';
        text-rendering: auto;
        line-height: 40px;
        font-size: 18px;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        -webkit-transform: translate(0, 0);
        -ms-transform: translate(0, 0);
        -o-transform: translate(0, 0);
        transform: translate(0, 0);
        line-height: 18px;
        top: 15px;
    }

    .sidebar-menu .menu-arrow:before {
        content: "\f105";
    }

    .sidebar-menu li a.subdrop .menu-arrow {
        -ms-transform: rotate(90deg);
        -webkit-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
    }

    .sidebar-menu ul ul a .menu-arrow {
        top: 6px;
    }

    .sidebar-menu a {
        transition: unset;
        -moz-transition: unset;
        -o-transition: unset;
        -ms-transition: unset;
        -webkit-transition: unset;
    }

    .sidebar-menu > ul > li > a {
        padding: 12px 20px;
        align-items: center;
        display: flex;
        justify-content: flex-start;
        position: relative;
        transition: all 0.2s ease-in-out 0s;
    }

    .sidebar-menu ul li a i {
        align-items: center;
        display: inline-flex;
        font-size: 18px;
        min-height: 24px;
        line-height: 18px;
        width: 20px;
        transition: all 0.2s ease-in-out 0s;
    }

    .sidebar-menu ul li.menu-title a i {
        font-size: 16px;
        margin-right: 0;
        text-align: right;
        width: auto;
    }

    /*-----------------
	7. Content
-----------------------*/

    .page-wrapper {
        left: 0;
        margin-left: 230px;
        padding-top: 50px;
        position: relative;
        -webkit-transition: all 0.4s ease;
        -moz-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .page-wrapper > .content {
        padding: 30px;
    }

    /*-----------------
	8. Login
-----------------------*/

    .account-page {
        display: table-row;
        height: 100%;
        padding: 40px 0;
    }

    .account-title {
        font-size: 32px;
        font-weight: normal;
        margin: 0 0 40px;
        text-align: center;
    }

    .account-wrapper {
        display: table;
        table-layout: fixed;
        height: 100%;
        padding: 30px;
        width: 100%;
    }

    .account-center {
        display: table-cell;
        vertical-align: middle;
    }

    .account-box {
        background-color: #fff;
        border: 1px solid #eaeaea;
        margin: 0 auto;
        padding: 20px;
        width: 400px;
    }

    .account-logo {
        margin-bottom: 20px;
        text-align: center;
    }

    .account-box .form-group {
        margin-bottom: 20px;
    }

    .account-box a {
        color: #333;
        font-size: 14px;
    }

    .account-box a:hover {
        color: #009efb;
    }

    .account-box .form-control {
        border: 1px solid #eaeaea;
        border-radius: 0;
        box-shadow: inherit;
        font-size: 14px;
        height: 40px;
    }

    .account-box textarea.form-control {
        height: 130px;
    }

    .account-box label {
        color: #323232;
        font-size: 14px;
        font-weight: normal;
    }

    .account-logo img {
        max-height: 60px;
        width: auto;
    }

    .account-box .account-btn {
        border-radius: 50px;
        font-size: 16px;
        min-width: 150px;
        padding: 8px 30px;
        text-transform: uppercase;
    }

    /*-----------------
	9. Dashboard
-----------------------*/

    .dash-widget {
        background-color: #fff;
        border-radius: 4px;
        margin-bottom: 30px;
        padding: 20px;
        position: relative;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    }

    .dash-widget-bg1 {
        width: 65px;
        float: left;
        color: #fff;
        display: block;
        font-size: 50px;
        text-align: center;
        line-height: 65px;
        background: #009efb;
        border-radius: 50%;
        font-size: 40px;
        height: 65px;
    }

    .dash-widget-bg2 {
        width: 65px;
        float: left;
        color: #fff;
        display: block;
        font-size: 50px;
        text-align: center;
        line-height: 65px;
        background: #55ce63;
        border-radius: 50%;
        font-size: 40px;
        height: 65px;
    }

    .dash-widget-bg3 {
        width: 65px;
        float: left;
        color: #fff;
        display: block;
        font-size: 50px;
        text-align: center;
        line-height: 65px;
        background: #7a92a3;
        border-radius: 50%;
        font-size: 40px;
        height: 65px;
    }

    .dash-widget-bg4 {
        width: 65px;
        float: left;
        color: #fff;
        display: block;
        font-size: 50px;
        text-align: center;
        line-height: 65px;
        background: #ffbc35;
        border-radius: 50%;
        font-size: 40px;
        height: 65px;
    }

    .card-table.card-table-top .card-body {
        height: 175px;
        overflow-y: auto;
        -webkit-overflow-scrolling: touch;
    }

    .chart-title {
        margin-bottom: 25px;
    }

    .chart-title h4 {
        display: inline-block;
        font-size: 18px;
        font-weight: 400;
        line-height: 20px;
        margin: 0;
        color: #333;
    }

    .chart-title span {
        color: #009efb;
    }

    .card-title > a.btn {
        color: #fff;
    }

    ul.chat-user-total li {
        display: inline-block;
        color: #999;
    }

    ul.chat-user-total li i.current-users {
        color: #009efb;
        padding-right: 5px;
    }

    ul.chat-user-total li i.old-users {
        color: #eaeaea;
        padding-right: 5px;
    }

    .new-patient-table {
        display: table;
    }

    .new-patient-table td, .new-patient-table th {
        vertical-align: middle;
    }

    .new-patient-table tr td img {
        margin-right: 5px;
    }

    .btn-primary-one {
        border: 1px solid #ffbc35;
        border-radius: 25px;
        width: 100px;
        background: transparent;
        color: #000;
    }

    .btn-primary-two {
        border: 1px solid #009efb;
        border-radius: 25px;
        width: 100px;
        background: transparent;
        color: #000;
    }

    .btn-primary-three {
        border: 1px solid #55ce63;
        border-radius: 25px;
        width: 100px;
        background: transparent;
        color: #000;
    }

    .btn-primary-four {
        border: 1px solid #ffbc35;
        border-radius: 25px;
        width: 100px;
        background: transparent;
        color: #000;
    }

    .bar-chart {
        position: relative;
        width: 100%;
        margin-top: 15px;
    }

    .bar-chart > .legend {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 40px;
        margin-bottom: -45px;
        border-top: 1px solid #000;
    }

    .bar-chart > .legend > .item {
        position: relative;
        display: inline-block;
        float: left;
        width: 25%;
    }

    .bar-chart > .legend > .item:before {
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        content: '';
        width: 1px;
        height: 8px;
        background-color: #000;
        margin-top: -8px;
    }

    .bar-chart > .legend > .item.text-right:before {
        right: 0;
        left: auto;
    }

    .bar-chart > .legend > .item h4 {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 1px;
        padding-top: 5px;
    }

    .bar-chart > .chart {
        position: relative;
        width: 100%;
    }

    .bar-chart > .chart > .item {
        position: relative;
        width: 100%;
        height: 40px;
        margin-bottom: 10px;
        color: #fff;
        text-transform: uppercase;
    }

    .bar-chart > .chart > .item > .bar {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #ffbc35;
        z-index: 5;
    }

    .bar-chart > .chart > .item > .bar > .percent {
        display: block;
        position: absolute;
        top: 0;
        right: 0;
        height: 40px;
        line-height: 40px;
        padding-right: 12px;
        z-index: 15;
    }

    .bar-chart > .chart > .item > .bar > .item-progress {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        background-color: #009efb;
        z-index: 10;
    }

    .bar-chart > .chart > .item > .bar > .item-progress > .title {
        display: block;
        position: absolute;
        height: 40px;
        line-height: 40px;
        padding-left: 12px;
        letter-spacing: 2px;
        z-index: 15;
    }

    .hospital-barchart h4 {
        display: inline-block;
        font-size: 18px;
        font-weight: 400;
        line-height: 20px;
        margin: 0;
        color: #333;
    }

    .custom-table tr {
        background-color: #fff;
        box-shadow: 0 0 3px #e5e5e5;
    }

    .table.custom-table > tbody > tr > td,
    .table.custom-table > tbody > tr > th,
    .table.custom-table > tfoot > tr > td,
    .table.custom-table > tfoot > tr > th,
    .table.custom-table > thead > tr > td,
    .table.custom-table > thead > tr > th {
        padding: 10px 8px;
        vertical-align: middle;
    }

    .dash-widget-info > h3 {
        font-size: 24px;
        font-weight: 500;
        margin-bottom: 0.5rem;
    }

    .dash-widget-info span i {
        width: 16px;
        background: #fff;
        border-radius: 50%;
        color: #666666;
        font-size: 9px;
        height: 16px;
        line-height: 16px;
        text-align: center;
        margin-left: 5px;
    }

    .dash-widget-info > span.widget-title1 {
        background: #009efb;
        color: #fff;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 13px;
    }

    .dash-widget-info > span.widget-title2 {
        background: #55ce63;
        color: #fff;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 13px;
    }

    .dash-widget-info > span.widget-title3 {
        background: #7a92a3;
        color: #fff;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 13px;
    }

    .dash-widget-info > span.widget-title4 {
        background: #ffbc35;
        color: #fff;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 13px;
    }

    .member-panel .contact-list > li:last-child {
        border-bottom: 0;
    }

    .member-panel .card-body {
        overflow-y: auto;
        height: 275px;
        -webkit-overflow-scrolling: touch;
        padding: 0;
    }

    .contact-list {
        list-style: none;
        padding-left: 0;
        margin: 0;
    }

    .contact-list > li {
        border-bottom: 1px solid #eaeaea;
        border-radius: inherit;
        padding: 10px;
        background-color: #fff;
    }

    .contact-cont {
        position: relative;
    }

    .contact-info {
        padding: 0 30px 0 50px;
    }

    .contact-date {
        color: #888;
        font-size: 12px;
    }

    .take-btn {
        min-width: 80px;
    }

    /*-----------------
	10. Activity
-----------------------*/

    .activity-box {
        position: relative;
    }

    .activity-list {
        list-style: none;
        margin: 0;
        padding: 0;
        position: relative;
    }

    .activity .activity-list > li .activity-user {
        height: 32px;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 12px;
        left: 8px;
        width: 32px;
    }

    .activity .activity-list > li .activity-content {
        background-color: #fff;
        margin: 0 0 0 40px;
        padding: 0;
        position: relative;
    }

    .activity-list > li {
        background-color: #fff;
        margin-bottom: 10px;
        padding: 10px;
        position: relative;
        border: 1px solid #e7e7e7;
    }

    .activity-list > li:last-child .activity-content {
        margin-bottom: 0;
    }

    .activity-user .avatar {
        height: 32px;
        line-height: 32px;
        margin: 0;
        width: 32px;
    }

    .activity-list > li .activity-user {
        background: #fff;
        height: 32px;
        left: -7px;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 3px;
        width: 32px;
    }

    .activity-list > li .activity-content {
        background-color: #fff;
        margin: 0 0 20px 40px;
        padding: 0;
        position: relative;
    }

    .activity-list > li .activity-content .timeline-content {
        color: #9e9e9e;
    }

    .activity-list > li .activity-content .timeline-content a.name {
        color: #000;
    }

    .activity-list > li .time {
        color: #bdbdbd;
        display: block;
        font-size: 12px;
        line-height: 1.35;
    }

    .activity .timeline-content > a {
        color: #009efb;
    }

    .activity-delete {
        background-color: #ffe5e6;
        border: 1px solid #fe0000;
        color: #fe0000;
        display: none;
        font-size: 20px;
        height: 20px;
        line-height: 18px;
        position: absolute;
        right: 0;
        text-align: center;
        top: 0;
        width: 20px;
    }

    .activity-delete:hover {
        background-color: #fe0000;
        color: #fff;
    }

    .activity-list > li:hover .activity-delete {
        display: inline-block;
    }

    /*-----------------
	11. Select2
-----------------------*/

    .select2-container .select2-selection--single {
        border: 1px solid #eaeaea;
        height: 40px;
        border-radius: 0;
    }

    .select2-container--default .select2-selection--single .select2-selection__arrow {
        height: 38px;
        right: 7px;
    }

    .select2-container--default .select2-selection--single .select2-selection__arrow b {
        border-color: #979797 transparent transparent;
        border-style: solid;
        border-width: 6px 6px 0;
        height: 0;
        left: 50%;
        margin-left: -10px;
        margin-top: -2px;
        position: absolute;
        top: 50%;
        width: 0;
    }

    .select2-container--default.select2-container--open .select2-selection--single .select2-selection__arrow b {
        border-color: transparent transparent #979797;
        border-width: 0 6px 6px;
    }

    .select2-container .select2-selection--single .select2-selection__rendered {
        padding-right: 30px;
        padding-left: 15px;
    }

    .select2-container--default .select2-selection--single .select2-selection__rendered {
        color: #676767;
        font-size: 14px;
        font-weight: normal;
        line-height: 38px;
    }

    .select2-container--default .select2-results__option--highlighted[aria-selected] {
        background-color: #009efb;
    }

    .select2-container--default.select2-container--focus .select2-selection--multiple {
        border: 1px solid #eaeaea;
        border-radius: 0;
    }

    .select2-container--default .select2-selection--multiple {
        border: 1px solid #eaeaea;
        border-radius: 0;
    }

    .select2-container .select2-selection--multiple {
        min-height: 40px;
    }

    /*-----------------
	12. Nav tabs
-----------------------*/

    .nav-tabs > li > a {
        margin-right: 0;
        color: #888;
        border-radius: 0;
    }

    .nav-tabs > li > a:hover,
    .nav-tabs > li > a:focus {
        border-color: transparent;
        color: #333;
    }

    .nav-tabs.nav-justified > li > a {
        border-radius: 0;
        margin-bottom: 0;
    }

    .nav-tabs.nav-justified.nav-tabs-solid > li > a {
        border-color: transparent;
    }

    .nav-tabs.nav-tabs-solid > li > a {
        color: #333;
    }

    .nav-tabs.nav-tabs-solid > li > a.active,
    .nav-tabs.nav-tabs-solid > li > a.active:hover,
    .nav-tabs.nav-tabs-solid > li > a.active:focus {
        background-color: #009efb;
        border-color: #009efb;
        color: #fff;
    }

    .nav-tabs.nav-tabs-solid.nav-tabs-rounded {
        border-radius: 50px;
    }

    .nav-tabs.nav-tabs-solid.nav-tabs-rounded > li > a {
        border-radius: 50px;
    }

    .nav-tabs.nav-tabs-solid.nav-tabs-rounded > li > a.active,
    .nav-tabs.nav-tabs-solid.nav-tabs-rounded > li > a.active:hover,
    .nav-tabs.nav-tabs-solid.nav-tabs-rounded > li > a.active:focus {
        border-radius: 50px;
    }

    .nav-tabs-justified > li > a {
        border-radius: 0;
        margin-bottom: 0;
    }

    .nav-tabs-justified > li > a:hover,
    .nav-tabs-justified > li > a:focus {
        border-bottom-color: #ddd;
    }

    .nav-tabs-justified.nav-tabs-solid > li > a {
        border-color: transparent;
    }

    /*-----------------
	13. Holidays
-----------------------*/

    .custom-table tr.holiday-completed {
        color: #aaa;
    }

    .modal-header.bg-danger .modal-title {
        color: #fff;
    }

    .dropdown.action-label {
        display: inline-block;
    }

    .action-label > a {
        display: inline-block;
        min-width: 103px;
    }

    .action-label .btn-sm {
        padding: 5px;
    }

    /*-----------------
	14. Edit Profile
-----------------------*/

    .profile-img-wrap {
        height: 120px;
        position: absolute;
        width: 120px;
        background: #fff;
        overflow: hidden;
    }

    .profile-basic {
        margin-left: 140px;
    }

    .profile-img-wrap img {
        width: 120px;
        height: 120px;
    }

    .fileupload.btn {
        position: absolute;
        right: 0;
        bottom: 0;
        background: rgba(33, 33, 33, 0.5);
        border-radius: 0;
        padding: 3px 10px;
        border: none;
    }

    .fileupload input.upload {
        cursor: pointer;
        filter: alpha(opacity=0);
        font-size: 20px;
        margin: 0;
        opacity: 0;
        padding: 0;
        position: absolute;
        right: -3px;
        top: -3px;
        padding: 5px;
    }

    .btn-text {
        color: #fff;
    }

    /*-----------------
	15. Chat
-----------------------*/

    .chat-main-row {
        bottom: 0;
        left: 0;
        overflow: auto;
        padding-bottom: inherit;
        padding-top: inherit;
        position: absolute;
        right: 0;
        top: 0;
    }

    .chat-main-wrapper {
        display: table;
        height: 100%;
        table-layout: fixed;
        width: 100%;
    }

    .message-view {
        display: table-cell;
        height: 100%;
        float: none;
        padding: 0;
        position: static;
        vertical-align: top;
        width: 75%;
    }

    .chat-window {
        display: table;
        height: 100%;
        table-layout: fixed;
        width: 100%;
        background-color: #f5f5f5;
    }

    .fixed-header {
        background-color: #fff;
        border-bottom: 1px solid #eaeaea;
        padding: 10px 15px;
    }

    .fixed-header .navbar {
        border: 0 none;
        margin: 0;
        min-height: auto;
        padding: 0;
    }

    .fixed-header .user-info a {
        color: #76838f;
        text-transform: uppercase;
    }

    .typing-text {
        color: #009efb;
        font-size: 12px;
        text-transform: lowercase;
    }

    .last-seen {
        color: #a3afb7;
        display: block;
        font-size: 12px;
    }

    .custom-menu.nav > li > a {
        color: #009efb;
        font-size: 26px;
        margin-left: 15px;
        padding: 0;
    }

    .custom-menu.navbar-nav > li > a:hover,
    .custom-menu.navbar-nav > li > a:focus {
        background-color: transparent;
    }

    .custom-menu .dropdown-menu {
        left: auto;
        right: 0;
    }

    .search-box .input-group {
        background-color: #e6e6e6;
        border: 1px solid #ddd;
        border-radius: 50px;
    }

    .search-box .input-group .form-control {
        background: transparent;
        border: none;
    }

    .search-box .btn {
        background-color: transparent;
    }

    .chat-contents {
        display: table-row;
        height: 100%;
    }

    .chat-content-wrap {
        height: 100%;
        position: relative;
        width: 100%;
    }

    .chat-wrap-inner {
        bottom: 0;
        left: 0;
        overflow: auto;
        position: absolute;
        right: 0;
        top: 0;
    }

    .chats {
        padding: 30px 15px;
    }

    .chat-body {
        display: block;
        margin: 10px 0 0;
        overflow: hidden;
    }

    .chat-body:first-child {
        margin-top: 0
    }

    .chat-right .chat-content {
        position: relative;
        display: block;
        float: right;
        padding: 8px 15px;
        margin: 0;
        clear: both;
        background-color: #e6e6e6;
        border-radius: 20px 2px 2px 20px;
        max-width: 60%;
    }

    .chat-right .chat-body {
        padding-left: 48px;
        padding-right: 10px;
    }

    .chat-bubble {
        display: block;
        width: 100%;
        float: left;
        margin-bottom: 10px;
    }

    .chat.chat-right .chat-bubble:last-child .chat-content {
        border-bottom-right-radius: 20px;
    }

    .chat.chat-right .chat-bubble:first-child .chat-content {
        border-top-right-radius: 20px;
    }

    .chat-content > p {
        margin-bottom: 0;
        word-wrap: break-word;
    }

    .chat-time {
        color: rgba(0, 0, 0, 0.5);
        display: block;
        font-size: 12px;
    }

    .chat-right .chat-time {
        text-align: right;
    }

    .chat-line {
        border-bottom: 1px solid #eaeaea;
        height: 12px;
        margin: 7px 0 20px;
        position: relative;
        text-align: center;
    }

    .chat-date {
        background-color: #f5f5f5;
        color: #000;
        font-size: 12px;
        padding: 0 11px;
    }

    .chat-avatar {
        float: right;
    }

    .chat-avatar .avatar {
        line-height: 30px;
        height: 30px;
        width: 30px;
    }

    .chat-left .chat-avatar {
        float: left;
    }

    .chat-left .chat-body {
        margin-right: 0;
        margin-left: 30px;
        padding-right: 20px;
    }

    .chat-left .chat-content {
        background-color: #fff;
        border: 1px solid #eaeaea;
        color: #888;
        float: left;
        position: relative;
        padding: 8px 15px;
        border-radius: 2px 20px 20px 2px;
        max-width: 60%;
    }

    .avatar {
        background-color: #aaa;
        border-radius: 50%;
        color: #fff;
        display: inline-block;
        font-weight: 500;
        height: 38px;
        line-height: 38px;
        margin: 0 10px 0 0;
        overflow: hidden;
        text-align: center;
        text-decoration: none;
        text-transform: uppercase;
        vertical-align: middle;
        width: 38px;
        position: relative;
        white-space: nowrap;
    }

    .avatar:hover {
        color: #fff;
    }

    .avatar > img {
        width: 100%;
        display: block;
    }

    .chat.chat-left .chat-bubble:first-child .chat-content {
        border-top-left-radius: 20px;
        margin-top: 0;
    }

    .chat.chat-left .chat-bubble:last-child .chat-content {
        border-bottom-left-radius: 20px;
    }

    .chat-left .chat-time {
        color: #a3afb7
    }

    .attach-list {
        color: #adb7be;
        padding: 5px 0 0;
        line-height: 24px;
        margin: 0;
        list-style: none;
    }

    .attach-list i {
        margin-right: 3px;
        font-size: 16px;
    }

    .attach-list a {
        word-wrap: break-word;
    }

    .attach-img {
        margin-bottom: 20px;
    }

    .attach-img > img {
        border: 1px solid #eaeaea;
        max-width: 100%;
    }

    .attach-img-download {
        margin-bottom: 5px;
    }

    .chat-user {
        color: #333;
        font-size: 13px;
    }

    .chat-footer {
        background-color: #fff;
        border-top: 1px solid #eaeaea;
        padding: 15px;
    }

    .message-bar {
        display: table;
        height: 44px;
        position: relative;
        width: 100%;
    }

    .message-bar .message-inner {
        display: table-row;
        height: 100%;
        padding: 0 8px;
        width: 100%;
    }

    .message-bar .link {
        color: #777;
        display: table-cell;
        font-size: 20px;
        padding: 0 10px;
        position: relative;
        vertical-align: middle;
        width: 30px;
    }

    .message-bar .message-area {
        display: table-cell;
    }

    .message-area .input-group .form-control {
        background-color: #fff;
        border: 1px solid #eaeaea;
        box-shadow: none;
        color: #555;
        display: block;
        font-size: 14px;
        height: 44px;
        margin: 0;
        padding: 6px 12px;
        resize: none;
    }

    .message-area .input-group .form-control:focus {
        height: 150px;
        transition: all 0.5s ease 0s;
    }

    .message-area .btn {
        height: 44px;
        width: 50px;
    }

    .profile-right {
        display: table-cell;
        height: 100%;
        float: none;
        padding: 0;
        position: static;
        vertical-align: top;
    }

    .display-table {
        display: table;
        table-layout: fixed;
        border-spacing: 0;
        width: 100%;
        height: 100%;
    }

    .table-row {
        display: table-row;
        height: 100%;
    }

    .table-body {
        position: relative;
        height: 100%;
        width: 100%;
    }

    .table-content {
        bottom: 0;
        left: 0;
        overflow: auto;
        position: absolute;
        right: 0;
        top: 0;
    }

    .profile-right-inner {
        border-left: 1px solid #eaeaea;
        background-color: #fff;
    }

    .chat-profile-img {
        padding: 30px;
        position: relative;
        text-align: center;
    }

    .edit-profile-img {
        height: 120px;
        margin: 0 auto;
        position: relative;
        width: 120px;
        cursor: pointer;
    }

    .change-img {
        background-color: rgba(0, 0, 0, 0.3);
        border-radius: 50%;
        color: #fff;
        display: none;
        height: 100%;
        left: 0;
        line-height: 120px;
        position: absolute;
        top: 0;
        width: 100%;
    }

    .edit-profile-img:hover .change-img {
        display: block;
    }

    .edit-profile-img img {
        height: auto;
        margin: 0;
        width: 120px;
        border-radius: 50%;
    }

    .user-name {
        color: #333;
    }

    .edit-btn {
        border-radius: 40px;
        height: 36px;
        position: absolute;
        right: 15px;
        top: 15px;
        width: 36px;
    }

    .chat-profile-info {
        padding: 15px;
    }

    .user-det-list {
        list-style: none;
        padding: 0;
    }

    .user-det-list > li {
        padding: 6px 15px;
    }

    .user-det-list .text-muted {
        color: #888;
    }

    .transfer-files .tab-content {
        padding-top: 0;
    }

    .files-list {
        list-style: none;
        padding-left: 0;
    }

    .files-list > li {
        border-bottom: 1px solid #eaeaea;
        border-radius: inherit;
        margin: 2px 0 0;
        padding: 10px;
    }

    .files-cont {
        position: relative;
    }

    .file-type {
        height: 48px;
        position: absolute;
        width: 48px;
    }

    .files-icon i {
        color: #76838f;
        font-size: 20px;
    }

    .files-info {
        padding: 0 30px 0 50px;
    }

    .file-name a {
        color: #333;
    }

    .files-action {
        display: none;
        height: 30px;
        list-style: none;
        padding-left: 0;
        position: absolute;
        right: 0;
        text-align: right;
        top: 10px;
        width: 30px;
    }

    .files-list > li:hover .files-action {
        display: block;
    }

    .file-date {
        color: #888;
        font-size: 12px;
    }

    .file-author a {
        color: #009efb;
        font-size: 12px;
        text-decoration: underline;
    }

    .files-action .dropdown-menu {
        left: auto;
        right: 0;
    }

    .chat-img-attach {
        border-radius: 4px;
        margin-bottom: 12px;
        margin-left: 12px;
        position: relative;
        float: right;
    }

    .chat-img-attach img {
        border-radius: 4px;
        display: inline-block;
        height: auto;
        max-width: 100%;
    }

    .chat-placeholder {
        background: rgba(69, 81, 97, 0.6);
        border-radius: 4px;
        color: #fff;
        display: flex;
        flex-direction: column;
        height: 100%;
        justify-content: flex-end;
        left: 0;
        padding: 13px;
        position: absolute;
        top: 0;
        width: 100%;
    }

    .chat-img-name {
        font-size: 12px;
        font-weight: 700;
        line-height: 16px;
    }

    .chat-file-desc {
        font-size: 11px;
    }

    .chat-right .chat-content.img-content {
        background-color: transparent;
        color: #76838f;
        padding: 0;
        text-align: right;
    }

    .chat-right .img-content .chat-time {
        color: #a3afb7;
    }

    .chat-left .chat-img-attach {
        float: left;
    }

    .chat-left .chat-img-attach {
        float: left;
        margin-left: 0;
        margin-right: 12px;
    }

    .chat-avatar-sm {
        width: 24px;
        margin-right: 10px;
        display: inline-block;
        position: relative;
        float: left;
    }

    .chat-avatar-sm img {
        width: 24px;
    }

    .chat-avatar-sm.user-img .status {
        bottom: 4px;
        right: -3px;
    }

    .files-share-list {
        border: 1px solid #eaeaea;
        border-radius: 4px;
        margin-bottom: 20px;
        padding: 15px;
    }

    .files-share-list {
        background-color: #f9f9f9;
        border: 1px solid #eaeaea;
        border-radius: 4px;
        margin-bottom: 20px;
        padding: 15px;
    }

    .chat-user-list {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .chat-user-list > li {
        border-bottom: 1px solid #eaeaea;
        border-radius: inherit;
        margin: 5px 0 0;
        padding: 10px;
        background-color: #fff;
    }

    .designation {
        color: #9e9e9e;
        font-size: 12px;
    }

    .online-date {
        color: #9e9e9e;
        font-size: 12px;
    }

    .drop-zone {
        width: 100%;
        height: 205px;
        border: 2px dashed #adb7be;
        text-align: center;
        padding: 25px 0 0;
        margin-bottom: 20px;
    }

    .drop-zone .drop-zone-caption {
        font-weight: 600;
    }

    .upload-list {
        padding: 0;
        list-style: none;
        margin: 0;
    }

    .upload-list .file-list {
        background-color: #fff;
        border-top: 1px solid #d8e2e7;
        padding: 10px;
    }

    .upload-list .file-list:first-child {
        border-top: none
    }

    .upload-list .upload-wrap {
        position: relative;
        padding: 0 20px 0 0;
        margin: 0 0 5px
    }

    .upload-list .file-name,
    .upload-list .file-size {
        display: inline-block;
        vertical-align: top;
        white-space: nowrap;
    }

    .upload-list .file-name {
        padding-right: 15px;
        overflow: hidden;
        max-width: 100%;
        text-overflow: ellipsis
    }

    .upload-list .file-size {
        color: #888;
    }

    .upload-list .file-close {
        border: none;
        background: none;
        color: #ccc;
        position: absolute;
        right: 0;
        top: 2px;
    }

    .upload-list .file-close:hover {
        color: #f62d51
    }

    .upload-list .upload-process {
        font-size: 10px;
        color: #888;
    }

    .upload-list .progress {
        margin-bottom: 5px;
        background-color: #e1e1e1;
        height: 5px;
    }

    .upload-list .file-name i {
        color: #fda75c;
        margin: 0 5px 0 0;
        vertical-align: middle;
    }

    .upload-drop-zone {
        height: 200px;
        border-width: 2px;
        margin-bottom: 20px;
        color: #ccc;
        border-style: dashed;
        border-color: #adb7be;
        line-height: 200px;
        text-align: center;
        background-color: #fff;
    }

    .upload-drop-zone.drop {
        color: #222;
        border-color: #222;
    }

    .upload-text {
        font-size: 24px;
        margin-left: 10px;
    }

    .file-attached {
        color: #333;
        font-size: 13px;
    }

    .file-attached i {
        font-size: 16px;
    }

    /*-----------------
	16. Focus Label
-----------------------*/

    .form-focus {
        display: flex;
        height: 50px;
        position: relative;
    }

    .form-focus .focus-label {
        font-size: 16px;
        font-weight: 400;
        opacity: 0.4;
        pointer-events: none;
        position: absolute;
        -webkit-transform: translate3d(0, 22px, 0) scale(1);
        -ms-transform: translate3d(0, 22px, 0) scale(1);
        -o-transform: translate3d(0, 22px, 0) scale(1);
        transform: translate3d(0, 22px, 0) scale(1);
        transform-origin: left top;
        transition: 240ms;
        left: 12px;
        top: -8px;
        z-index: 1;
        color: #888;
    }

    .form-focus.focused .focus-label {
        opacity: 1;
        font-weight: 300;
        top: -14px;
        font-size: 12px;
        z-index: 1;
    }

    .form-focus .form-control {
        height: 50px;
        padding: 21px 12px 6px;
    }

    .form-focus .form-control::-webkit-input-placeholder {
        color: transparent;
        transition: 240ms;
    }

    .form-focus .form-control:focus::-webkit-input-placeholder {
        transition: none;
    }

    .form-focus.focused .form-control::-webkit-input-placeholder {
        color: #bbb;
    }

    .profile-basic .cal-icon {
        width: 100%;
    }

    .form-focus .select2-container .select2-selection--single {
        border: 1px solid #ccc;
        height: 50px;
        border-radius: 0;
    }

    .form-focus .select2-container--default .select2-selection--single .select2-selection__arrow {
        height: 48px;
        right: 7px;
    }

    .form-focus .select2-container--default .select2-selection--single .select2-selection__arrow b {
        border-color: #ccc transparent transparent;
        border-style: solid;
        border-width: 6px 6px 0;
        height: 0;
        left: 50%;
        margin-left: -10px;
        margin-top: -2px;
        position: absolute;
        top: 50%;
        width: 0;
    }

    .form-focus .select2-container--default.select2-container--open .select2-selection--single .select2-selection__arrow b {
        border-color: transparent transparent #ccc;
        border-width: 0 6px 6px;
    }

    .form-focus .select2-container .select2-selection--single .select2-selection__rendered {
        padding-right: 30px;
        padding-left: 12px;
        padding-top: 10px;
    }

    .form-focus .select2-container--default .select2-selection--single .select2-selection__rendered {
        color: #676767;
        font-size: 14px;
        font-weight: normal;
        line-height: 38px;
    }

    .form-focus .select2-container--default .select2-results__option--highlighted[aria-selected] {
        background-color: #fc6075;
    }

    .file-size {
        color: #888;
    }

    /*-----------------
	17. Leave
-----------------------*/

    .filter-row .btn {
        border-radius: 0;
        min-height: 50px;
        padding: 12px;
        text-transform: uppercase;
    }

    .form-focus.select-focus .focus-label {
        opacity: 1;
        font-weight: 300;
        top: -20px;
        font-size: 12px;
        z-index: 1;
    }

    .action-label .label {
        display: inline-block;
        min-width: 85px;
        padding: 0.5em 0.6em;
    }

    .action-label i {
        margin-right: 3px;
    }

    .action-label .dropdown-menu > li > a {
        padding: 3px 10px;
    }

    /*-----------------
	18. Employee
-----------------------*/

    .action-icon {
        color: #777;
        font-size: 18px;
        padding: 0 10px;
        display: inline-block;
    }

    .table .dropdown-menu {
        font-size: 12px;
    }

    .profile-widget {
        background-color: #fff;
        border-radius: 4px;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        padding: 20px;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .profile-widget .user-name > a {
        color: #333;
    }

    .dropdown.profile-action {
        position: absolute;
        right: 5px;
        text-align: right;
        top: 10px;
    }

    .profile-action .dropdown-toggle:after {
        display: none;
    }

    .profile-img {
        cursor: pointer;
        height: 80px;
        margin: 0 auto;
        position: relative;
        width: 80px;
    }

    .profile-img .avatar {
        font-size: 24px;
        height: 80px;
        line-height: 80px;
        margin: 0;
        width: 80px;
    }

    .mobile-no > a {
        color: #777;
        display: inline-block;
    }

    .staff-mail > a {
        color: #777;
        display: inline-block;
        margin-top: 5px;
    }

    .staff-action-btns {
        margin-top: 10px;
    }

    .staff-id {
        margin-top: 5px;
    }

    .view-icons {
        float: right;
        margin-right: 10px;
    }

    .view-icons .btn {
        color: #888;
        font-size: 18px;
        margin-right: 5px;
        padding: 4px;
    }

    .view-icons .btn.active {
        color: #333;
    }

    /*-----------------
	19. Events
-----------------------*/

    .calendar {
        float: left;
        margin-bottom: 0;
    }

    .fc-view {
        margin-top: 30px;
    }

    a.fc-event:not([href]) {
        color: #fff;
    }

    .none-border .modal-footer {
        border-top: none;
    }

    .fc-toolbar h2 {
        font-size: 18px;
        font-weight: 600;
        font-family: 'Rubik', sans-serif;
        line-height: 30px;
        text-transform: uppercase;
    }

    .fc-day-grid-event .fc-time {
        font-family: 'Rubik', sans-serif;
    }

    .fc-day {
        background: #fff;
    }

    .fc-toolbar .fc-state-active,
    .fc-toolbar .ui-state-active,
    .fc-toolbar button:focus,
    .fc-toolbar button:hover,
    .fc-toolbar .ui-state-hover {
        z-index: 0;
    }

    .fc th.fc-widget-header {
        background: #eeeeee;
        font-size: 14px;
        line-height: 20px;
        padding: 10px 0;
        text-transform: uppercase;
    }

    .fc-unthemed th,
    .fc-unthemed td,
    .fc-unthemed thead,
    .fc-unthemed tbody,
    .fc-unthemed .fc-divider,
    .fc-unthemed .fc-row,
    .fc-unthemed .fc-popover {
        border-color: #f3f3f3;
    }

    .fc-button {
        background: #f1f1f1;
        border: none;
        color: #797979;
        text-transform: capitalize;
        box-shadow: none !important;
        border-radius: 3px !important;
        margin: 0 3px !important;
        padding: 6px 12px !important;
        height: auto !important;
    }

    .fc-text-arrow {
        font-family: inherit;
        font-size: 16px;
    }

    .fc-state-hover {
        background: #f3f3f3;
    }

    .fc-state-highlight {
        background: #f0f0f0;
    }

    .fc-state-down,
    .fc-state-active,
    .fc-state-disabled {
        background-color: #009efb;
        color: #fff;
        text-shadow: none;
    }

    .fc-cell-overlay {
        background: #f0f0f0;
    }

    .fc-unthemed .fc-today {
        background: #fff;
    }

    .fc-event {
        border-radius: 2px;
        border: none;
        cursor: move;
        font-size: 13px;
        margin: 1px 7px;
        padding: 5px;
        text-align: center;
    }

    .fc-basic-view td.fc-week-number span {
        padding-right: 8px;
        font-weight: 700;
        font-family: 'Rubik', sans-serif;
    }

    .fc-basic-view td.fc-day-number {
        padding-right: 8px;
        font-weight: 700;
        font-family: 'Rubik', sans-serif;
    }

    /*-----------------
	20. Profile
-----------------------*/

    .card-box.profile-header {
        margin: 0;
    }

    .profile-details {
        text-align: center;
    }

    .personal-info li .title {
        color: #515365;
        float: left;
        font-weight: 500;
        margin-right: 30px;
        width: 30%;
    }

    .personal-info li .text {
        color: #888da8;
        display: block;
        overflow: hidden;
    }

    .personal-info li {
        margin-bottom: 10px;
    }

    .personal-info {
        list-style: none;
        margin-bottom: 0;
        padding: 0;
    }

    .personal-info .text > a {
        color: #009efb;
    }

    .profile-view .profile-img-wrap {
        height: 150px;
        width: 150px;
    }

    .profile-view .profile-img {
        width: 150px;
        height: 150px;
    }

    .profile-view .profile-img .avatar {
        font-size: 24px;
        height: 150px;
        line-height: 150px;
        margin: 0;
        width: 150px;
    }

    .profile-view .profile-basic {
        margin-left: 170px;
    }

    .staff-msg {
        margin-top: 30px;
    }

    .experience-box {
        position: relative;
    }

    .experience-list {
        list-style: none;
        margin: 0;
        padding: 0;
        position: relative;
    }

    .experience-list:before {
        background: #ddd;
        bottom: 0;
        content: "";
        left: 8px;
        position: absolute;
        top: 8px;
        width: 2px;
    }

    .experience-list > li {
        position: relative;
    }

    .experience-list > li:last-child .experience-content {
        margin-bottom: 0;
    }

    .experience-user .avatar {
        height: 32px;
        line-height: 32px;
        margin: 0;
        width: 32px;
    }

    .experience-list > li .experience-user {
        background: #fff;
        height: 10px;
        left: 4px;
        margin: 0;
        padding: 0;
        position: absolute;
        top: 4px;
        width: 10px;
    }

    .experience-list > li .experience-content {
        background-color: #fff;
        margin: 0 0 20px 40px;
        padding: 0;
        position: relative;
    }

    .experience-list > li .experience-content .timeline-content {
        color: #9e9e9e;
    }

    .experience-list > li .experience-content .timeline-content a.name {
        color: #616161;
        font-weight: bold;
    }

    .experience-list > li .time {
        color: #bdbdbd;
        display: block;
        font-size: 12px;
        line-height: 1.35;
    }

    .before-circle {
        background-color: #ddd;
        border-radius: 50%;
        height: 10px;
        width: 10px;
    }

    .skills > span {
        border: 1px solid #ccc;
        border-radius: 500px;
        display: block;
        margin-bottom: 10px;
        padding: 6px 12px;
        text-align: center;
    }

    .profile-info-left {
        border-right: 2px dashed #ccc;
    }

    .profile-tabs .nav-tabs {
        background-color: #fff;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.1);
    }

    /*-----------------
	21. Notifications
-----------------------*/

    .notifications {
        padding: 0;
    }

    .notifications .drop-scroll {
        height: 290px;
        width: 400px;
    }

    .notifications.msg-noti .drop-scroll {
        width: 310px;
    }

    .notifications .notification-heading {
        margin: 0;
        font-size: 14px;
        font-weight: normal;
        line-height: 1.45;
        color: #616161;
    }

    .notifications .notification-time {
        font-size: 12px;
        line-height: 1.35;
        color: #bdbdbd;
    }

    .notification-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .notifications ul.notification-list > li {
        margin-top: 0;
        border-bottom: 1px solid #f5f5f5;
    }

    .notifications ul.notification-list > li:last-child {
        border-bottom: none;
    }

    .notifications ul.notification-list > li a {
        display: block;
        padding: 12px;
        border-radius: 2px;
    }

    .notifications ul.notification-list > li a:hover {
        background-color: #fafafa;
    }

    .drop-scroll {
        overflow-y: scroll;
        position: relative;
    }

    .topnav-dropdown-header {
        border-bottom: 1px solid #eee;
        text-align: center;
    }

    .topnav-dropdown-header,
    .topnav-dropdown-footer {
        font-size: 12px;
        height: 32px;
        line-height: 32px;
        padding-left: 12px;
        padding-right: 12px;
    }

    .topnav-dropdown-footer a {
        display: block;
        text-align: center;
        color: #333;
    }

    .user-menu.nav > li > a .badge {
        color: #fff;
        font-size: 60%;
        font-weight: 700;
        position: absolute;
        right: 3px;
        top: 6px;
    }

    .user-menu.nav > li > a > i {
        font-size: 16px;
        line-height: 55px;
    }

    .noti-details {
        color: #989c9e;
        margin: 0;
    }

    .noti-time {
        margin: 0;
    }

    .noti-title {
        color: #333;
    }

    /*-----------------
	22. Roles & Permissions
-----------------------*/

    .roles-menu {
        margin-top: 20px;
    }

    .roles-menu > ul {
        background-color: #fff;
        border: 1px solid #eaeaea;
        border-radius: 4px;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .roles-menu > ul > li {
        display: block;
        position: relative;
    }

    .roles-menu > ul > li > a {
        border-left: 3px solid transparent;
        color: #333;
        display: block;
        padding: 10px 15px;
        position: relative;
    }

    .roles-menu > ul > li.active > a {
        border-color: #009efb;
        color: #009efb;
    }

    .roles-menu > ul > li > a:hover {
        border-color: #009efb;
        background-color: #eee;
    }

    .material-switch > input[type="checkbox"] {
        display: none;
    }

    .material-switch > label {
        cursor: pointer;
        height: 0px;
        position: relative;
        width: 40px;
    }

    .material-switch > label:before {
        background: rgb(0, 0, 0);
        box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
        border-radius: 8px;
        content: '';
        height: 16px;
        margin-top: -8px;
        position: absolute;
        opacity: 0.3;
        transition: all 0.4s ease-in-out;
        width: 40px;
    }

    .material-switch > label:after {
        background: rgb(255, 255, 255);
        border-radius: 16px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
        content: '';
        height: 24px;
        left: -4px;
        margin-top: -8px;
        position: absolute;
        top: -4px;
        transition: all 0.3s ease-in-out;
        width: 24px;
    }

    .material-switch > input[type="checkbox"]:checked + label:before {
        background: inherit;
        opacity: 0.5;
    }

    .material-switch > input[type="checkbox"]:checked + label:after {
        background: inherit;
        left: 20px;
    }

    .role-action {
        display: none;
        float: right;
        position: absolute;
        right: 8px;
        top: 8px;
    }

    .roles-menu > ul > li:hover .role-action {
        display: block;
    }

    .slide-nav .sidebar {
        margin-left: 0;
    }

    .action-circle {
        background: transparent;
        border: 1px solid #ccc;
        border-radius: 100%;
        height: 20px;
        width: 20px;
        display: inline-block;
        text-align: center;
        cursor: pointer;
        -webkit-transition: all 300ms ease;
        -moz-transition: all 300ms ease;
        -ms-transition: all 300ms ease;
        -o-transition: all 300ms ease;
        transition: all 300ms ease;
    }

    .action-circle .material-icons {
        color: #ccc;
        font-size: 18px;
        vertical-align: -3px;
    }

    .action-circle.completed {
        background: #35BA67;
        border: 1px solid #2fa65c;
    }

    .action-circle.completed .material-icons {
        color: #fff;
    }

    .action-circle.large {
        height: 24px;
        width: 24px;
    }

    .action-circle.large .material-icons {
        font-size: 16px;
        vertical-align: -4px;
    }

    .sidebar-overlay {
        display: none;
        position: fixed;
        z-index: 90;
        height: 100%;
        left: 0;
        top: 50px;
        width: 100%;
        z-index: 99;
        background-color: rgba(0, 0, 0, 0.6);
        overflow: hidden;
    }

    .menu-opened .sidebar-overlay {
        display: block;
    }

    .sidebar-menu.opened {
        opacity: 1;
        -webkit-transform: translateX(0px);
        -moz-transform: translateX(0px);
        -ms-transform: translateX(0px);
        -o-transform: translateX(0px);
        transform: translateX(0px);
        margin-left: 0;
    }

    html.menu-opened {
        overflow: hidden;
    }

    html.menu-opened body {
        overflow: hidden;
    }

    .chat-profile-view.opened {
        margin-right: 0;
    }

    .menu-opened .message-view.chat-view {
        width: 100%;
    }

    /*-----------------
	23. Chat Right Sidebar
-----------------------*/

    .fixed-header .custom-menu {
        margin: 1px 0 0;
    }

    .topnav-dropdown-footer {
        border-top: 1px solid #eee;
    }

    .notification-box {
        bottom: 0;
        margin-right: -300px;
        position: fixed;
        right: 0;
        top: 50px;
        transition: all 0.4s ease 0s;
        width: 300px;
        z-index: 101;
        border-left: 1px solid #ddd;
    }

    .open-msg-box .notification-box {
        margin-right: 0;
    }

    .msg-sidebar {
        background-color: #fff;
    }

    .list-box {
        list-style: none;
        padding-left: 0;
    }

    .list-item.new-message {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .list-item {
        border-bottom: 1px solid #eaeaea;
        padding: 10px;
        position: relative;
    }

    .list-left {
        height: 48px;
        position: absolute;
        width: 48px;
    }

    .files-icon {
        background-color: #f5f5f5;
        border: 1px solid #ddd;
        border-radius: 4px;
        display: inline-block;
        height: 38px;
        line-height: 38px;
        text-align: center;
        width: 38px;
    }

    .files-icon i {
        color: #777;
        font-size: 20px;
    }

    .list-body {
        padding: 0 0 0 50px;
    }

    .message-author {
        color: #333;
        float: left;
        font-weight: bold;
        width: 175px;
        display: block;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .message-time {
        color: #888;
        float: right;
        font-size: 11px;
    }

    .message-content {
        color: #333;
        font-size: 13px;
        display: block;
        max-width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    /*-----------------
	24. Invoice
-----------------------*/

    .invoice-details,
    .invoice-payment-details > li span {
        float: right;
        text-align: right;
    }

    .attach-files > ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .attach-files li {
        display: inline-block;
        margin-right: 10px;
        position: relative;
    }

    .attach-files li img {
        width: 50px;
    }

    .file-remove {
        color: #f00;
        position: absolute;
        right: -6px;
        top: -7px;
    }

    .attach-files li:last-child {
        margin-right: 0;
    }

    .inv-logo {
        height: auto;
        margin-bottom: 20px;
        max-height: 100px;
        width: auto;
    }

    .form-amt {
        border: 1px solid #fff;
    }

    /*-----------------
	25. Doctors
-----------------------*/

    .doctor-img {
        cursor: pointer;
        height: 80px;
        margin: 0 auto 15px;
        position: relative;
        width: 80px;
    }

    .doctor-img .avatar {
        font-size: 24px;
        height: 80px;
        line-height: 80px;
        margin: 0;
        width: 80px;
    }

    .doc-prof {
        color: #777;
        font-size: 12px;
        margin-bottom: 10px;
    }

    .doctor-name {
        margin: 0;
    }

    .doctor-name a {
        color: #333;
    }

    .see-all {
        margin-top: 30px;
        text-align: center;
    }

    .see-all .see-all-btn {
        border: 1px solid #e2e2e2;
        border-radius: 5px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        color: #777;
        display: inline-block;
        padding: 10px 20px;
    }

    /*-----------------
	26. Add Doctor
-----------------------*/

    .profile-upload {
        display: flex;
    }

    .upload-img {
        margin-right: 10px;
    }

    .upload-img img {
        border-radius: 4px;
        height: 40px;
        width: 40px;
    }

    .upload-input {
        width: 100%;
    }

    .gen-label {
        display: block;
        margin-bottom: 18px;
    }

    .submit-btn {
        border-radius: 50px;
        color: #fff;
        font-size: 16px;
        font-weight: 500;
        min-width: 200px;
        padding: 8px 20px;
        text-transform: uppercase;
    }

    .delete-modal .modal-body .btn {
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        width: 90px;
        color: #333;
    }

    .delete-modal .modal-body .btn.btn-danger {
        color: #fff;
    }

    .delete-modal .modal-body > h3 {
        font-size: 16px;
        font-weight: bold;
        margin: 15px 0 0;
    }

    .custom-badge {
        border-radius: 4px;
        display: inline-block;
        font-size: 12px;
        min-width: 95px;
        padding: 1px 10px;
        text-align: center;
    }

    .status-red,
    a.status-red {
        background-color: #ffe5e6;
        border: 1px solid #fe0000;
        color: #fe0000;
    }

    .status-green,
    a.status-green {
        background-color: #e5faf3;
        border: 1px solid #00ce7c;
        color: #00ce7c;
    }

    .status-orange,
    a.status-orange {
        background-color: #fef5e4;
        border: 1px solid #ff9b01;
        color: #ff9b01;
    }

    .status-blue,
    a.status-blue {
        background-color: #e5f3fe;
        border: 1px solid #008cff;
        color: #008cff;
    }

    .status-purple,
    a.status-purple {
        background-color: #f3e7fd;
        border: 1px solid #8f13fd;
        color: #8f13fd;
    }

    .status-pink,
    a.status-pink {
        background-color: #ffe5f6;
        border: 1px solid #ff01a2;
        color: #ff01a2;
    }

    .status-grey,
    a.status-grey {
        background-color: #ddd;
        border: 1px solid #818181;
        color: #818181;
    }

    .btn-grey {
        background-color: #b2b2b2;
        border: 1px solid #b2b2b2;
    }

    .modal-backdrop {
        background-color: #fff;
    }

    .modal-backdrop.show {
        opacity: 0.9;
    }

    .invoices-view {
        width: 70%;
        float: right;
    }

    /*-----------------
	27. Payslip
-----------------------*/

    .payslip-title {
        margin-bottom: 20px;
        text-align: center;
        text-decoration: underline;
        text-transform: uppercase;
    }

    /*-----------------
	28. Attendance
-----------------------*/

    .half-day {
        width: 15px;
    }

    /*-----------------
	29. Inbox
-----------------------*/

    .table-inbox input[type="radio"],
    .table-inbox input[type="checkbox"] {
        cursor: pointer;
    }

    .mail-list {
        list-style: none;
        padding: 0;
    }

    .mail-list > li > a {
        color: #333;
        display: block;
        padding: 10px;
    }

    .mail-list > li.active > a {
        color: #009efb;
        font-weight: bold;
    }

    .unread .name,
    .unread .subject,
    .unread .mail-date {
        color: #000;
        font-weight: 600;
    }

    .table-inbox .fa-star {
        color: #ffd200;
    }

    .table-inbox .starred.fa-star {
        color: #ffd200;
    }

    .table.table-inbox > tbody > tr > td,
    .table.table-inbox > tbody > tr > th,
    .table.table-inbox > tfoot > tr > td,
    .table.table-inbox > tfoot > tr > th,
    .table.table-inbox > thead > tr > td,
    .table.table-inbox > thead > tr > th {
        border-bottom: 1px solid #f2f2f2;
        border-top: 0;
    }

    .table-inbox {
        font-size: 14px;
        margin-bottom: 0;
    }

    .note-editor.note-frame {
        border: 1px solid #ccc;
        box-shadow: inherit;
    }

    .note-editor.note-frame .note-statusbar {
        background-color: #fff;
    }

    .note-editor.note-frame.fullscreen {
        top: 60px;
    }

    .mail-title {
        font-weight: bold;
        text-transform: uppercase;
    }

    .form-control.search-message {
        border-radius: 4px;
        margin-left: 5px;
        width: 180px;
        padding: 0.375rem 0.75rem;
        min-height: 35px;
        margin-bottom: 5px;
    }

    .table-inbox tr {
        cursor: pointer;
    }

    table.table-inbox tbody tr.checked {
        background-color: #ffffcc;
    }

    .mail-label {
        margin-right: 5px;
    }

    /*-----------------
	30. Mail View
-----------------------*/

    .attachments {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .attachments li {
        border: 1px solid #eee;
        float: left;
        margin-bottom: 10px;
        margin-right: 10px;
        width: 200px;
    }

    .attach-file {
        color: #777;
        font-size: 70px;
        padding: 10px;
        text-align: center;
        min-height: 153px;
    }

    .attach-file > i {
        line-height: 133px;
    }

    .attach-info {
        background-color: #f4f4f4;
        padding: 10px;
    }

    .attach-filename {
        color: #777;
        font-weight: bold;
    }

    .attach-filesize {
        color: #999;
        font-size: 12px;
    }

    .attach-file img {
        height: auto;
        max-width: 100%;
    }

    .mailview-header {
        border-bottom: 1px solid #ddd;
        margin-bottom: 20px;
        padding-bottom: 15px;
    }

    .mailview-footer {
        border-top: 1px solid #ddd;
        margin-top: 20px;
        padding-top: 15px;
    }

    .mailview-footer .btn-white {
        min-width: 102px;
    }

    .sender-img {
        float: left;
        margin-right: 10px;
        width: 40px;
    }

    .sender-name {
        display: block;
    }

    .receiver-name {
        color: #777;
    }

    .right-action {
        text-align: right;
    }

    .mail-view-title {
        font-weight: 500;
        font-size: 24px;
        margin: 0;
    }

    .mail-view-action {
        float: right;
    }

    .mail-sent-time {
        float: right;
    }

    /*-----------------
	31. Blog
-----------------------*/

    .blog {
        position: relative;
        margin: 0 0 50px;
        background-color: #fff;
        border: 1px solid #e7e7e7;
        border-radius: 4px;
        padding: 20px;
    }

    .blog-image {
        overflow: hidden;
    }

    .blog-image,
    .blog-image > a,
    .blog-image img {
        display: block;
        position: relative;
        width: 100%;
        height: auto;
    }

    .blog-image img {
        -moz-transform: scaleY(1);
        -webkit-transform: scaleY(1);
        -o-transform: scaleY(1);
        -ms-transform: scaleY(1);
        transform: scaleY(1);
        -moz-transition: all 0.5s ease-in-out 0s;
        -ms-transition: all 0.5s ease-in-out 0s;
        -o-transition: all 0.5s ease-in-out 0s;
        -webkit-transition: all 0.5s ease-in-out 0s;
        transition: all 0.5s ease-in-out 0s;
    }

    .blog-image a:hover img {
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        -o-transform: scale(1.1);
        -ms-transform: scale(1.1);
        transform: scale(1.1);
    }

    .blog-image {
        margin-bottom: 30px;
    }

    .blog-content {
        position: relative;
    }

    .blog-title {
        color: #000;
        font-weight: normal;
        margin: 0 0 20px;
    }

    .blog-content p {
        color: #282628;
        font-size: 14px;
        line-height: 25px;
        margin: 0 0 25px;
    }

    .read-more {
        color: #282628;
        display: inline-block;
        font-size: 14px;
        margin-bottom: 20px;
    }

    .read-more:hover {
        color: #009efb;
        margin-left: 10px;
        -moz-transition: all 0.2s linear 0s;
        -ms-transition: all 0.2s linear 0s;
        -o-transition: all 0.2s linear 0s;
        -webkit-transition: all 0.2s linear 0s;
        transition: all 0.2s linear 0s;
    }

    .read-more i {
        color: #009efb;
        font-size: 18px;
        margin-right: 3px;
    }

    .blog-info {
        border: 1px solid #eaeaea;
        color: #909090;
        font-size: 12px;
        margin-bottom: 0;
        padding: 12px 20px;
    }

    .blog-info a {
        color: #909090;
        margin-right: 5px;
    }

    .blog-info a:last-child {
        margin-right: 0;
    }

    .blog-info a:hover {
        color: #009efb;;
    }

    .blog-info i {
        color: #009efb;
        font-size: 18px;
        margin-right: 5px;
    }

    .record-left {
        float: left;
    }

    .record-right {
        float: right;
    }

    .record-left ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .record-left ul li {
        float: left;
        margin-right: 20px;
    }

    .record-left ul li:last-child {
        margin-right: 0;
    }

    .video {
        position: relative;
        padding-bottom: 56%;
        height: 0;
        overflow: hidden;
    }

    .video iframe,
    .video object,
    .video embed {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border: none;
    }

    .widget {
        margin-bottom: 30px;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #e7e7e7;
    }

    .widget h5 {
        color: #656565;
        font-size: 21px;
        font-weight: normal;
        margin: 0 0 20px;
    }

    .search-form .form-control {
        border: 1px solid #eaeaea;
        border-radius: 0;
        border-right: 0;
        box-shadow: inherit;
        height: 40px;
        color: #ababab;
    }

    .search-form .btn-primary {
        background-color: transparent;
        border-color: #eaeaea;
        border-left: none;
        color: #009efb;
        height: 40px;
        border-radius: 0;
    }

    .latest-records {
        margin: 0;
        padding: 0;
    }

    .latest-records li {
        display: table;
        width: 100%;
        padding-bottom: 15px;
        margin-bottom: 15px;
        border-bottom: 1px solid #eee;
    }

    .latest-records li:last-child {
        padding-bottom: 0px;
        margin-bottom: 0px;
        border-bottom: none;
    }

    .record-thumb {
        width: 80px;
        float: left;
        overflow: hidden;
    }

    .record-thumb a img {
        -moz-transform: scale(1);
        -webkit-transform: scale(1);
        -o-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
        -moz-transition: all 0.3s ease-in-out 0s;
        -ms-transition: all 0.3s ease-in-out 0s;
        -o-transition: all 0.3s ease-in-out 0s;
        -webkit-transition: all 0.3s ease-in-out 0s;
        transition: all 0.3s ease-in-out 0s;
    }

    .record-thumb a:hover img {
        -moz-transform: scale(1.2);
        -webkit-transform: scale(1.2);
        -o-transform: scale(1.2);
        -ms-transform: scale(1.2);
        transform: scale(1.2);
    }

    .record-info {
        margin-left: 95px;
    }

    .record-info h4 {
        font-size: 14px;
        font-weight: normal;
        line-height: 18px;
        margin: 0 0 10px;
    }

    .record-info h4 a {
        color: #333;
    }

    .record-info p {
        color: #909090;
        font-size: 12px;
        margin: 0;
    }

    .record-info p i {
        color: #009efb;
        font-size: 16px;
        margin-right: 4px;
    }

    .categories {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .categories li {
        padding: 12px 0;
        border-bottom: 1px solid #eaeaea;
    }

    .categories li:last-child {
        padding-bottom: 0px;
        border-bottom: none;
    }

    .categories li a {
        color: #656565;
        font-size: 14px;
    }

    .categories li a:hover {
        color: #009efb;
        margin-left: 10px;
        -moz-transition: all 0.2s linear 0s;
        -ms-transition: all 0.2s linear 0s;
        -o-transition: all 0.2s linear 0s;
        -webkit-transition: all 0.2s linear 0s;
        transition: all 0.2s linear 0s;
    }

    .categories > li > a > i {
        color: #009efb;
        font-size: 18px;
        margin-right: 10px;
    }

    .tags {
        list-style: none;
        margin: 0;
        overflow: hidden;
        padding: 0;
    }

    .tags li {
        float: left;
    }

    .tag {
        background-color: #eee;
        border-radius: 3px 0 0 3px;
        color: #999;
        display: inline-block;
        height: 26px;
        line-height: 26px;
        padding: 0 20px 0 23px;
        position: relative;
        margin: 0 10px 10px 0;
        text-decoration: none;
        -moz-transition: color 0.2s;
        -ms-transition: color 0.2s;
        -o-transition: color 0.2s;
        -webkit-transition: color 0.2s;
        transition: color 0.2s;
        font-size: 12px;
    }

    .tag:before {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
        content: '';
        height: 6px;
        left: 10px;
        position: absolute;
        width: 6px;
        top: 10px;
    }

    .tag:after {
        background-color: #fff;
        border-bottom: 13px solid transparent;
        border-left: 10px solid #eee;
        border-top: 13px solid transparent;
        content: '';
        position: absolute;
        right: 0;
        top: 0;
    }

    .tag:hover {
        background-color: #009efb;
        color: #fff;
    }

    .tag:hover:after {
        border-left-color: #009efb;
    }

    .comment-by {
        display: block;
        font-size: 14px;
        line-height: 21px;
        margin: 0 0 10px;
    }

    .comments-list .comment-block p {
        font-size: 13px;
        line-height: 20px;
        margin: 0;
        text-align: justify;
    }

    blockquote p {
        font-style: italic;
        font-weight: 400;
    }

    .grid-blog .blog-title {
        font-size: 16px;
        margin: 0 0 10px;
    }

    .grid-blog .blog-title a {
        color: #333;
    }

    .grid-blog .blog-content p {
        font-size: 13px;
        margin: 0 0 15px;
        color: #909090;
    }

    .grid-blog .blog-info {
        border: 0;
        border-top: 1px solid #eaeaea;
        margin-bottom: 0;
        padding: 12px 0;
    }

    .grid-blog .blog-image {
        margin-bottom: 20px;
    }

    .grid-blog .read-more {
        font-size: 13px;
        margin-bottom: 15px;
    }

    .product-thumbnail {
        position: relative;
        margin-bottom: 0;
        margin-top: 10px;
    }

    .product-remove {
        position: absolute;
        top: -10px;
        right: -6px;
        color: #f06060;
        cursor: pointer;
    }

    .bootstrap-tagsinput {
        width: 100%;
        height: 40px;
        box-shadow: inherit;
        border-radius: 0;
        line-height: 30px;
    }

    .bootstrap-tagsinput .badge [data-role="remove"]:hover {
        box-shadow: inherit;
        color: #f00;
    }

    /*-----------------
	32. Blog View
-----------------------*/

    .blog-view .blog-title {
        font-size: 32px;
    }

    .blog-view .blog-info {
        border: 0 none;
        margin-bottom: 20px;
        padding: 0;
    }

    .social-share {
        float: left;
        list-style: none;
        margin: 5px 0 0;
        padding: 0;
    }

    .social-share > li {
        display: inline-block;
        float: left;
        margin-left: 10px;
        text-align: center;
    }

    .social-share > li:first-child {
        margin-left: 0;
    }

    .social-share > li > a {
        border: 1px solid #dfdfdf;
        color: #009efb;
        display: inline-block;
        font-size: 22px;
        height: 40px;
        line-height: 40px;
        width: 40px;
    }

    .social-share > li > a:hover {
        background-color: #009efb;
        color: #fff;
        border-color: #009efb;
    }

    .widget h3 {
        color: #656565;
        font-size: 21px;
        margin: 0 0 20px;
    }

    .blog-reply > a {
        color: #009efb;
        font-size: 12px;
        font-weight: 500;
    }

    .blog-date {
        color: #999;
        font-size: 12px;
    }

    .comments-list {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .comments-list li {
        clear: both;
        padding: 10px 0 0 88px;
    }

    .comments-list li .comment {
        margin-bottom: 30px;
    }

    .comments-list li .comment-author {
        margin-left: -88px;
        position: absolute;
    }

    .comments-list li img.avatar {
        height: 58px;
        width: 58px;
        border-radius: 58px;
    }

    .blog-author-name {
        color: #009efb;
        font-size: 18px;
    }

    .text-red {
        color: #f00;
    }

    .new-comment label {
        font-size: 14px;
        font-weight: 500;
    }

    .new-comment input.form-control {
        border: 1px solid #e5e5e5;
        border-radius: 0;
        box-shadow: inherit;
        height: 40px;
    }

    .new-comment textarea.form-control {
        border: 1px solid #e5e5e5;
        border-radius: 0;
        box-shadow: inherit;
    }

    .new-comment .form-group {
        margin-bottom: 20px;
    }

    .comment-submit .btn {
        background-color: #009efb;
        border-color: #009efb;
        border-radius: 0;
        font-size: 18px;
        padding: 8px 26px;
        color: #fff;
    }

    .about-author-img {
        background-color: #fff;
        height: 120px;
        overflow: hidden;
        position: absolute;
        width: 120px;
    }

    .author-details {
        margin-left: 145px;
    }

    .about-author {
        min-height: 120px;
    }

    .author-details .blog-author-name {
        display: inline-block;
        margin-bottom: 10px;
    }

    .blog-navigation {
        text-align: right;
    }

    /*-----------------
	33. UI Kit
    ������ȫ��õ�Bootstrapģ�壺http://www.bootstrapMB.com
-----------------------*/

    .pagination-box .pagination {
        margin-top: 0;
    }

    .tab-content {
        padding-top: 20px;
    }

    /*-----------------
	34. Error
-----------------------*/

    .error-box {
        background-color: #fff;
        border-radius: 5px;
        line-height: 1;
        margin: 0 auto;
        max-width: 475px;
        padding: 50px 30px 55px;
        text-align: center;
        width: 100%;
    }

    .error-heading {
        font-size: 3.5em;
        font-weight: bold;
    }

    .error-title {
        color: #2c2c2c;
        font-size: 22px;
        font-weight: normal;
        margin: 0 0 1.5rem;
    }

    .error-wrapper {
        background-color: #fff;
        margin: 0;
        color: #4F5155;
        -moz-box-align: center;
        -moz-box-pack: center;
        align-items: center;
        display: flex;
        justify-content: center;
        height: 100%;
    }

    .error-box h1 {
        font-size: 150px;
    }

    .error-box p {
        margin-bottom: 30px;
    }

    .error-box .btn {
        text-transform: uppercase;
    }

    /*-----------------
	35. Lock Screen
-----------------------*/

    .lock-user {
        margin-bottom: 20px;
    }

    .lock-user img {
        margin-bottom: 15px;
        width: 100px;
    }

    /*-----------------
	36. Voice call
-----------------------*/

    .voice-call-avatar {
        flex-direction: column;
        display: flex;
        align-items: center;
        justify-content: center;
        flex: 2;
    }

    .voice-call-avatar .call-avatar {
        margin: 15px;
        width: 150px;
        height: 150px;
        border-radius: 100%;
        border: 1px solid rgba(0, 0, 0, 0.1);
        padding: 3px;
        background-color: #fff;
    }

    .call-duration {
        display: inline-block;
        font-size: 30px;
        margin-top: 4px;
        position: absolute;
        left: 0;
    }

    .voice-call-avatar .call-timing-count {
        padding: 5px;
    }

    .voice-call-avatar .username {
        font-size: 18px;
        text-transform: uppercase;
    }

    .call-icons {
        text-align: center;
        position: relative;
    }

    .call-icons .call-items {
        border-radius: 5px;
        padding: 0;
        margin: 0;
        list-style: none;
        display: inline-block;
    }

    .call-icons .call-items .call-item {
        display: inline-block;
        text-align: center;
        margin-right: 5px;
    }

    .call-icons .call-items .call-item:last-child {
        margin-right: 0;
    }

    .call-icons .call-items .call-item a {
        color: #777;
        border: 1px solid #ddd;
        width: 50px;
        height: 50px;
        line-height: 50px;
        border-radius: 50px;
        display: inline-block;
        font-size: 20px;
    }

    .call-icons .call-items .call-item a i {
        width: 18px;
        height: 18px;
    }

    .user-video {
        bottom: 0;
        left: 0;
        overflow: auto;
        position: absolute;
        right: 0;
        top: 0;
        z-index: 10;
    }

    .user-video img {
        width: auto;
        max-width: 100%;
        height: auto;
        max-height: 100%;
        display: block;
        margin: 0 auto;
    }

    .user-video video {
        width: auto;
        max-width: 100%;
        height: auto;
        max-height: 100%;
        display: block;
        margin: 0 auto;
    }

    .my-video {
        position: absolute;
        z-index: 99;
        bottom: 20px;
        right: 20px;
    }

    .my-video ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .my-video ul li {
        float: left;
        width: 120px;
        margin-right: 10px;
    }

    .my-video ul li img {
        border: 3px solid #fff;
        border-radius: 6px;
    }

    .end-call {
        position: absolute;
        top: 7px;
        right: 0;
    }

    .end-call a {
        color: #fff;
        border-radius: 50px;
        display: inline-block;
        background-color: #f06060;
        padding: 8px 25px;
        text-transform: uppercase;
    }

    .call-users {
        position: absolute;
        z-index: 99;
        bottom: 20px;
        right: 20px;
    }

    .call-users ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .call-users ul li {
        float: left;
        width: 80px;
        margin-left: 10px;
    }

    .call-users ul li img {
        border-radius: 6px;
        padding: 2px;
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, 0.1);
    }

    .call-mute {
        width: 80px;
        height: 80px;
        background-color: rgba(0, 0, 0, 0.5);
        position: absolute;
        display: inline-block;
        text-align: center;
        line-height: 80px;
        border-radius: 6px;
        font-size: 30px;
        color: #fff;
        display: none;
        top: 0;
        border: 3px solid transparent;
    }

    .call-users ul li a:hover .call-mute {
        display: block;
    }

    .call-details {
        margin: 10px 0 0px;
        display: flex;
    }

    .call-info {
        margin-left: 10px;
        width: 100%;
    }

    .call-user-details,
    .call-timing {
        display: block;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    .call-description {
        white-space: nowrap;
        vertical-align: bottom;
    }

    .call-timing {
        color: #a0a0a2;
        display: flex;
        font-size: 14px;
        margin-top: 1px;
        overflow: hidden;
        white-space: pre;
    }

    /*-----------------
	37. Video Call
-----------------------*/

    .content-full {
        height: 100%;
        position: relative;
        width: 100%;
    }

    .video-window .fixed-header {
        padding: 0;
        border: 0;
    }

    .video-window .fixed-header .nav > li > a {
        padding: 19px 15px;
    }

    /*-----------------
	38. Incoming Call
-----------------------*/

    .incoming-btns {
        margin-top: 20px;
    }

    .modal.custom-modal {
        background-color: #f5f5f5;
    }

    .custom-modal .modal-content {
        border: 0;
        background-color: transparent;
    }

    .custom-modal .profile-widget {
        margin-bottom: 0;
    }

    /*-----------------
	39. Notification settings
-----------------------*/

    .notification-list .list-group-item {
        padding: 15px;
    }

    /*-----------------
	40. Chat Sidebar
-----------------------*/

    .chat-sidebar {
        background-color: #fff;
        border-left: 1px solid #eaeaea;
        width: 300px;
    }

    .chat-sidebar .chat-contents {
        background-color: #fff;
    }

    .chat-sidebar .chat-left .chat-content {
        border: 0;
        padding: 0;
        border-radius: 0 !important;
        background-color: transparent;
        max-width: 100%;
    }

    .chat-sidebar .chat-left .chat-body {
        margin-left: 50px;
        padding-right: 0;
    }

    .chat-sidebar .chat-date {
        background-color: #fff;
    }

    .chat-sidebar .chats {
        padding: 15px 15px 30px;
    }

    .chat-sidebar .avatar {
        width: 30px;
        height: 30px;
        line-height: 30px;
    }

    .chat-sidebar .chat.chat-left {
        margin-bottom: 20px;
    }

    .chat-sidebar .chat.chat-left:last-child {
        margin-bottom: 0;
    }

    .chat-sidebar .chat-left .chat-time {
        color: #888;
        display: inline-block;
        font-size: 11px;
    }

    .chat-sidebar .chat-content > p {
        font-size: 13px;
        margin-bottom: 0;
    }

    .chat-sidebar.opened {
        margin-right: 0;
    }

    /*-----------------
	41. Gallery
-----------------------*/

    .lg-backdrop {
        z-index: 1041;
    }

    #lightgallery .img-thumbnail {
        box-shadow: 0 6px 15px rgba(36, 37, 38, 0.08);
    }

    /*-----------------
	42. Responsive
-----------------------*/

    @media only screen and (min-width: 991px) {

        .mini-sidebar .header-left .logo span {
            display: none;
        }

        .mini-sidebar .header .header-left {
            padding: 0 5px;
            width: 60px;
        }

        .mini-sidebar .sidebar {
            width: 60px;
        }

        .mini-sidebar.expand-menu .sidebar {
            width: 230px;
        }

        .mini-sidebar .menu-title {
            visibility: hidden;
            white-space: nowrap;
        }

        .mini-sidebar.expand-menu .menu-title {
            visibility: visible;
        }

        .modal-open .mini-sidebar .sidebar {
            z-index: 1051;
        }

        .mini-sidebar .sidebar .sidebar-menu ul > li > a span {
            display: none;
            transition: all 0.2s ease-in-out;
            opacity: 0;
        }

        .mini-sidebar.expand-menu .sidebar .sidebar-menu ul > li > a span {
            display: inline;
            opacity: 1;
        }

        .mini-sidebar .page-wrapper {
            margin-left: 60px;
        }
    }

    @media only screen and (min-width: 768px) {
        .modal-md {
            width: 500px;
        }

        .nav-tabs.nav-justified.nav-tabs-top {
            border-bottom: 1px solid #ddd;
        }

        .nav-tabs.nav-justified.nav-tabs-top > li > a,
        .nav-tabs.nav-justified.nav-tabs-top > li > a:hover,
        .nav-tabs.nav-justified.nav-tabs-top > li > a:focus {
            border-width: 2px 0 0 0;
        }

        .nav-tabs.nav-tabs-top > li {
            margin-bottom: 0;
        }

        .nav-tabs.nav-tabs-top > li > a,
        .nav-tabs.nav-tabs-top > li > a:hover,
        .nav-tabs.nav-tabs-top > li > a:focus {
            border-width: 2px 0 0 0;
        }

        .nav-tabs.nav-tabs-top > li + li > a {
            margin-left: 1px;
        }

        .nav-tabs.nav-tabs-top > li > a.active,
        .nav-tabs.nav-tabs-top > li > a.active:hover,
        .nav-tabs.nav-tabs-top > li > a.active:focus {
            border-top-color: #009efb;
        }

        .nav-tabs.nav-tabs-bottom > li {
            margin-bottom: -1px;
        }

        .nav-tabs.nav-tabs-bottom > li > a.active,
        .nav-tabs.nav-tabs-bottom > li > a.active:hover,
        .nav-tabs.nav-tabs-bottom > li > a.active:focus {
            border-bottom-width: 2px;
            border-color: transparent;
            border-bottom-color: #009efb;
            background-color: transparent;
            transition: none 0s ease 0s;
            -moz-transition: none 0s ease 0s;
            -o-transition: none 0s ease 0s;
            -ms-transition: none 0s ease 0s;
            -webkit-transition: none 0s ease 0s;
        }

        .nav-tabs.nav-tabs-bottom > li {
            margin-bottom: -1px;
        }

        .nav-tabs.nav-tabs-bottom > li > a.active,
        .nav-tabs.nav-tabs-bottom > li > a.active:hover,
        .nav-tabs.nav-tabs-bottom > li > a.active:focus {
            border-bottom-width: 2px;
            border-color: transparent;
            border-bottom-color: #009efb;
            background-color: transparent;
            transition: none 0s ease 0s;
            -moz-transition: none 0s ease 0s;
            -o-transition: none 0s ease 0s;
            -ms-transition: none 0s ease 0s;
            -webkit-transition: none 0s ease 0s;
        }

        .nav-tabs.nav-tabs-solid {
            background-color: #fafafa;
            border: 0;
        }

        .nav-tabs.nav-tabs-solid > li {
            margin-bottom: 0;
        }

        .nav-tabs.nav-tabs-solid > li > a {
            border-color: transparent;
        }

        .nav-tabs.nav-tabs-solid > li > a:hover,
        .nav-tabs.nav-tabs-solid > li > a:focus {
            background-color: #f5f5f5;
        }

        .nav-tabs.nav-tabs-solid > .open:not(.active) > a {
            background-color: #f5f5f5;
            border-color: transparent;
        }

        .nav-tabs-justified.nav-tabs-top {
            border-bottom: 1px solid #ddd;
        }

        .nav-tabs-justified.nav-tabs-top > li > a,
        .nav-tabs-justified.nav-tabs-top > li > a:hover,
        .nav-tabs-justified.nav-tabs-top > li > a:focus {
            border-width: 2px 0 0 0;
        }
    }

    @media only screen and (max-width: 1199.98px) {
        .invoices-view {
            width: 90%;
            float: right;
        }
    }

    @media only screen and (max-width: 991.98px) {
        .profile-rightbar {
            display: inline-block !important;
        }

        .chat-profile-view {
            display: none;
            -webkit-transition: all 0.4s ease;
            -moz-transition: all 0.4s ease;
            transition: all 0.4s ease;
            right: 0;
            transform: translateX(0px);
            z-index: 1041;
            width: 300px;
            position: fixed;
            margin-right: -300px;
            display: table-cell;
            top: 0;
            padding-bottom: 60px;
            margin-top: 50px;
        }

        .message-view.chat-view {
            width: 100%;
        }

        .slide-nav .page-wrapper {
            left: 225px;
            margin-left: 0;
        }

        .chat-main-row {
            left: 0;
        }

        .header .header-left {
            position: absolute;
            width: 100%;
        }

        .mobile_btn {
            display: block;
        }

        .page-title-box {
            display: none;
        }

        .sidebar {
            margin-left: -225px;
            width: 225px;
        }

        .page-wrapper {
            margin-left: 0;
            padding-left: 0;
            padding-right: 0;
        }

        .slide-nav .sidebar {
            margin-left: 0;
        }

        a.mobile_btn {
            color: #fff;
            font-size: 24px;
            height: 50px;
            left: 0;
            line-height: 50px;
            padding: 0 20px;
            position: absolute;
            top: 0;
            width: 60px;
            z-index: 10;
        }

        .slide-nav .page-wrapper {
            left: 225px;
            margin-left: 0;
        }

        .invoices-view {
            width: 100%;
            float: none;
        }

        #toggle_btn {
            display: none;
        }

        .sidebar {
            -webkit-transition: all 0.4s ease;
            -moz-transition: all 0.4s ease;
            transition: all 0.4s ease;
        }

        .page-wrapper {
            -webkit-transition: all 0.4s ease;
            -moz-transition: all 0.4s ease;
            transition: all 0.4s ease;
        }
    }

    @media only screen and (max-width: 767.98px) {
        .profile-info-left {
            border-right: none;
            border-bottom: 2px dashed #ccc;
            margin-bottom: 20px;
            padding-bottom: 20px;
        }

        .navbar-nav .open .dropdown-menu {
            float: left;
            position: absolute;
        }

        .notifications {
            right: -48px;
        }

        .notifications:before,
        .notifications:after {
            right: 60px;
        }

        .modal-body.card-box {
            background-color: #fff;
            border: none;
            border-radius: inherit;
            box-shadow: unset;
            margin-bottom: 0;
            padding: 15px;
        }

        .roles-menu {
            margin-bottom: 20px;
        }

        .left-action {
            text-align: center;
            margin-bottom: 15px;
        }

        .right-action {
            text-align: center;
        }

        .top-action-left .float-left {
            float: none !important;
        }

        .top-action-left .btn-group {
            margin-bottom: 15px;
        }

        .top-action-right {
            text-align: center;
        }

        .top-action-right a.btn.btn-white {
            margin-bottom: 15px;
        }

        .mail-sent-time {
            float: left;
            margin-top: 10px;
            width: 100%;
        }

        .nav-tabs.nav-justified {
            border-bottom: 1px solid #ddd;
        }

        .nav-tabs.nav-justified > li > a.active,
        .nav-tabs.nav-justified > li > a.active:hover,
        .nav-tabs.nav-justified > li > a.active:focus {
            border-color: transparent transparent transparent #009efb;
            border-left-width: 2px;
        }

        .nav-tabs {
            border-bottom: 0;
            position: relative;
            background-color: #fff;
            padding: 5px 0;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .nav-tabs .nav-item {
            margin-bottom: 0;
        }

        .nav-tabs > li > a {
            border-width: 2px;
            border-left-color: transparent;
        }

        .nav-tabs .nav-link {
            border-width: 2px;
        }

        .nav-tabs > li > a:hover,
        .nav-tabs > li > a:focus {
            background-color: #fafafa;
        }

        .nav-tabs .nav-item.show .nav-link,
        .nav-tabs .nav-link.active,
        .nav-tabs > li > a.active,
        .nav-tabs > li > a.active:hover,
        .nav-tabs > li > a.active:focus {
            background-color: #f5f5f5;
            border-color: transparent transparent transparent #009efb;
            border-left-width: 2px;
        }

        .nav-tabs > li.open:not(.active) > a,
        .nav-tabs > li.open:not(.active) > a:hover,
        .nav-tabs > li.open:not(.active) > a:focus {
            background-color: #fafafa;
        }

        .nav-tabs.nav-tabs-solid {
            padding: 5px;
        }

        .nav-tabs.nav-tabs-solid.nav-tabs-rounded {
            border-radius: 5px;
        }

        .nav-tabs.nav-tabs-solid > li > a {
            border-left-width: 0 !important;
        }

        .nav-tabs-justified {
            border-bottom: 1px solid #ddd;
        }

        .nav-tabs-justified > li > a.active,
        .nav-tabs-justified > li > a.active:hover,
        .nav-tabs-justified > li > a.active:focus {
            border-width: 0 0 0 2px;
            border-left-color: #009efb;
        }

        h1 {
            font-size: 2em;
        }

        h2 {
            font-size: 1.5em;
        }

        h3 {
            font-size: 1.17em;
        }

        h4 {
            font-size: 1.12em;
        }

        h5 {
            font-size: .83em;
        }

        h6 {
            font-size: .75em;
        }

        .page-title {
            font-size: 1.2em;
            padding-top: 10px;
        }

        .card-title {
            font-size: 1.12em;
        }

        .blog-view .blog-title {
            font-size: 24px;
        }

        .widget h3 {
            font-size: 18px;
        }

        .my-video ul li {
            width: 80px;
        }

        .voice-call-avatar .call-avatar {
            width: 120px;
            height: 120px;
        }

        .table-responsive {
            display: block;
            width: 100%;
            overflow-x: auto;
            -ms-overflow-style: -ms-autohiding-scrollbar;
        }

        .header .has-arrow .dropdown-toggle > span:nth-child(2) {
            display: none;
        }

        .header .has-arrow .dropdown-toggle:after {
            display: none;
        }

        .btn-white {
            margin: 0px;
        }
    }

    @media only screen and (max-width: 575.98px) {
        .contact-cat {
            padding-right: 70px;
        }

        .user-menu {
            display: none;
        }

        .mobile-user-menu {
            display: block;
        }

        .search-box {
            display: none;
        }

        .filter-row {
            margin-bottom: 15px;
        }

        .page-wrapper > .content {
            padding: 15px;
        }

        .profile-view .profile-basic {
            margin-left: 0;
        }

        .profile-img-wrap {
            position: relative;
            margin: 0 auto;
        }

        .profile-view .profile-img-wrap {
            margin: 0 auto 10px;
            height: 100px;
            width: 100px;
        }

        .profile-view .profile-img {
            height: 100px;
            width: 100px;
        }

        .profile-view .profile-img .avatar {
            font-size: 24px;
            height: 100px;
            line-height: 100px;
            margin: 0;
            width: 100px;
        }

        .profile-info-left {
            text-align: center;
        }

        .profile-basic {
            margin-left: 0;
            margin-top: 15px;
        }

        .page-title {
            font-size: 18px;
        }

        .fc-toolbar .fc-right {
            display: inline-block;
            float: none;
            margin: 10px auto 0;
            width: 200px;
            clear: both;
        }

        .fc-toolbar .fc-left {
            float: none;
            margin: 0 auto;
            width: 200px;
        }

        .upload-text {
            font-size: 18px;
        }

        .call-duration {
            display: block;
            margin-top: 0;
            margin-bottom: 10px;
            position: inherit;
        }

        .end-call {
            margin-top: 10px;
            position: inherit;
        }

        .chat-right .chat-content {
            max-width: 90%;
        }

        .chat-right .chat-body {
            padding-left: 0;
            padding-right: 0;
        }

        .chat-left .chat-content {
            max-width: 90%;
        }

        .chat-left .chat-body {
            padding-left: 0;
            padding-right: 0;
        }

        .chat-avatar .avatar {
            height: 20px;
            line-height: 20px;
            width: 20px;
        }

        .account-box {
            width: 100%;
            margin-bottom: 20px;
        }

        .content {
            padding: 0 50px;
        }

        .custom-menu.navbar-nav > li > a {
            margin-left: 10px;
        }

        .error-box h1 {
            font-size: 50px;
        }

        .submit-btn {
            min-width: 150px;
        }

        .ui-kit-wrapper button {
            margin-bottom: 5px;
        }

        .pagination > li > a,
        .pagination > li > span {
            padding: .5rem !important;
        }
    }

    @media only screen and (max-width: 479px) {
        .compose-btn button {
            padding: 0.365rem 0.5rem;
        }

        .attachments li {
            float: none;
            text-align: center;
            margin: 0 auto;
            margin-bottom: 10px;
        }
    }
</style>
</html>
