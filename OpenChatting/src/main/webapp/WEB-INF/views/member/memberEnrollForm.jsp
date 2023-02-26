<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
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
	form .inputText{
		width : 100%;
	}
	.textForm {
		margin: 30px;
		padding: 10px 10px;
	}
	.displayFlex {
		display : flex;
	}
	#checkText {
		margin : 3px;
	}
	
</style>
</head>
<body>
	<h2>회원가입</h2>
	<div class="outer">
		<form action="insert.me" method="POST">
		
			<div class="textForm">
			    <input name="userId" type="text" class="id inputText" id="userId" placeholder="아이디" required>
			    <div id="checkResult" style="font-size:0.7em; display:none;"></div>
		    </div>
		    
		    <div class="textForm">
	        	<input name="userPwd" type="password" placeholder="비밀번호" id="userPwd" class="inputText" required>
	      	</div>
		    
		    <div class="textForm">
	        	<input id="checkPwd" type="password" placeholder="비밀번호 확인" required class="inputText"> 
	      	</div>

		    <div class="textForm">
	        	<input name="name" type="text" placeholder="이름" id="name" required class="inputText">
	      	</div>
	      	
	      	<div class="textForm">
	      		<div id="emailArea">
		        	<input name="email" type="email" placeholder="이메일" id="email" required style="width : 255px" class="inputText">
		        	<button type="button" class="btn btn-secondary " id="mailCheck" name="email" style="height : 36px;" onclick="checkEmail();">인증</button>
	      		</div>

	      		<div id="checkArea">
		      		<input type="text" name="secret" id="secret" style="width : 255px" required class="inputText">
		      		<button type="button" class="btn btn-secondary " id="secretCheck name="email" style="height : 36px" onclick="checkKey();">확인</button>
	      		</div>
 	      		
 	      		<p id=checkText></p>
	      	</div>
			
			<div class="textForm">
	        	<input name="address" type="text" placeholder="주소" id="address" required class="inputText">
	      	</div>

			<div class="textForm">
	        	<input name="detailAddress" type="text" placeholder="상세주소" id="detailAddress" required class="inputText">
	      	</div>
			
			<div class="textForm">
	        	<input name="birthDate" type="text" placeholder="생년월일" required class="inputText">
	      	</div>
	      	
	      	<div class="textForm" >
	       		<label for=""> 성별 : </label> &nbsp;&nbsp;
	            <input type="radio" id="Male" value="M" name="gender" checked>
	            <label for="Male">남자</label> &nbsp;&nbsp;
	            <input type="radio" id="Female" value="W" name="gender">
	            <label for="Female">여자</label> &nbsp;&nbsp;
	     	</div>
			
			<button class="btn btn-secondary btn-lg">회원가입</button> &nbsp; <button type="return" class="btn btn-dark btn-lg">뒤로가기</button>
		</form>
			
	</div>
	
	<script>
	$(function(){
		$('#checkArea').hide();
	})
	function checkEmail(){
		if($('#email').val() != ''){
			$('#email').attr('readonly', true);
			$('#mailCheck').attr('disabled', true);
			$.ajax({
				url : 'insertKey.me',
				type : 'post',
				data : {
					email : $('#email').val()
				},
				success : function(result){
					if(result > 0){
						countdown();
						$('#checkArea').show();
					}
				}
			})
		}
	}
	function checkKey(){
		$.ajax({
			url : 'checkKey.me',
			type : 'post',
			data : {
				secret : $('#secret').val()
			},
			success : function(result){
				if(result > 0){
					clearInterval(interval); //인터벌 종료
					$('#checkText').text('인증되었습니다.');
					$('#email').attr('readonly', true);
					$('#checkArea').hide();
				} else {
					$('#checkText').text('인증번호를 다시 입력하세요');
				}
			}
		})
	}
	var interval;
	function countdown(){
		var min = 3;
		var sec = 00;
		interval = setInterval(function(){
			if(sec == '00' && min != 0){
				min--;
				sec = 59;
			}
			else if(sec != '00'){
				sec--;
			}
			
			if(sec < 10){
				sec = '0' + sec;
			}
			
			$('#checkText').text('남은 시간  : ' + min + ':' + sec);
			
			if(sec == '00' && min == 0){
				clearInterval(interval);
				deleteEndKey();
				$('#checkText').text('메일 주소를 확인하고 다시 인증해 주세요');
				$('#secret').val('');
				$('#mailCheck').attr('disabled', false);
				$('#checkArea').hide();
			} 
		}, 1000)
	}
	
	function deleteEndKey(){
		$.ajax({
			url : 'deleteKey.me'
		})
	}
	</script>

</body>
</html>