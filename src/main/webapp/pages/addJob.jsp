<%--
  Created by IntelliJ IDEA.
  User: Simat
  Date: 2022/12/21
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../static/css/base.css" />
    <link rel="stylesheet" href="../static/css/info-reg.css" />
    <title>网上招聘系统</title>
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
    <h2>发布招聘</h2>
</div>
<form id="fm" action="${pageContext.request.contextPath}/addJobServlet" method="post">
    <div class="main">
\        <p class="short-input ue-clear">
            <label>标题</label>
            <input name="title" type="text" style="width:258px;height:27px;border:1px solid #C5D6E0"/>
        </p>
        <p class="long-input ue-clear">
            <label>*公司地址：</label>
            <input name="area" type="text"/>
        </p>
        <p class="long-input ue-clear">
            <label>*联系方式：</label>
            <input name="contact" type="text"/>
        </p>
        <p class="long-input ue-clear">
            <label>*岗位职责：</label>
            <input name="requirement" type="text"/>
        </p>
        <p class="long-input ue-clear">
            <label>*任职要求：</label>
            <input name="require" type="text"/>
        </p>
        <p class="long-input ue-clear">
            <label>*福利：</label>
            <input name="welfalre" type="text"/>
        </p>
        <div class="short-input select ue-clear">
            <label>职位需求：</label>
            <select name="position" style="width:200px;height:30px;border:1px solid #C5D6E0">
                <option value="1">软件工程师</option>
                <option value="2">会计</option>
                <option value="3">文员</option>
                <option value="4">客户经理</option>
                <option value="5">网站策划</option>
                <option value="6">平面设计师</option>
            </select>
        </div>
        <div class="short-input select ue-clear">
            <label>薪资待遇：</label>
            <select name="salary"style="width:200px;height:30px;border:1px solid #C5D6E0">
                <option>3000-4000</option>
                <option>4001-5000</option>
                <option>5001-6000</option>
                <option>6001-7000</option>
                <option>7001-8000</option>
            </select>
        </div>
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
<script type="text/javascript">
    showRemind('input[type=text], textarea','placeholder');

    $( "#fm" ).validate({
        rules: {
            username: {
                required: true,
                minlength: 4,
                maxlength: 10
            },
            password: {
                required:true
            },
            name: {
                required:true
            },
            location: {
                required:true
            },
            phone: {
                required:true
            }
        },

        messages: {
            username: {
                required: "*不能为空！",
                maxlength: $.validator.format( "长度不得大于10个字符！" ),
                minlength: $.validator.format( "长度不得小于4个字符！" )
            },
            password: {
                required: "*不能为空！"
            },
            name: {
                required: "*不能为空！"
            },
            location: {
                required: "*不能为空！"
            },
            phone: {
                required:"*不能为空！"
            }
        },
        submitHandler: function(form) {
            validate();  //用自定义函数提交表单
        }
    });

    //ajax验证用户名成功后，再进行注册
    function validate(){
        $.ajax({
            url:"../registerServlet",
            type:"post",
            dataType:"text",
            data:$("#fm").serialize(),
            success:function(data){
                console.log(data);
                if(data=='该用户名已存在！'){
                    $("#validate").html(data);
                }else{
                    alert("注册成功！");
                    window.open ('/ors/login.jsp','_top');
                }
            }
        });
    }
</script>
</html>

