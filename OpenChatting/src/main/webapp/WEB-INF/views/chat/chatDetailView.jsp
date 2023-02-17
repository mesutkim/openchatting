<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	
	
<style>
	.outer{
		width : 600px;
		margin : auto;
	}
    .align-left{
        display: flex;
    }
    .align-left-inline{
        display: inline-flex;
    }
    .align-left-side{
        display: flex;
        justify-content: space-between;
    }
    .align-right{
        display: flex;
        flex-direction: row-reverse;
    }
    #chatContent-area{
    	width : 600px;
    	height : 500px;
    	overflow:auto;
    	flex-direction:column_reverse;
    	border: 1px solid lightgray;
		border-radius: 5px;
		margin-top : 10px;
    
    }
	.speechBubble-other{
		margin-top: 5px;
		background-color: rgb(58, 58, 58);
		border-radius: 15px;
	}
	.speechBubble-other p{
		margin-bottom: 0px;
		margin-top : 5px;
		padding : 7px;
		color : white;
	}
	.speechBubble-mine{
		margin-top: 5px;
		margin-right: 5px;
		background-color: rgb(170, 170, 170);
		border-radius: 15px;
	}
	.speechBubble-mine p{
		margin-bottom: 0px;
		padding : 7px;
	}
</style>
</head>
<body>
	<div class="outer">
	
		<div>
			<h3>여긴 채팅제목입니당</h3>
		</div>
		
		<div id="chatContent-area">
			<!-- 남이 쓴 채팅 -->
			<div id="chatAlign-other"> 
	            <div style="width : 500px," class="align-left">
	                <div style="width : 50px; margin-left: 5px;">
	                    <img width="50px" height="50px" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F480%2Fno-image.png&type=sc960_832"> <!-- 이미지-->
	                </div>
	                <div style="max-width: 270px; margin-left: 5px;">
	                    <div style="height : 20px">
	                      	 아이디
	                    </div>
	                    <div class="speechBubble-other">
	                    	<input type="hidden" value="0">
	                    	<P>내용</P>
						</div>	
					</div>
	                
	            </div>
				<div style="display: flex; align-content: flex-end; margin-left: 60px;">
					<p style="margin-top: auto; margin-bottom: 0;">
						<!-- 여긴 날짜 -->2000.01.01
					</p>
				</div>
	        </div>
	        <!-- 내가 쓴 채팅 -->
	        <div id="chatAlign-mine" >
					<div class="align-right">
						<div style="max-width : 270px">
							<div class="speechBubble-mine">
								<input type="hidden" value="0">
								<P>content</P>
							</div>
						</div>
					</div>
					<div class="align-right">
						<div style="display: flex; align-content: flex-end; margin-right: 5px;">
							<p style="margin-top: auto; margin-bottom: 0;">
								<!-- 여긴 날짜 -->2000.01.01
							</p>
						</div>
					</div>
				</div>
		</div>
		
		<div class="align-left" style="margin-top : 20px;">
            <input type="text" class="form-control form-control-lg" id="chatContent-input" onkeyup="enterFn()" required>
            <button class="btn btn-secondary" style="width:70px" onclick="insertChatContent();">입력</button>
        </div>
		
	</div>
	
	
	<script>
	$(function(){
		enterFn();
	})
	function enterFn(){
        if(window.event.keyCode == 13){
        	insertChatContent();
        };
    }
	</script>
</body>
</html>