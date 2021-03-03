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
            function checkAll() {
                if ($("#checkALl").prop("checked")) {
                    $("input[name='check']").prop("checked", true);
                } else {
                    $("input[name='check']").prop("checked", false);
                }
            }

            function returnChecked() {
                let values = new Array();
                $("input[name='check']:checked").each(function () {
                    values.push($(this).val());
                })
                if (values.length === 0){
                    alert("请选中至少一项");
                } else {
                    location.href="${pageContext.request.contextPath}/book/returnChosenBooks?values="+values;
                }
            }
        </script>
    </head>
    <body marginwidth="0" marginheight="0">
        <div class="container">
            <div class="public-nav">您当前的位置：<a>图书管理</a>><a>图书归还</a></div>
            <div class="public-content">
                <div class="public-content-header">
                    <h3>未还图书</h3>
                </div>
                <div class="public-content-cont">
                    <table class="public-cont-table">
                        <tr>
                            <th><input type="checkbox" id="checkALl" onclick="checkAll()"/></th>
                            <th style="width:10%">图书名称</th>
                            <th style="width:10%">图书作者</th>
                            <th style="width:10%">出版社</th>
                            <th style="width:10%">图书价格</th>
                            <th style="width:10%">图书状态</th>
                            <th style="width:10%">图书编号</th>
                            <th style="width:10%">借书时间</th>
                            <th style="width:10%">到期时间</th>
                            <th style="width:10%">剩余免费天数</th>
                            <th style="width:10%">操作</th>
                        </tr>
                        <c:forEach items="${bookPages.list}" var="bookRecord">
                            <tr>
                                <td><input type="checkbox" name="check"
                                           value="${bookRecord.book.bookId}!${bookRecord.recordId}!${bookRecord.user.userId}"/>
                                </td>
                                <td>${bookRecord.book.bookName}</td>
                                <td>${bookRecord.book.author}</td>
                                <td>￥${bookRecord.book.price}</td>
                                <td>${bookRecord.book.publisher}</td>
                                <c:if test="${bookRecord.book.status == 1}">
                                    <td>在馆</td>
                                </c:if>
                                <c:if test="${bookRecord.book.status == -1}">
                                    <td>借出</td>
                                </c:if>
                                <td>${bookRecord.book.bookCode}</td>
                                <td><fmt:formatDate value="${bookRecord.lendTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${bookRecord.expireTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatNumber
                                        value="${(bookRecord.expireTime.getTime()-nowDate.getTime())/1000/60/60/24}"
                                        pattern="#0"/>天
                                </td>
                                <td>
                                    <div class="table-fun">
                                        <a href="${pageContext.request.contextPath}/book/returnBookById?bookId=${bookRecord.book.bookId}&recordId=${bookRecord.recordId}&userId=${bookRecord.user.userId}">还书</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br>
                    <div class="sub-btn" style="width: 100px;text-align: center;margin: auto;padding-top: 12px">
                        <a href="javascript:void 0;" onclick="returnChecked()"><span
                                style="color: white">归还选中</span></a>
                    </div>
                    <div class="page">
                        <form action="${pageContext.request.contextPath}/book/getNotReturnedBooks" method="get">
                            共<span style="color:red;font-weight:600">${bookPages.total}</span>本书
                            <a href="${pageContext.request.contextPath}/book/getNotReturnedBooks">首页</a>
                            <c:if test="${bookPages.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/book/getNotReturnedBooks?page=${bookPages.prePage}">上一页</a>
                            </c:if>
                            <c:if test="${not bookPages.hasPreviousPage}">
                                <a>上一页</a>
                            </c:if>
                            <c:if test="${bookPages.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/book/getNotReturnedBooks?page=${bookPages.nextPage}">下一页</a>
                            </c:if>
                            <c:if test="${not bookPages.hasNextPage}">
                                <a>下一页</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/book/getNotReturnedBooks?page=${bookPages.pages}">末页</a>
                            第<span style="color:red;font-weight:600">${bookPages.pageNum}</span>页
                            共<span style="color:red;font-weight:600">${bookPages.pages}</span>页
                            <input type="text" class="page-input" name="page">
                            <input type="submit" class="page-btn" value="跳转">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>