<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

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

	<title>Home</title>
</head>
<a href="/board/list">게시판</a><br />
<script type="text/javascript">
$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="/member/logout";
	});
	$("#registerBtn").on("click", function(){
		location.href="/member/register";
	});
	
	$("#memberUpdateBtn").on("click", function(){
		location.href="/member/memberUpdateView";
	});
	
	$("#memberDeleteBtn").on("click", function(){
		location.href="/member/memberDeleteView";
	});
	
})
</script>
<body>

<form name='homeForm' method="post" action="/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId">아이디</label>
				<input type="text" id="userId" name="userId">
			</div>
			<div>
				<label for="userPass">비밀번호</label>
				<input type="password" id="userPass" name="userPass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button" id="registerBtn">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보 수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
				<button id="memberDeleteBtn" type="button">회원 탈퇴</button>
				
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>
