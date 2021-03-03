<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>后台欢迎页</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css" />
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
            <div class="public-nav">您当前的位置：<a>图书管理</a>><a>借阅历史</a></div>
            <div class="public-content">
                <div class="public-content-header">
                    <h3>已还图书</h3>
                </div>
                <div class="public-content-cont">
                    <table class="public-cont-table">
                        <tr>
                            <th style="width:11%">图书名称</th>
                            <th style="width:11%">图书作者</th>
                            <th style="width:11%">图书价格</th>
                            <th style="width:11%">出版社</th>
                            <th style="width:11%">图书状态</th>
                            <th style="width:11%">图书编号</th>
                            <th style="width:11%">借书时间</th>
                            <th style="width:11%">还书时间</th>
                            <th style="width:11%">到期时间</th>
                        </tr>
                        <c:forEach items="${bookPages.list}" var="bookRecord">
                            <tr>
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
                                <td><fmt:formatDate value="${bookRecord.returnTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${bookRecord.expireTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="page">
                        <form action="${pageContext.request.contextPath}/book/getAllReturnedBooks" method="get">
                            共<span style="color:red;font-weight:600">${bookPages.total}</span>本书
                            <a href="${pageContext.request.contextPath}/book/getAllReturnedBooks">首页</a>
                            <c:if test="${bookPages.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath}/book/getAllReturnedBooks?page=${bookPages.prePage}">上一页</a>
                            </c:if>
                            <c:if test="${not bookPages.hasPreviousPage}">
                                <a>上一页</a>
                            </c:if>
                            <c:if test="${bookPages.hasNextPage}">
                                <a href="${pageContext.request.contextPath}/book/getAllReturnedBooks?page=${bookPages.nextPage}">下一页</a>
                            </c:if>
                            <c:if test="${not bookPages.hasNextPage}">
                                <a>下一页</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/book/getAllReturnedBooks?page=${bookPages.pages}">末页</a>
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