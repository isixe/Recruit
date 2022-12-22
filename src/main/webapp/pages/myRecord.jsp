<%@ page import="bean.Record" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.RecordDao" %>
<%@ page import="dao.impl.RecordDaoImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String uid = null;
    String username = (String) request.getSession().getAttribute("username");
    request.setAttribute("username", username);
    uid = (String) request.getParameter("uid");
    int id = Integer.parseInt(uid);
    List<Record> records = new ArrayList<>();
    RecordDao recordDao = new RecordDaoImpl();
    try {
        records = recordDao.findById(id);
    } catch (Exception e) {
        e.printStackTrace();
    }
    System.out.println(records.size());
    request.setAttribute("records", records);
%>
<!DOCTYPE HTML>
<html>
<head>
    <script type="text/javascript" async="" src="../static/js/conversion.js"></script>
    <script src="../static/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script>

    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>查看用户简历</title>
    <link rel="stylesheet" href="../static/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/index.css">
    <!-- JS -->
    <script src="../static/vendor/bootstrap.min.js"></script>
    <link href="../static/css/style.css" type="text/css" rel="stylesheet">
    <link href="../static/css/external.min.css" type="text/css" rel="stylesheet">
    <link href="../static/css/popup.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../static/vendor/jquery.1.10.1.min.js"></script>
    <script src="../static/js/jquery.lib.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../static/js/ajaxfileupload.js"></script>
    <script src="../static/js/additional-methods.js" type="text/javascript"></script>

    <script src="../static/js/conv.js" type="text/javascript"></script>
    <script src="../static/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<body>
<div id="body">
    <div id="container">
        <div class="content" style="width: auto;float: none;">
            <dl class="company_center_content">
                <dt>
                    <h1>我投递的简历</h1>
                </dt>
                <dd>
                    <form action="autoFilterResumes.html" method="get" id="filterForm">
                        <ul class="reset resumeLists">
                            <li data-id="1686182" class="onlineResume">
                                <label class="checkbox">
                                    <input type="checkbox">
                                    <i></i>
                                </label>

                                <c:forEach items="${requestScope.records}" var="record">

                                    <div class="resumeShow">

                                        <div class="resumeIntro">
                                            <h3 class="unread">
                                                <a target="_blank" title="预览jason的简历"
                                                   href="resumeView.html?deliverId=1686182">
                                                        ${requestScope.username}
                                                </a>
                                                <em></em>
                                            </h3>
                                            <span class="fr">投递时间：${record.time}</span>
                                            <div>
                                                    ${requestScope.username}<br>
                                                    公司id：${record.cid} <br>
                                                    简历id：${record.rid}<br>
                                            </div>

                                        </div>
                                        <div class="links">
                                            <a href="${pageContext.request.contextPath}/record?action=delete&id=${record.id}">删除</a>
                                        </div>
                                    </div>
                                </c:forEach>

                            </li>
                        </ul>
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
                                <input type="text" placeholder="最多可添加两个邮箱，用“；”隔开" id="recipients"
                                       name="recipients">
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