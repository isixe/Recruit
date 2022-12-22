<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
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
    <title>我的公司</title>
    <!-- CSS -->
    <link rel="stylesheet" href="../static/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/index.css">
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <link href="../static/css/external.min.css" type="text/css" rel="stylesheet">
    <!-- JS -->
    <script src="../static/vendor/bootstrap.min.js"></script>
</head>
<body>

<div id="box">
    <!-- ==============顶栏============== -->
    <div id="container">
        <div class="clearfix">

            <div class="content_l">
                <div class="c_detail">
                    <div class="c_box companyName">
                        <h2 title="${company.name}">${company.name}</h2>

                        <div class="clear oneword">
                            <span>${company.desc}</span>
                            &nbsp;
                        </div>
                        <h3 class="dn">已选择标签</h3>
                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
                            <li><span>年终分红</span></li>
                            <li><span>五险一金</span></li>
                            <li><span>弹性工作</span></li>
                            <li><span>岗位晋升</span></li>
                            <a href="${pageContext.request.contextPath}/pages/updateCompany.jsp?id=${company.id}"><li class="link">编辑</li></a>
                        </ul>
                    </div>
                </div>

                <div class="c_breakline"></div>

                <div id="Profile">
                    <div class="profile_wrap">

                        <!--有介绍-->
                        <dl class="c_section">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="c_intro">
                                    ${company.desc}
                                </div>
                                <a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
                            </dd>
                        </dl>
                    </div>

                </div><!-- end #Profile -->


            </div>

            <div class="content_r">
                <div id="Tags">
                    <div id="c_tags_show" class="c_tags solveWrap">
                        <table>
                            <tbody>
                            <tr>
                                <td width="45">地点</td>
                                <td>${company.area}</td>
                            </tr>
                            <tr>
                                <td>规模</td>
                                <td>150-500人</td>
                            </tr>
                            </tbody>
                        </table>
                        <a id="editTags" class="c_edit" href="javascript:void(0)"></a>
                    </div>
                </div><!-- end #Tags -->

                <div id="Member">
                    <!--有创始团队-->
                    <dl class="c_section c_member">
                        <dt>
                            <h2><em></em>创始团队</h2>
                            <a title="添加创始人" class="c_add" href="javascript:void(0)"></a>
                        </dt>
                        <dd>

                            <div class="member_wrap">
                                <!-- 显示创始人 -->
                                <div class="member_info">
                                    <a title="编辑创始人" class="c_edit member_edit" href="javascript:void(0)"></a>
                                    <div class="m_name">
                                        ${requestScope.username}
                                    </div>
                                    <div class="m_intro">${requestScope.username}，${company.name}</div>
                                </div>

                            </div><!-- end .member_wrap -->
                        </dd>
                    </dl>
                </div> <!-- end #Member -->

            </div>
        </div>
        <div class="clear"></div>
    </div><!-- end #container -->
</div><!-- end #body -->


</body>
</html>
