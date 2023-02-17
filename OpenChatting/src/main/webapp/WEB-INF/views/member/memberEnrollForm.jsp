<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
	.outer {
		width:400px;
		height:400px;
		text-align:center;
		border-radius: 15px;
		margin : auto;
	}
	h2 {
		text-align: center;
	}
	form input{
		width : 100%;
	}
	.textForm {
		margin: 30px;
		padding: 10px 10px;
	}
	.displayFlex {
		display : flex;
	}
</style>
</head>
<body>
	<h2>회원가입</h2>
	<div class="outer">
		<form action="insert.me" method="POST">
		
			<div class="textForm">
			    <input name="userId" type="text" class="id" id="userId" placeholder="아이디" required>
			    <div id="checkResult" style="font-size:0.7em; display:none;"></div>
		    </div>
		    
		    <div class="textForm">
	        	<input name="userPwd" type="password" placeholder="비밀번호" id="userPwd" required>
	      	</div>
		    
		    <div class="textForm">
	        	<input id="checkPwd" type="password" placeholder="비밀번호 확인" required>
	      	</div>

		    <div class="textForm">
	        	<input name="name" type="text" placeholder="이름" id="userPwd" required>
	      	</div>
	      	
	      	<div class="textForm">
	        	<input name="email" type="email" placeholder="이메일" id="email" required>
	      	</div>
			
			<div class="textForm">
	        	<input name="address" type="text" placeholder="주소" id="address" required>
	      	</div>

			<div class="textForm">
	        	<input name="detailAddress" type="text" placeholder="상세주소" id="detailAddress" required>
	      	</div>
			
			<div class="textForm">
	        	<input name="birthDate" type="text" placeholder="생년월일" required>
	      	</div>
	      	
	      	<div class="textForm" >
	       		<label for=""> 성별 : </label> &nbsp;&nbsp;
	            <input type="radio" id="Male" value="M" name="gender" checked>
	            <label for="Male">남자</label> &nbsp;&nbsp;
	            <input type="radio" id="Female" value="W" name="gender">
	            <label for="Female">여자</label> &nbsp;&nbsp;
	     	</div>
			
			<button class="btn btn-secondary btn-lg">회원가입</button> &nbsp; <button class="btn btn-dark btn-lg">뒤로가기</button>
		</form>
			
	</div>

</body>
</html>