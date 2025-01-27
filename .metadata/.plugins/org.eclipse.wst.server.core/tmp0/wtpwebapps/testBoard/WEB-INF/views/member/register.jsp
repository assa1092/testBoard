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

<section id="container" class="container">
	<form action="/member/register" method="post">
		<div class="form-group has-feedback">
			<label class="control-label" for="userId">아이디</label>
			<input class="form-control" type="text" id="userId" name="userId">
			<button class="idCheck" type="button" id="idCheck" onclick="fn_idCheck()" value="N">아이디 중복 확인</button>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userPass">패스워드</label>
			<input class="form-control" type="password" id="userPass" name="userPass">
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="userName">성 명</label>
			<input class="form-control" type="text" id="userName" name="userName">
		</div>
	</form>
		<div class="form-group has-feedback" align="right">
			<button class="btn btn-success" type="button" id="submit">회원가입</button>
			<button class="btn btn-danger" type="button" id="cancle">취소</button>
		</div>

</section>

<script type="text/javascript">
	$(document).ready(function(){
		$("#cancle").on("click", function(){
			location.href="/";
		});

		$("#submit").on("click", function(){
			if($("#userId").val() == ""){
				alert("아이디를 입력해주세요.")
				$("userId").focus();
				return false;
			}
			if($("#userPass").val() == ""){
				alert("비밀번호를 입력해주세요.")
				$("userPass").focus();
				return false;
			}
			if($("#userName").val() == ""){
				alert("이름을 입력해주세요.")
				$("userName").focus();
				return false;
			}
			
			var idCheckVal = $("#idCheck").val();
			if(idCheckVal == 'N'){
				alert("아이디 중복 확인 버튼을 눌러주세요")
			} else if(idCheckVal == 'Y') {
				$("form").submit();
			}
		});
	})
	
	function fn_idCheck(){
			$.ajax({
				url : "/member/idCheck",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
</script>

</body>
</html>