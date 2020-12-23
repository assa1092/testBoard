<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<section id="container">
		<form action="/member/memberDelete" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" readonly value="${member.userId }">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">비밀번호</label>
				<input class="form-control" type="password" id="userPass" name="userPass" >
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">성 명 </label>
				<input class="form-control" type="text" id="userName" name="userName" readonly value="${member.userName }">
			</div>
			<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
			</div>
		</form>
		<div>
			<c:if test="${msg == false }">
				비밀번호가 맞지 않습니다.
			</c:if>
		</div>
	</section>
	
	
<script type="text/javascript">
	$(document).ready(function(){
		$(".cancle").on("click",function(){
			location.href="/";
		})
		$("#submit").on("click", function(){
			if($("#userPass").val() == ""){
				alert("비밀번호를 입력해주세요.");
				$("#userPass").focus();
			}
			
			var isDelete = confirm("정말 탈퇴하겠습니까?")
			if(!isDelete){
				location.href="/";
			}
		})
	})
</script>

</body>
</html>