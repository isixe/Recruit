<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>简历预览-我的简历</title>

    <!-- CSS -->
    <link href="static/css/style.css" type="text/css" rel="stylesheet">
    <link href="static/css/colorbox.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/popup.css" type="text/css" rel="stylesheet">
    <!-- JS -->
    <script src="static/vendor/jquery.1.10.1.min.js" type="text/javascript"></script>
    <script src="static/js/jquery.colorbox-min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("body").on("click", "a.btn_s", function () {
                $.colorbox.close();
                parent.jQuery.colorbox.close();
            });
            $(".inline").colorbox({
                inline: true
            });
        });
    </script>
    <script src="static/js/ajaxCross.json" charset="UTF-8"></script>
</head>

<body>
<div id="previewWrapper">
    <div class="preview_header">
        <h1 title="${resume.name}的简历">${resume.name}的简历</h1>
        <a title="修改简历" href="${pageContext.request.contextPath}/findResumeByIdServlet?uid=${resume.userid}&type=edit">修改简历</a>
        &nbsp;
        <a title="下载简历" href="${pageContext.request.contextPath}/deleteResumeServlet">删除简历</a>
    </div><!--end .preview_header-->

    <div class="preview_content">
        <div class="profile_box" id="basicInfo">
            <h2>基本信息</h2>
            <div class="basicShow">
                   <span>${resume.name} | ${resume.sex} | ${resume.education} | ${resume.year} | ${resume.city}<br>
                       ${resume.workexp} | ${resume.school}<br>
                       ${resume.phone} | ${resume.email}<br>
            		</span>
                <div class="m_portrait">
                    <div></div>
                    <img width="120" height="120" alt="jason" src="static/images/default_headpic.png">
                </div>
            </div><!--end .basicShow-->
        </div><!--end #basicInfo-->

        <div class="profile_box" id="expectJob">
            <h2>期望工作</h2>
            <div class="expectShow">
               ${resume.hope}
            </div><!--end .expectShow-->
        </div><!--end #expectJob-->

        <div class="profile_box" id="workExperience">
            <h2>工作经历</h2>
            <div class="experienceShow">
                <ul class="wlist clearfix">
                    <li class="clear">
                        <span class="c9">${resume.datetime}</span>
                        <div>
                            <img width="56" height="56" alt="上海辉硕科技有限公司" src="static/images/logo_default.png">
                            <h3>${resume.workexp} </h3>
                        </div>
                    </li>
                </ul>
            </div><!--end .experienceShow-->
        </div><!--end #workExperience-->

        <div class="profile_box" id="projectExperience">
            <h2>项目经验</h2>
            <div class="projectShow">
                <ul class="plist clearfix">
                    <li class="noborder">
                        <div class="projectList">
                            <div class="f16 mb10">${resume.projectexp}
                                <span class="c9">${resume.datetime}</span>
                            </div>
                            <div class="dl1"></div>
                        </div>
                    </li>
                </ul>
            </div><!--end .projectShow-->
        </div><!--end #projectExperience-->

        <div class="profile_box" id="educationalBackground">
            <h2>教育背景</h2>
            <div class="educationalShow">
                <ul class="elist clearfix">
                    <li class="clear">
                        <div>
                            <h3>${resume.school}</h3>
                            <h4>${resume.education}</h4>
                        </div>
                    </li>
                </ul>
            </div><!--end .educationalShow-->
        </div><!--end #educationalBackground-->

    </div><!--end .preview_content-->
</div><!--end #previewWrapper-->

<!-------------------------------------弹窗lightbox ----------------------------------------->
<%--<div style="display:none;">--%>
<%--    <!-- 下载简历 -->--%>
<%--    <div class="popup" id="downloadOnlineResume">--%>
<%--        <table width="100%">--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td class="c5 f18">请选择下载简历格式：</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=1">word格式</a>--%>
<%--                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=2">html格式</a>--%>
<%--                    <a class="btn_s" href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=3">pdf格式</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div><!--/#downloadOnlineResume-->--%>
<%--</div>--%>
<!------------------------------------- end ----------------------------------------->


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
</body>
</html>