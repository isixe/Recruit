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
    //System.out.println("用户id："+sid);

    //通过id获取用户用户角色，根据用户角色，跳转相应界面
    if (sid != null) {
        int id = Integer.parseInt(sid);
        User user = new User();
        UserDao userDao = new UserDaoImpl();
        try {
            user = userDao.findById(id);
            String role = user.getRole();
            request.getSession().setAttribute("role", role);
            request.setAttribute("role", role);
            String path = request.getContextPath();
            if ("admin".equals(role)) {
                response.sendRedirect(path + "/admin.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>
<html>
<head>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>前程似锦招聘网</title>
        <!-- CSS -->
        <link rel="stylesheet" href="./static/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="./static/css/index.css">
        <!-- JS -->
        <script src="./static/vendor/bootstrap.min.js"></script>
    </head>

<body>
<div class="box">
    <!-- ==============顶栏============== -->
    <div class="header">
        <div class="wrapper">
            <!-- 左边城市 -->
            <div class="left">
                <ul>
                    <li>北京</li>
                    <li>[切换城市]</li>
                </ul>
            </div>
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
                            <div class="first"><a
                                    href="${pageContext.request.contextPath}/pages/userCenter.jsp">个人中心</a></div>
                            <!-- 二级导航 -->
                            <div class="second">
                                <ul>
                                    <a href="${pageContext.request.contextPath}/pages/preview.jsp">
                                        <li>我的简历</li>
                                    </a>
                                    <li>我的求职</li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${requestScope.role=='company'}">
                        <li>
                            <!-- 一级导航 -->
                            <a href="${pageContext.request.contextPath}/pages/myCompany.jsp">
                                <div class="first">企业中心</div>
                            </a>
                            <!-- 二级导航 -->
                            <div class="second">
                                <ul>
                                    <li>我的发布</li>
                                    <li>企业信息</li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- 右边导航栏 -->
        </div>
    </div>
    <!-- ==============顶栏============== -->

    <!-- ==============中间logo、搜索============== -->
    <div class="search">
        <div class="wrapper">
            <!-- 左边logo -->
            <div class="left">
                <img src="./static/images/logo.png" alt="">
            </div>
            <!-- 左边logo -->

            <!-- 中间搜索框，以及职业 -->
            <div class="center">
                <div class="search">
                    <div class="input">
                        <input type="text">
                    </div>
                    <p>搜职位</p>
                </div>
                <div class="job">
                    <span>收营员</span>
                    <span>理货员</span>
                    <span>服务员</span>
                    <span>店员</span>
                    <span>营业员</span>
                </div>
            </div>
            <!-- 中间搜索框，以及职业 -->

            <!-- 发布职位按钮 -->
            <div class="right">
                <button class="btn btn-warning shadow-sm"><span class="iconfont icon-jinggao"></span>发布招聘</button>
            </div>
            <!-- 发布职位按钮 -->
        </div>
    </div>
    <!-- ==============中间logo、搜索============== -->

    <!-- ==============地点、职位、福利============== -->
    <div id="menu">
        <div class="wrapper">

            <div id="job" class="menu-item">
                <ul>
                    <li>职位：</li>
                    <li class="item-all current">全部</li>
                </ul>
            </div>

            <div id="postion" class="menu-item">
                <ul>
                    <li>省份：</li>
                    <li class="item-all current">全部</li>
                    <li>北京</li>
                    <li>上海</li>
                    <li>深圳</li>
                    <li>厦门</li>
                    <li>广东</li>
                    <li>福建</li>
                </ul>
            </div>

            <div id="welfare" class="menu-item ">
                <ul>
                    <li>福利：</li>
                    <li class="item-all current">全部</li>
                    <li>五险一金</li>
                    <li>节假日补贴</li>
                    <li>下午茶</li>
                    <li>现金补贴</li>
                    <li>住房补贴</li>
                    <li>餐补福利</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- ==============地点、职位、福利============== -->

    <!-- ==============已选============== -->
    <div class="select">
        <div class="wrapper">
            <div>已选：</div>
            <p class="shadow-sm">超市/零售-收营员<span class="iconfont icon-cc-close-crude"></span></p>
        </div>
    </div>
    <!-- ==============已选============== -->


    <!-- ==============工作============== -->
    <div class="recruit">
        <div class="wrapper">

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 信息 -->
            <div class="information">
                <div class="left">
                    <p>190/天上一休一连锁超市急招营业员</p>
                    <p>4000-5000 元/月</p>
                    <p>
                        <span class="bg-info text-light">五险一金</span>
                        <span class="bg-danger text-light">保吃</span>
                        <span class="bg-success text-light">包住</span>
                    </p>
                </div>
                <div class="center">
                    <div class="top">
                        <span>工作时间：全职工作&emsp;&emsp;&emsp;工作类型：收银员</span>
                    </div>
                    <div class="buttom">
                        <span>招聘人数：10人&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;工作地点：海淀和春路</span>
                    </div>
                </div>
                <div class="right">
                    <button class="btn btn-primary">报名参加</button>
                </div>
            </div>
            <!-- 信息 -->

            <!-- 分页符 -->
            <div class="pagination">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-lg justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">6</a></li>

                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- 分页符 -->
        </div>
    </div>
    <!-- ==============工作============== -->

    <!-- ==============报名模态框============== -->
    <div class="modal fade bd-example-modal-xl" id="registerModalModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModjob-allabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModjob-allabel">快速报名</h5>
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>

</html>
