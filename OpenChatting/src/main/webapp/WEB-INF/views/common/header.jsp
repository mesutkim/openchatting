<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>

<style>
	.displayFlex {
		display : flex;
	}
	.loginArea {
		margin-top : 30px;
		margin-right : 30px;
		margin-left : 60px;
	}
	a:hover {
		color : black;
		text-decoration : none;
		cursor:pointer;
	}
	a {
		color : black;
	}
	.loginText {
		margin-bottom : 16px;
	}
	
</style>
</head>
<body>
	<!-- alert 메시지 -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" />
	</c:if>
	<div class="outer" style="width:700px; margin : auto;">
		<div class="displayFlex">
			<div class="searchForm displayFlex" style="width : 400px; margin-top:25px; margin-left : 60px;">
				<input type="text" class="form-control form-control" style="width : 300px;">
				<button class="btn btn-secondary" style="height : 38px;">검색</button>
			</div>
			<c:if test="${ empty loginUser }">
				<div class="loginArea displayFlex">
					<a data-toggle="modal" data-target="#login">로그인 </a>
					<p> / </p>
					<a href="EnrollForm.me"> 회원가입</a>
				</div>
			</c:if>
			<c:if test="${ not empty loginUser }">
			
			<div style="margin-top:20px; margin-left : 10px;">
				${ loginUser.userId } 님 환영합니다.<br>
				<a href="mypage.me">마이페이지</a>
				<a id="logout">로그아웃</a>
			</div>
			</c:if>
		</div>
	</div>
	
	<hr>
	<ul class="nav justify-content-center" role="tablist">
		<li class="nav-item">
			<a class="nav-link" id="contentListBtn">글 목록</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="chatListBtn">채팅 목록</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="">Menu 2</a>
		</li>
	</ul>
	<hr>


	
	<!-- 로그인 모달창 -->
<div class="modal" id="login">
	<div class="modal-dialog">
		<div class="modal-content">
		
			    <!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title"> 로그인</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<form action="login.me" method="POST">
			<div class="modal-body displayFlex">
				<!-- Modal body -->
				<div style="margin-left:40px;">
					<div class="displayFlex">
						<p class="loginText">아이디 : </p>
						<div style="margin-left : 20px">
							<input type="text" name="userId">
						</div>
					</div>
					<div class="displayFlex">
						<p class="loginText">비밀번호 : </p>
						<div style="margin-left : 5px">
							<input type="password" name="userPwd">
						</div>
					</div>
				</div>
				<div style="margin-left : 30px">
					<button class="btn btn-secondary" style="height:70px"> 로그인 </button>
				</div>
			</div>
		</form>
			<div style="margin-left:50px; margin-bottom: 15px;">
				<a href="#">아이디</a> / <a href="#">비밀번호 찾기</a>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$(document).on('click', '#logout', function(){
			if(confirm('로그아웃 하시겠습니까?')){
				window.location.href='logout.me';
			}
		})
	})
</script>

	
</body>
</html>