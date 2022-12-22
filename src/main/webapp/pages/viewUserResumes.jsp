﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <script type="text/javascript" async="" src="static/js/conversion.js"></script>
    <script src="static/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>查看用户简历</title>

    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link href="static/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="static/vendor/jquery.1.10.1.min.js"></script>
    <script src="static/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/js/ajaxfileupload.js"></script>
    <script src="static/js/additional-methods.js" type="text/javascript"></script>

    <script src="static/js/conv.js" type="text/javascript"></script>
    <script src="static/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<body>
<div id="body">
    <div id="container">
        <div class="sidebar">
            <a class="btn_create" href="createresume1.html">发布新职位</a>
            <dl class="company_center_aside">
                <dt>我收到的简历</dt>
                <dd>
                    <a href="${pageContext.request.contextPath}/findResumeServlet?status=待处理">待处理简历</a>
                </dd>
                <dd>
                    <a href="findResumeServlet?status=待定">待定简历</a>
                </dd>
                <dd>
                    <a href="findResumeServlet?status=已通知面试">已通知面试简历</a>
                </dd>
                <dd>
                    <a href="findResumeServlet?status=不合适">不合适简历</a>
                </dd>
                <dd class="current btm">
                    <a href="findResumeServlet?status=自动过滤">自动过滤简历</a>
                    <span>1</span>
                </dd>
            </dl>
            <dl class="company_center_aside">
                <dt>我发布的职位</dt>
                <dd>
                    <a href="positions.html">有效职位</a>
                </dd>
                <dd>
                    <a href="positions.html">已下线职位</a>
                </dd>
            </dl>
        </div><!-- end .sidebar -->
        <div class="content">
            <dl class="company_center_content">
                <dt>
                    <h1>
                        <em></em>
                        自动过滤简历 <span>（共1份）</span></h1>
                </dt>
                <dd>
                    <form action="autoFilterResumes.html" method="post" id="filterForm">
                        <div class="filter_tip">
                            系统将自动过滤学历、城市、工作年限 <span>不符合</span> 要求的简历，自动过滤的简历若 <span>15</span> 日内未作处理，拉勾将自动发送拒绝邮件至用户邮箱。
                        </div>
                        <div class="filter_actions ">
                            <label class="checkbox">
                                <input type="checkbox">
                                <i></i>
                            </label>
                            <span>全选</span>
                            <a id="resumeInterviewAll" href="javascript:;">待定</a>
                            <a id="resumeRefuseAll" href="javascript:;">不合适</a>
                            <div id="filter_btn">筛选简历 <em></em></div>
                        </div><!-- end .filter_actions -->
                        <div class="filter_options  dn ">
                            <dl>
                                <dt>简历状态：</dt>
                                <dd>
                                    <a rel="-1" class="current" href="javascript:;">不限</a>
                                    <a rel="1" href="javascript:;">未阅读</a>
                                    <a rel="2" href="javascript:;">已阅读</a>
                                    <a rel="3" href="javascript:;">已转发</a>
                                    <input type="hidden" value="-1" name="resumeStatus">
                                </dd>
                            </dl>
                            <dl>
                                <dt>简历形式：</dt>
                                <dd>
                                    <a rel="-1" class="current" href="javascript:;">不限</a>
                                    <a rel="0" href="javascript:;">附件简历</a>
                                    <a rel="1" href="javascript:;">在线简历</a>
                                    <input type="hidden" value="-1" name="resumeType">
                                </dd>
                            </dl>
                            <dl>
                                <dt>工作经验：</dt>
                                <dd>
                                    <a rel="-1" class="current" href="javascript:;">不限</a>
                                    <a rel="1" href="javascript:;">应届毕业生</a>
                                    <a rel="2" href="javascript:;">一年以下</a>
                                    <a rel="3" href="javascript:;">1-3年</a>
                                    <a rel="4" href="javascript:;">3-5年</a>
                                    <a rel="5" href="javascript:;">5-10年</a>
                                    <a rel="6" href="javascript:;">10年以上</a>
                                    <input type="hidden" value="-1" name="workExp">
                                </dd>
                            </dl>
                            <dl>
                                <dt>最低学历：</dt>
                                <dd>
                                    <a rel="-1" class="current" href="javascript:;">不限</a>
                                    <a rel="1" href="javascript:;">大专及以上</a>
                                    <a rel="2" href="javascript:;">本科及以上</a>
                                    <a rel="3" href="javascript:;">硕士及以上</a>
                                    <a rel="4" href="javascript:;">博士及以上</a>
                                    <input type="hidden" value="-1" name="eduExp">
                                </dd>
                            </dl>
                            <input type="hidden" value="0" name="filterStatus" id="filterStatus">
                            <input type="hidden" value="" name="positionId" id="positionId">
                        </div><!-- end .filter_options -->
                        <c:forEach items = "${resumes}" var="resume">
                        <ul class="reset resumeLists">
                            <li data-id="1686182" class="onlineResume">
                                <label class="checkbox">
                                    <input type="checkbox">
                                    <i></i>
                                </label>

                                <div class="resumeShow">
                                    <a title="预览在线简历" target="_blank" class="resumeImg"
                                       href="resumeView.html?deliverId=1686182">
                                        <img src="${resume.picture}">
                                    </a>

                                        <div class="resumeIntro">
                                            <h3 class="unread">
                                                <a target="_blank" title="预览jason的简历"
                                                   href="resumeView.html?deliverId=1686182">
                                                  ${resume.name}
                                                </a>
                                                <em></em>
                                            </h3>
                                            <span class="fr">投递时间：${resume.datetime}</span>
                                            <div>
                                                ${resume.name} / ${resume.sex} / ${resume.education} / ${resume.year} / ${resume.city} <br>
                                                ${resume.major} | ${resume.school}
                                            </div>

                                        </div>
                                        <div class="links">
                                            <a data-deliverid="1686182" data-name="jason" data-positionid="149594"
                                               data-email="888888888@qq.com" class="resume_notice"
                                               href="javascript:void(0)">通知面试</a>
                                            <a data-deliverid="1686182" class="resume_refuse"
                                               href="javascript:void(0)">不合适</a>
                                            <a data-deliverid="1686182" class="resume_caninterview"
                                               href="javascript:void(0)">待定</a>
                                            <a data-resumename="jason的简历" data-positionname="随便写" data-deliverid="1686182"
                                               data-positionid="149594" data-resumekey="1ccca806e13637f7b1a4560f80f08057"
                                               data-forwardcount="1" class="resume_forward" href="javascript:void(0)">
                                                转发
                                                <span>(1人)</span>
                                            </a>
                                        </div>



                                </div>
                            </li>
                        </ul><!-- end .resumeLists -->
                        </c:forEach>
                    </form>
                </dd>
            </dl>
        </div><!-- end .content -->

        <!------------------------------------- 弹窗lightbox ----------------------------------------->
        <div style="display:none;">
            <!--通知面试弹窗-->
            <div style="overflow:auto;" class="popup" id="noticeInterview">
                <form id="noticeInterviewForm">
                    <table width="100%" class="f16">
                        <tbody>
                        <tr>
                            <td width="20%" align="right" class="c9">收件人</td>
                            <td width="80%">
                                <span class="c9" id="receiveEmail"></span>
                                <input type="hidden" value="" name="email">
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="redstar">*</span>主题</td>
                            <td>
                                <input type="text" placeholder="公司：职位名称面试通知" name="subject">
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="redstar">*</span>面试时间</td>
                            <td>
                                <input type="text" id="datetimepicker" name="interTime" class="hasDatepicker">
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="redstar">*</span>面试地点</td>
                            <td>
                                <input type="text" name="interAdd">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">联系人</td>
                            <td>
                                <input type="text" name="linkMan">
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><span class="redstar">*</span>联系电话</td>
                            <td>
                                <input type="text" name="linkPhone">
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">补充内容</td>
                            <td>
                                <textarea name="content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="发送" class="btn">
                                <a class="emailPreview" href="javascript:;">预览</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" value="" name="name">
                    <input type="hidden" value="" name="positionName">
                    <input type="hidden" value="" name="companyName">
                    <input type="hidden" value="" name="deliverId">
                </form>
            </div><!--/#noticeInterview-->

            <!--预览通知面试弹窗-->
            <div class="popup" id="noticeInterviewPreview">
                <div class="f18">拉勾网：产品经理面试通知</div>
                <div class="c9">发给：<span>vivi@lagou.com</span></div>
                <div id="emailText"></div>
                <input type="button" value="提交" class="btn fl">
                <a title="通知面试" class="inline fl cboxElement" href="#noticeInterview">返回修改</a>
            </div><!--/#noticeInterviewPreview-->

            <!--通知面试成功弹窗-->
            <div class="popup" id="noticeInterviewSuccess">
                <table width="100%" class="f16">
                    <tbody>
                    <tr>
                        <td align="center" class="f16">
                            面试通知已发送成功<br>
                            该简历已进入“已通知面试简历”列表
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="button" value="确认" class="btn">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><!--/#noticeInterviewSuccess-->

            <!--转发简历弹窗-->
            <div class="popup" id="forwardResume">
                <form id="forwardResumeForm">
                    <table width="100%" class="f16">
                        <tbody>
                        <tr>
                            <td width="20%" align="right">收件人</td>
                            <td width="80%">
                                <input type="text" placeholder="最多可添加两个邮箱，用“；”隔开" id="recipients" name="recipients">
                                <span id="forwardResumeError" style="display:none" class="beError"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">主题</td>
                            <td>
                                <input type="text" value="" name="title">
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="right">正文</td>
                            <td>
                                <textarea name="content"></textarea>
                                <span style="display:none;" class="beError error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" value="发送" class="btn">
                                <a class="emial_cancel" href="javascript:;">取消</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" value="" name="resumeKey">
                    <input type="hidden" value="" name="positionId">
                    <input type="hidden" value="" name="deliverId">
                </form>
            </div><!--/#forwardResume-->

            <!--转发简历成功弹窗-->
            <div class="popup" id="forwardResumeSuccess">
                <table width="100%" class="f16">
                    <tbody>
                    <tr>
                        <td align="center" class="f16">简历已转发成功</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="button" value="确认" class="btn">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><!--/#forwardResumeSuccess-->

            <!--确认不合适弹窗-->
            <div style="height:400px;" class="popup" id="confirmRefuse">
                <form id="refuseMailForm">
                    <table width="100%">
                        <tbody>
                        <tr>
                            <td>
                                <div class="refuse_icon">
                                    <h3>确认这份简历不合适吗？</h3>
                                    <span>确认后，系统将自动发送以下内容至用户邮箱</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
	             		<textarea name="content">非常荣幸收到您的简历，在我们仔细阅读您的简历之后，却不得不很遗憾的通知您：
您的简历与该职位的定位有些不匹配，因此无法进入面试。

但您的信息已录入我司人才储备库，当有合适您的职位开放时我们将第一时间联系您，希望在未来我们有机会成为一起拼搏的同事；
再次感谢您对我们的信任，祝您早日找到满意的工作。</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="确认不合适" class="btn">
                                <a class="emial_cancel" href="javascript:;">取消</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" value="" name="deliverId">
                </form>
            </div><!--/#confirmRefuse-->

            <!--拒绝email成功弹窗-->
            <div class="popup" id="refuseMailSuccess">
                <table width="100%" class="f16">
                    <tbody>
                    <tr>
                        <td align="center" class="f16">
                            不合适通知已发送成功<br>
                            该简历已进入“不合适简历”列表
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="button" value="确认" class="btn">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div><!--/#refuseMailSuccess-->
        </div>
        <!------------------------------------- end ----------------------------------------->
        <script src="style/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script>
        <script src="style/js/received_resumes.min.js" type="text/javascript"></script>
        <script>
        </script>
        <div class="clear"></div>
        <input type="hidden" value="8e0aac9393b44b1f925b6be8130285be" id="resubmitToken">
        <a rel="nofollow" title="回到顶部" id="backtop"></a>
    </div><!-- end #container -->
</div><!-- end #body -->

<script src="static/js/core.min.js" type="text/javascript"></script>
<script src="static/js/popup.min.js" type="text/javascript"></script>

<!--  -->

<script type="text/javascript">
    $(function () {
        $('#noticeDot-1').hide();
        $('#noticeTip a.closeNT').click(function () {
            $(this).parent().hide();
        });
    });
    var index = Math.floor(Math.random() * 2);
    var ipArray = new Array('42.62.79.226', '42.62.79.227');
    var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
    var CallCenter = {
        init: function (url) {
            var _websocket = new WebSocket(url);
            _websocket.onopen = function (evt) {
                console.log("Connected to WebSocket server.");
            };
            _websocket.onclose = function (evt) {
                console.log("Disconnected");
            };
            _websocket.onmessage = function (evt) {
                //alert(evt.data);
                var notice = jQuery.parseJSON(evt.data);
                if (notice.status[0] == 0) {
                    $('#noticeDot-0').hide();
                    $('#noticeTip').hide();
                    $('#noticeNo').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                    $('#noticeNoPage').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                } else {
                    $('#noticeDot-0').show();
                    $('#noticeTip strong').text(notice.status[0]);
                    $('#noticeTip').show();
                    $('#noticeNo').text('(' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                    $('#noticeNoPage').text(' (' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
                }
                $('#noticeDot-1').hide();
            };
            _websocket.onerror = function (evt) {
                console.log('Error occured: ' + evt);
            };
        }
    };
    CallCenter.init(url);
</script>

<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;">
    <div id="cboxWrapper">
        <div>
            <div id="cboxTopLeft" style="float: left;"></div>
            <div id="cboxTopCenter" style="float: left;"></div>
            <div id="cboxTopRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxMiddleLeft" style="float: left;"></div>
            <div id="cboxContent" style="float: left;">
                <div id="cboxTitle" style="float: left;"></div>
                <div id="cboxCurrent" style="float: left;"></div>
                <button type="button" id="cboxPrevious"></button>
                <button type="button" id="cboxNext"></button>
                <button id="cboxSlideshow"></button>
                <div id="cboxLoadingOverlay" style="float: left;"></div>
                <div id="cboxLoadingGraphic" style="float: left;"></div>
            </div>
            <div id="cboxMiddleRight" style="float: left;"></div>
        </div>
        <div style="clear: left;">
            <div id="cboxBottomLeft" style="float: left;"></div>
            <div id="cboxBottomCenter" style="float: left;"></div>
            <div id="cboxBottomRight" style="float: left;"></div>
        </div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
<div class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="ui-datepicker-div"></div>
</body>
</html>