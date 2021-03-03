<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>后台欢迎页</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script>
            $(function () {
                if (${not empty alert}) {
                    alert("${alert}");
                }
            })
        </script>
    </head>
    <body marginwidth="0" marginheight="0">
        <div class="container">
            <div class="public-nav">您当前的位置：<a>图书管理</a>><a>逾期缴费</a></div>
            <div class="public-content">
                <div class="public-content-header">
                    <h3>个人信息</h3>
                </div>
                <div class="public-content-cont">
                    <table class="public-cont-table">
                        <tr>
                            <th style="width:10%">用户名</th>
                            <th style="width:10%">身份证号</th>
                            <th style="width:10%">电话</th>
                            <th style="width:10%">注册日期</th>
                            <th style="width:10%">用户状态</th>
                            <th style="width:10%">欠费金额</th>
                            <th style="width:10%">操作</th>
                        </tr>
                        <tr>
                            <td>${dbUser.username}</td>
                            <td>${dbUser.idCard}</td>
                            <td>${dbUser.phone}</td>
                            <td><fmt:formatDate value="${dbUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <c:if test="${dbUser.status == 1}">
                                <td>正常</td>
                            </c:if>
                            <c:if test="${dbUser.status == -1}">
                                <td>锁定</td>
                            </c:if>
                            <td>￥${dbUser.owingMoney}</td>
                            <c:if test="${not ((dbUser.owingMoney<0)or(dbUser.owingMoney>0))}">
                                <td>
                                    <div class="table-fun">
                                        <a href="javascript:alert('您无需缴费')">缴费</a>
                                    </div>
                                </td>
                            </c:if>
                            <c:if test="${(dbUser.owingMoney<0)or(dbUser.owingMoney>0)}">
                                <td>
                                    <div class="table-fun">
                                        <a href="${pageContext.request.contextPath}/user/makeUpArrears">缴费</a>
                                    </div>
                                </td>
                            </c:if>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>