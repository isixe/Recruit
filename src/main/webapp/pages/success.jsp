<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>success</title>
    <!-- CSS -->
    <link rel="stylesheet" href="../static/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="../static/css/success.css" />
    <link rel="stylesheet" href="../static/css/media.css" />
    <!-- JS -->
    <script src="../static/vendor/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="container-fluid" id="header">
        <div class="row">
            <div class="col-md-6"><img class="header-logo" src="../static/images/logo.png"></div>
            <div class="col-md-6 header-return"><button onclick="window.location.href='/index.jsp'">返回首页</button></div>
        </div>
    </div>

    <div class="container-fluid main-container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3">
                <div class="replay">
                    <p class="replay-p1">你好</p>
                    <p class="replay-p2">您的申请我们已经收到</p>
                    <p>我们已经发送简历登记表到您的邮箱，请您及时填写</p>
                </div>
            </div>

            <div class="col-md-3 col-md-offset-1" >
                <div class="success">
                    <div class="success-top"><img src="../static/images/yes.png" style="max-width: 35%;"></div>
                    <div class="success-bottom"><p>提交成功</p></div>
                </div>
            </div>
            <div class="col-md-3 return-index">
                <button  onclick="window.location.href='index.html'">返回首页</button>
            </div>
        </div>
    </div>

</div>
</body>
</html>