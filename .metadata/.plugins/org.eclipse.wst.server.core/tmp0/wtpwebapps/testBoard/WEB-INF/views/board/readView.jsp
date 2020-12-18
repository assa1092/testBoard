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

<title>Insert title here</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr />

		<section id="container" class="container">
			<form role="form" method="post">
				<%-- <table>
						<tbody>
							<tr>
								<td>
									<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table> --%>
				
				
				<div class="form-group">
					<label for="bno">번 호 : ${read.bno}</label> 
						<%-- <input name="bno" id="bno" class="form-control" readonly  value="${read.bno }"> --%>
					
					<label for="regdate" style="text-align : right" >작성일자 : </label> 
						<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>
						<%-- <input name="regdate" id="regdate" class="form-control" readonly  value="${read.regdate }"> --%>
						
				</div>
								
				<div class="form-group">
					<label for="title">제목</label>
					<!-- for="title" 제목 클릭시 name="title"으로 포커스 가게... -->
					<input name="title" id="title" class="form-control" readonly  value="${read.title }">
					<!-- input 태그가 한줄로 모서리 둥글게...class="form-control" -->

				</div>
				<div class="form-group">
					<label for="writer">작성자</label> 
						<input name="writer" id="writer" class="form-control" readonly  value="${read.writer }">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea rows="5" name="content" id="content" readonly  class="form-control" > ${read.content }</textarea>
				</div>
			</form>
			
			<div class="form-group" align="right">
					<button id="updateBtn" class="btn btn-info">수 정</button>
					<button id ="deleteBtn" class="btn btn-warning" >삭 제</button>
					<button id ="listBtn" class="btn btn-primary" >목 록</button>
			</div>
		</section>
	</div>
	
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateBtn").click(function(){
			location.assign("/board/updateView/${read.bno}");
		});
		$("#deleteBtn").click(function(){

			var result = confirm('삭제하시겠습니까'); 
			if(result) { 
				location.assign("/board/delete/${read.bno}");
			} else { }
			
		});
		$("#listBtn").click(function(){
			location.assign("/board/list");
		});
	});
</script>

</body>
</html>