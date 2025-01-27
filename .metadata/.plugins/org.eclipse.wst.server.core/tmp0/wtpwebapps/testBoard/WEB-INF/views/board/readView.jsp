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

		<div>
				<%@include file="nav.jsp" %>
		</div>
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
					<button id="replyBtn" class="btn btn-danger">댓 글</button>
					<button id="updateBtn" class="btn btn-info">수 정</button>
					<button id ="deleteBtn" class="btn btn-warning" >삭 제</button>
					<button id ="listBtn" class="btn btn-primary" >목 록</button>
			</div>
			
			<!-- 댓글버튼 누르면 댓글 작성화면 나오게...collagse toggle  -->
			<div class="row">
				<div id="myCollapse" class="collapse">
					<div class="form-group">
						<label for="replyer">작성자</label>
						<input id="replyer" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="replytext">내 용</label>
						<input id="replytext" class="form-control">
					</div>
					
					<div class="form-group"  style="text-align : right" >
						<button id="replyInsertBtn" class="btn btn-primary">댓글 등록</button>
					</div>	
				</div>
			</div>
			
				<!-- 덮어쓰기 할꺼라 없는거나 마찬가지 -->
		<div id="replies" class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<span>rno: 3 </span>, <span>작성자 : 홍길동</span>
					<!-- class="pull-right" 오른쪽으로 붙게... -->
					<span class="pull-right">2020년07월07일...</span>
				</div>
				<div class="panel-body">
					<p>댓글 내용입니다</p>
					<button data-name="홍길동" data-rno="3" class="btn btn-warning btn-xs replymodify">수정</button>
					<button data-rno="3" class="btn btn-danger btn-xs replydelete">삭제</button>
				</div>
			</div>
		</div><!-- class = row -->
		
		
		
		
			<div class="row">
		<div data-backdrop="static" id="myModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<label>번 호 : </label>
						<h4 class="modal-rno">rno 데이터</h4>
					</div>
					<div class="modal-body">
					<label>작성자 : </label>
						<p class="modal-replyer">홍길동</p>
						<label>내 용 : </label>
						<input value="댓글내용입니다" class="form-control modal-replytext"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning modal-update-btn" 
								data-dismiss="modal">댓글수정</button>
						
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
			
		</section>
		
		
		
	</div>
	
<script type="text/javascript">

	// script안에서...var 를 안붙이면 전역변수로 사용할수있다...
	var bno = ${read.bno};	
	
	// 글 자세히 보기로 들어오면 원글에 달린 댓글 가져온다..
	getList(bno);

	$(document).ready(function(){
		// 게시글 수정
		$("#updateBtn").click(function(){
			location.assign("/board/updateView/${read.bno}");
		});
		// 게시글 삭제
		$("#deleteBtn").click(function(){

			var result = confirm('삭제하시겠습니까'); 
			if(result) { 
				location.assign("/board/delete/${read.bno}");
			} else { }
			
		});

		// 목록으로
		$("#listBtn").click(function(){
			location.assign("/board/list");
		});

		// 댓글 수정버튼 클릭시 모달창 띄우기
		$("#replies").on("click", ".replymodify", function(){
			// $(this) 지금 클릭한 요소...
			// 그 요소의 속성...$(this).attr("data-rno");
			// 그 값을 변수로 받아서 쓴다.
			var rno = $(this).attr("data-rno");
			var replyer = $(this).attr("data-name")
			var replytext = $(this).prev().text();	
			//  $(this).prev()내가 방금 누른곳의 바로 앞 태그...<p>
			//  그 태그의 내용 $(this).prev().text();	
			
			$(".modal-rno").text(rno);
			$(".modal-replyer").text(replyer);
			// <input> 태그라 .val();
			$(".modal-replytext").val(replytext);

			// 댓글 수정 누르면 모달 창 보이게.
			$("#myModal").modal("show");
			

		});

		// 댓글 버튼 클릭시 작성폼 토글
		$("#replyBtn").click(function(){
			$("#myCollapse").collapse("toggle");
		});

		// 댓글 작성 버튼 클릭시
		$("#replyInsertBtn").click(function(){
			var replyer = $("#replyer").val();
			var replytext = $("#replytext").val();
			$.ajax({
				type : 'post',
				url : '/replies',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				dataType : 'text',
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					console.log(result);

					// 댓글 등록 성공시 작성자, 내용 빈칸으로
					$("#replyer").val("");
					$("#replytext").val("");

					// 댓글 리스트 새로 가져오기
					getList(bno);				
				},
				error : function(request, status, error){
					console.log(error);
				}
			});
		});

		// 댓글 수정
		$(".modal-update-btn").click(function(){
			var rno = $(".modal-rno").text();
			var replytext = $(".modal-replytext").val();	// input 박스라 .val()

			$.ajax({
				type : 'put',  // 수정할때는 put, 삭제는 delete
				url : "/replies/" + rno,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PUT'
				},
				dataType : 'text',
				data : JSON.stringify({
					replytext : replytext
				}),
				success : function(result){
						console.log("댓글 수정 완료")
						getList(bno);
				},
				error : function(request, status, error){
					console.log(error)
				}
			});
		});

		// 댓글 삭제
		$("#replies").on("click", ".replydelete", function(){
			var rno = $(this).attr("data-rno");
			var result = confirm('삭제하시겠습니까?'); 
			if(!result) { 
				return
			} 
			
			$.ajax({
				type : 'delete',
				url : "/replies",
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				data : JSON.stringify({
					rno : rno
				}),
				success : function(result){
					getList(bno);
				},
				error : function(request, status, error) {
					console.log(error);
				}
			});
		});

		
	});


	// 댓글 리스트 가져오기
	function getList(bno){
		var str = '';
		// JSON 파일 읽어올때...getJSON(1, 2)
		// 1. 어디로, 2.성공했을때 하는일
		$.getJSON("/replies/all/"+ bno, function(data){
			// 댓글이 여러개 달릴경우 같아져 버리기 때문에..
			// id 로 지정할 수가 없다...
			// 그래서 클래스명으로 접근한다...
			for(var i=0 ; i < data.length ; i++){
				str += '<div class="panel panel-success"><div class="panel-heading"><span>rno: '+ data[i]["rno"] +' </span>, <span>작성자 : '+ data[i]["replyer"]+'</span><span class="pull-right">'+ data[i]["updatedate"] +'</span></div><div class="panel-body"><p>'+ data[i]["replytext"]+'</p><button data-name = "'+data[i]["replyer"]+'" data-rno="'+data[i]["rno"]+'"  class="btn btn-warning btn-xs replymodify">수정</button><button data-rno="'+data[i]["rno"]+'"  class="btn btn-danger btn-xs replydelete">삭제</button></div></div>'; 
			}

			$("#replies").html(str);	
			// id가 replies의 html을 str으로 덮어씌우기...
			// 추가하고 싶으면 .append()
			
			
		});
		
	}
</script>

</body>
</html>