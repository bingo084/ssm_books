<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台欢迎页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a>图书管理</a>><a>图书借阅</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>在馆图书</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width:14%">图书名称</th>
						<th style="width:14%">图书作者</th>
						<th style="width:14%">图书价格</th>
						<th style="width:14%">出版社</th>
						<th style="width:14%">图书状态</th>
						<th style="width:14%">图书编号</th>
						<th style="width:14%">操作</th>
					</tr>
					<c:forEach items="${bookPages.list}" var="book">
					<tr>
						<td>${book.bookName}</td>
						<td>${book.author}</td>
						<td>￥${book.price}</td>
						<td>${book.publisher}</td>
						<c:if test="${book.status == 1}">
							<td>在馆</td>
						</c:if>
						<c:if test="${book.status == -1}">
							<td>借出</td>
						</c:if>

						<td>${book.bookCode}</td>
						<td>
							<div class="table-fun">
								<a href="${pageContext.request.contextPath}/book/borrowBookById?bookId=${book.bookId}">租书</a>
							</div>
						</td>
					</tr>
					</c:forEach>
				</table>
				<div class="page">
					<form action="${pageContext.request.contextPath}/book/getAllNotLentBooks" method="get">
					共<span style="color:red;font-weight:600">${bookPages.total}</span>本书
						<a href="${pageContext.request.contextPath}/book/getAllNotLentBooks">首页</a>
						<c:if test="${bookPages.hasPreviousPage}">
							<a href="${pageContext.request.contextPath}/book/getAllNotLentBooks?page=${bookPages.prePage}">上一页</a>
						</c:if>
						<c:if test="${not bookPages.hasPreviousPage}">
							<a>上一页</a>
						</c:if>
						<c:if test="${bookPages.hasNextPage}">
							<a href="${pageContext.request.contextPath}/book/getAllNotLentBooks?page=${bookPages.nextPage}">下一页</a>
						</c:if>
						<c:if test="${not bookPages.hasNextPage}">
							<a>下一页</a>
						</c:if>
						<a href="${pageContext.request.contextPath}/book/getAllNotLentBooks?page=${bookPages.pages}">末页</a>
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