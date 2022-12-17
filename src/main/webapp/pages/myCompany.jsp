<%@ page import="bean.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = null;
    String sid = null;
    //获取登录传递的Session变量（用户id, 用户名）
    username = (String) request.getSession().getAttribute("username");
    sid = (String) request.getSession().getAttribute("userid");
    request.setAttribute("username", username);
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
        } catch (Exception e) {
            System.out.println(e);
        }
    }
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
    <div class="header">
        <div class="wrapper">

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
                    <c:if test="${requestScope.role=='company'}">
                        <li>
                            <!-- 一级导航 -->
                            <div class="first">企业中心</div>
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
    <div id="container">
        <!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
        <div class="clearfix">

            <div class="content_l">
                <div class="c_detail">
                    <div style="background-color:#fff;" class="c_logo">
                        <a title="上传公司LOGO" id="logoShow" class="inline cboxElement" href="#logoUploader">
                            <img width="190" height="190" alt="公司logo" src="../static/images/logo_default.png">

                            <span>更换公司图片<br>190px*190px 小于5M</span>
                        </a>
                    </div>
                    <div class="c_box companyName">
                        <h2 title="平潭协创进出口贸易有限公司">平潭协创贸易有限公司</h2>

                        <h1 title="福建平潭协创进出口贸易有限公司" class="fullname">福建平潭协创进出口贸易有限公司</h1>

                        <form class="clear editDetail dn" id="editDetailForm">
                            <input type="text" placeholder="请输入公司简称" maxlength="15" value="平潭协创进出口贸易有限公司"
                                   name="companyShortName" id="companyShortName">
                            <input type="text" placeholder="一句话描述公司优势，核心价值，限50字" maxlength="50" value="测试的发打发打发大范德萨发"
                                   name="companyFeatures" id="companyFeatures">
                            <input type="hidden" value="25927" id="companyId" name="companyId">
                            <input type="submit" value="保存" id="saveDetail" class="btn_small">
                            <a id="cancelDetail" class="btn_cancel_s">取消</a>
                        </form>

                        <div class="clear oneword"><img width="17" height="15" src="style/images/quote_l.png">&nbsp;
                            <span>平潭协创进出口贸易有限公司成立于2012年08月03日，注册地位于平潭县岚城乡世界城二期25幢7单元601，法定代表人为周孙文。经营范围包括电子产品、机电设备、食用农产品、服装鞋帽、日用百货、电脑及周边设备、水产品、汽车及零配件（不含品牌轿车）销售；工程机械设备销售、租赁；自营和代理各类商品和技术的进出口业务，但国家法律法规禁止经营的范围除外；法律法规未规定许可的，均可自主选择经营项目开展经营。(依法须经批准的项目，经相关部门批准后方可开展经营活动)</span> &nbsp;<img width="17" height="15" src="style/images/quote_r.png">
                        </div>
                        <h3 class="dn">已选择标签</h3>
                        <ul style="overflow:auto" id="hasLabels" class="reset clearfix">
                            <li><span>年终分红</span></li>
                            <li><span>五险一金</span></li>
                            <li><span>弹性工作</span></li>
                            <li><span>岗位晋升</span></li>
                            <li class="link">编辑</li>
                        </ul>
                        <div class="dn" id="addLabels">
                            <a id="changeLabels" class="change" href="javascript:void(0)">换一换</a>
                            <input type="hidden" value="1" id="labelPageNo">
                            <input type="submit" value="贴上" class="fr" id="add_label">
                            <input type="text" placeholder="添加自定义标签" name="label" id="label" class="label_form fr">
                            <div class="clear"></div>
                            <ul class="reset clearfix"></ul>
                            <a id="saveLabels" class="btn_small" href="javascript:void(0)">保存</a>
                            <a id="cancelLabels" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                        </div>
                    </div>
                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" href="javascript:void(0);"></a>
                    <div class="clear"></div>
                </div>

                <div class="c_breakline"></div>

                <div id="Profile">
                    <div class="profile_wrap">
                        <!--无介绍 -->
                        <dl class="c_section dn">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="addnew">
                                    详细公司的发展历程、让求职者更加了解你!<br>
                                    <a id="addIntro" href="javascript:void(0)">+添加公司介绍</a>
                                </div>
                            </dd>
                        </dl>
                        <!--编辑介绍-->
                        <dl class="c_section newIntro dn">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <form id="companyDesForm">
                                    <textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyProfile" id="companyProfile">该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎该方法嘎嘎</textarea>
                                    <div class="word_count fr">你还可以输入 <span>1000</span> 字</div>
                                    <div class="clear"></div>
                                    <input type="submit" value="保存" id="submitProfile" class="btn_small">
                                    <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>
                                </form>
                            </dd>
                        </dl>

                        <!--有介绍-->
                        <dl class="c_section">
                            <dt>
                                <h2><em></em>公司介绍</h2>
                            </dt>
                            <dd>
                                <div class="c_intro">平潭协创进出口贸易有限公司成立于2012年08月03日，注册地位于平潭县岚城乡世界城二期25幢7单元601，法定代表人为周孙文。经营范围包括电子产品、机电设备、食用农产品、服装鞋帽、日用百货、电脑及周边设备、水产品、汽车及零配件（不含品牌轿车）销售；工程机械设备销售、租赁；自营和代理各类商品和技术的进出口业务，但国家法律法规禁止经营的范围除外；法律法规未规定许可的，均可自主选择经营项目开展经营。(依法须经批准的项目，经相关部门批准后方可开展经营活动)</div>
                                <a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
                            </dd>
                        </dl>
                    </div>

                </div><!-- end #Profile -->

                <!--[if IE 7]> <br/> <![endif]-->

                <!--无招聘职位-->
                <dl id="noJobs" class="c_section">
                    <dt>
                        <h2><em></em>招聘职位</h2>
                    </dt>
                    <dd>
                        <div class="addnew">
                            发布需要的人才信息，让伯乐和千里马尽快相遇……<br>
                            <a href="createJob.jsp">+添加招聘职位</a>
                        </div>
                    </dd>
                </dl>

                <input type="hidden" value="" name="hasNextPage" id="hasNextPage">
                <input type="hidden" value="" name="pageNo" id="pageNo">
                <input type="hidden" value="" name="pageSize" id="pageSize">
                <div id="flag"></div>
            </div>    <!-- end .content_l -->

            <div class="content_r">
                <div id="Tags">
                    <div id="c_tags_show" class="c_tags solveWrap">
                        <table>
                            <tbody>
                            <tr>
                                <td width="45">地点</td>
                                <td>上海</td>
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

                                <!-- 无创始人 -->
                                <div class="member_info addnew_right dn">
                                    展示公司的领导班子，<br>提升诱人指数！<br>
                                    <a class="member_edit" href="javascript:void(0)">+添加成员</a>
                                </div>

                                <!-- 编辑创始人 -->
                                <div class="member_info newMember dn">
                                    <form class="memberForm">
                                        <div class="new_portrait">
                                            <div class="portrait_upload dn portraitNo">
                                                <span>上传创始人头像</span>
                                            </div>
                                            <div class="portraitShow">
                                                <img width="120" height="120" src="style/images/leader_default.png">
                                                <span>更换头像</span>
                                            </div>
                                            <input type="file" value="" title="支持jpg、jpeg、gif、png格式，文件小于5M"
                                                   onchange="member_check(this,'http://www.lagou.com/c/upload.json','portraitNo','portraitShow','type','leaderInfos');"
                                                   name="myfiles" id="profiles0">
                                            <input type="hidden" value="7" name="type" class="type">
                                            <input type="hidden" value="images/leader_default.png" name="photo"
                                                   class="leaderInfos">
                                            <em>
                                                尺寸：120*120px <br>
                                                大小：小于5M
                                            </em>
                                        </div>
                                        <input type="text" placeholder="请输入创始人姓名" value="孙泰英" name="name">
                                        <input type="text" placeholder="请输入创始人当前职位" value="ceo" name="position">
                                        <input type="text" placeholder="请输入创始人新浪微博地址" value="http://weimob.weibo.com"
                                               name="weibo">
                                        <textarea placeholder="请输入创始人个人简介" maxlength="500" class="s_textarea"
                                                  name="remark">一个</textarea>
                                        <div class="word_count fr">你还可以输入 <span>500</span> 字</div>
                                        <div class="clear"></div>
                                        <input type="submit" value="保存" class="btn_small">
                                        <a class="btn_cancel_s member_delete" href="javascript:void(0)">删除</a>
                                        <input type="hidden" value="11493" class="leader_id">
                                    </form>
                                </div>

                                <!-- 显示创始人 -->
                                <div class="member_info">
                                    <a title="编辑创始人" class="c_edit member_edit" href="javascript:void(0)"></a>
                                    <div class="m_portrait">
                                        <div></div>
                                        <img width="120" height="120" alt="孙泰英" src="style/images/leader_default.png">
                                    </div>
                                    <div class="m_name">
                                        孙泰英
                                        <a target="_blank" class="weibo" href="http://weimob.weibo.com"></a>
                                    </div>
                                    <div class="m_position">ceo</div>
                                    <div class="m_intro">孙泰英，平潭协创贸易有限公司，从事贸易行业。</div>
                                </div>

                            </div><!-- end .member_wrap -->
                        </dd>
                    </dl>
                </div> <!-- end #Member -->

            </div>
        </div>

        <script src="style/js/company.min.js" type="text/javascript"></script>
        <script>
            var avatar = {};
            avatar.uploadComplate = function (data) {
                var result = eval('(' + data + ')');
                if (result.success) {
                    jQuery('#logoShow img').attr("src", ctx + '/' + result.content);
                    jQuery.colorbox.close();
                }
            };
        </script>
        <div class="clear"></div>
        <input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop" style="display: inline;"></a>
    </div><!-- end #container -->
</div><!-- end #body -->


</body>
</html>
