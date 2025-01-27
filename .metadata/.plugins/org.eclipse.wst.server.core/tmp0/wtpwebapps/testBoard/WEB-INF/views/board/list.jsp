<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>게시판</title>

<style>
.th-center {
	text-align: center;
}
</style>

</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		
		<div>
				<%@include file="nav.jsp" %>
		</div>
		<hr />


		<section id="container" class="container">

			<div class="row text-center">
				<h1>목록</h1>
			</div>
			<div class="row text-right">
				<button onclick="location.href='/board/writeView'" id="writeBtn"
					class="btn btn-info">글쓰기</button>
				<!-- <a href="/board/writeView">글쓰기</a> -->
			</div>
			<!-- <form action="/board/list" method="post" role="form"> -->
			<div class="row">
				<table class="table table-hober">
					<thead>
						<tr>
							<th class="th-center">번호</th>
							<th class="th-center">제목</th>
							<th class="th-center">작성자</th>
							<th class="th-center">등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="list">
							<tr>
								<td class="th-center"><c:out value="${list.bno}"></c:out></td>
								<td class="th-center"><a
									href="/board/readView/${list.bno }"> <c:out
											value="${list.title}"></c:out>
								</a></td>
								<td class="th-center"><c:out value="${list.writer}"></c:out>
								</td>
								<td class="th-center"><fmt:formatDate
										value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>



				<!-- 페이징 처리 -->
				<div align="center">
					<ul class="pagination justify-content-center">
						<c:if test="${to.curPage != 1 }">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${(to.curPage-1) >0 ? (to.curPage-1) : 1} ">&laquo;</a>
							</li>
						</c:if>

						<c:forEach begin="${to.beginPageNum}" end="${to.stopPageNum}"
							var="idx">

							<c:if test="${to.curPage == idx }">
								<li class="page-item active"><a class="page-link"
									href="/board/list?curPage=${idx}">${idx}</a></li>
							</c:if>

							<c:if test="${to.curPage != idx }">
								<li class="page-item"><a class="page-link"
									href="/board/list?curPage=${idx}">${idx}</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${to.curPage != to.totalPage}">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${(to.curPage+1) < to.totalPage? (to.curPage+1) : to.totalPage }">&raquo;</a>
							</li>
						</c:if>
					</ul>

				</div>
				<!-- /페이징처리 -->
	
					<form action="/board/searchList" method="get">
						<div class="input-group">
							<span class="input-group-addon"> 
								<select name="searchType">
									<option disabled>검색기준</option>
									<option value="writer">작성자</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select>
							</span> 
							<input class="form-control" name="keyword"> <span
								class="input-group-btn">
								<button class="btn btn-info">검색</button>
							</span>
						</div>
					</form>

				
			</div>
		</section>
	</div>


</body>
</html>