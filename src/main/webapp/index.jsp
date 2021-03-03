<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script>
            $(function () {
                if (${not empty alert}) {
                    alert("${alert}");
                }
            })
        </script>
    </head>
    <body>
        <div class="public-header-warrp">
            <div class="public-header">
                <div class="content">
                    <div class="public-header-logo"><a href=""><i>LOGO</i>
                        <h3>aowin</h3></a></div>
                    <div class="public-header-admin fr">
                        <c:if test="${empty sessionScope.user}">
                            <p class="admin-name"><a href="${pageContext.request.contextPath}/login.jsp" target="content" style="color: black">请先登录！</a></p>
                        </c:if>
                        <c:if test="${not empty sessionScope.user}">
                            <p class="admin-name">${sessionScope.user.username} 您好！</p>
                        </c:if>
                        <div class="public-header-fun fr">
                            <a href="${pageContext.request.contextPath}/user/getUser" target="content" class="public-header-man">管理</a>
                            <a href="${pageContext.request.contextPath}/user/logout" class="public-header-loginout">安全退出</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- 内容展示 -->
        <div class="public-ifame mt20">
            <div class="content">
                <!-- 内容模块头 -->
                <div class="clearfix"></div>
                <!-- 左侧导航栏 -->
                <div class="public-ifame-leftnav">
                    <div class="public-title-warrp">
                        <div class="public-ifame-title ">
                            <a href="">首页</a>
                        </div>
                    </div>
                    <ul class="left-nav-list">
                        <li class="public-ifame-item">
                            <a href="javascript:;">图书管理</a>
                            <div class="ifame-item-sub">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/book/getAllNotLentBooks"
                                           target="content">图书借阅</a></li>
                                    <li><a href="${pageContext.request.contextPath}/book/getNotReturnedBooks"
                                           target="content">图书归还</a></li>
                                    <li><a href="${pageContext.request.contextPath}/book/getAllReturnedBooks"
                                           target="content">借阅历史</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user/getUser"
                                           target="content">逾期缴费</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 右侧内容展示部分 -->
                <div class="public-ifame-content">
                    <c:if test="${empty sessionScope.user}">
                        <iframe name="content" frameborder="0" src="${pageContext.request.contextPath}/login.jsp" id="mainframe" scrolling="yes" marginheight="0"
                                marginwidth="0" width="100%" style="height: 700px;"></iframe>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <iframe name="content" frameborder="0" src="${pageContext.request.contextPath}/success.jsp" id="mainframe" scrolling="yes" marginheight="0"
                                marginwidth="0" width="100%" style="height: 700px;"></iframe>
                    </c:if>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script>
            $().ready(function () {
                var item = $(".public-ifame-item");

                for (var i = 0; i < item.length; i++) {
                    $(item[i]).on('click', function () {
                        $(".ifame-item-sub").hide();
                        if ($(this.lastElementChild).css('display') == 'block') {
                            $(this.lastElementChild).hide()
                            $(".ifame-item-sub li").removeClass("active");
                        } else {
                            $(this.lastElementChild).show();
                            $(".ifame-item-sub li").on('click', function () {
                                $(".ifame-item-sub li").removeClass("active");
                                $(this).addClass("active");
                            });
                        }
                    });
                }
            });
        </script>
    </body>
</html>