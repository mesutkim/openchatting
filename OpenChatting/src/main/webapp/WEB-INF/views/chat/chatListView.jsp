<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.displayFlex {
		display : flex;
	}
	#write {
		border-radius : 50%;
	}
	p {
		margin-bottom : 6px;
	}
	.writer {
		margin-bottom : 10px;
	}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer" style="width : 700px; margin : auto;">
		
		<div id="writeArea" style="margin-top : 30px">
			<button class="btn btn-secondary btn-sm" id="write"> + </button>
		</div>
	</div>
	
	<script>
		$(function(){
			
			$(document).on('click', '.chattingBtn', function(){
				$(this).next().find('.content').val(prompt('내용을 입력하세요'));
				$(this).next().attr('action', 'insert.de').submit();
				/* if(confirm('채팅하시겠습니까?')){
					location.href='detail.ch?cno='+ $(this).next().val();
				} */
			});
			
			$(document).on('click', '#write', function(){
				location.href='enrollForm.ch';
			});
			$(document).on('click', '.notLogin', function(){
				alert('로그인 후 이용 가능합니다.');
			});
			$(document).on('click', '#chatListBtn', function(){
				location.href='list.de'
			});
			$(document).on('click', '#contentListBtn', function(){
				location.href='list.ch'
			});
		})
		
		
	</script>
	
	<c:if test="${ empty loginUser }">>
		<script>
			$(function(){
				$.ajax({
					url : "list.ch",
					success : function(list){
						var value='';
						for(var i in list){
							value += '<div class="oneContent displayFlex" style="display : flex; height:110px; margin-top : 15px; border-bottom : 1px solid lightgray">'
									+	'<div class="contentArea" style="width : 600px">'
								  	+		'<div id="title" class="clickArea">'
									+			'<h3>' + list[i].title + '</h3>'
									+		'</div>'
									+		'<div id="content" class="clickArea">'
									+			'<p>' + list[i].content + '</p>'
									+		'</div>'
									+		'<div class="writer">'
									+			list[i].userId
									+		'</div>'
									+	'</div>'
					 				+	'<div class="btnArea" style="width:90px; height:90px; padding : 5px">'
									+		'<button class="notLogin btn btn-info" style="width: 90px; height:90px">채팅하기</button>'
									+	'</div>'
									+'</div>'
						}
						$('#listArea').html(value);
					}
					
				});
			})
		</script>
	</c:if>
	<c:if test="${ not empty loginUser}">
		<script>
			$(function(){
				$.ajax({
					url : "list.ch",
					success : function(list){
						var value='';
						for(var i in list){
							if('${loginUser.userId}' == list[i].userId){
								value += '<div class="oneContent displayFlex" style="display : flex; height:110px; margin-top : 15px; border-bottom : 1px solid lightgray">'
									+	'<div class="contentArea" style="width : 600px">'
								  	+		'<div id="title" class="clickArea">'
									+			'<h3>' + list[i].title + '</h3>'
									+		'</div>'
									+		'<div id="content" class="clickArea">'
									+			'<p>' + list[i].content + '</p>'
									+		'</div>'
									+		'<div class="writer">'
									+			list[i].userId
									+		'</div>'
									+	'</div>'
					 				+	'<div class="btnArea" style="width:90px; height:90px; padding : 5px">'
									+		'<button class="writerBtn btn btn-info" style="width: 90px; height:90px" disabled>내 채팅</button>'
									+	'</div>'
									+'</div>'
							} else {
								value += '<div class="oneContent displayFlex" style="display : flex; height:110px; margin-top : 15px; border-bottom : 1px solid lightgray">'
									+	'<div class="contentArea" style="width : 600px">'
								  	+		'<div id="title" class="clickArea">'
									+			'<h3>' + list[i].title + '</h3>'
									+		'</div>'
									+		'<div id="content" class="clickArea">'
									+			'<p>' + list[i].content + '</p>'
									+		'</div>'
									+		'<div class="writer">'
									+			list[i].userId
									+		'</div>'
									+	'</div>'
					 				+	'<div class="btnArea" style="width:90px; height:90px; padding : 5px">'
									+		'<button class="chattingBtn btn btn-info" style="width: 90px; height:90px">채팅하기</button>'
									+		'<form action="" method="POST" class="chattingForm">'
									+       	'<input type="hidden" class="chatNo"  name="chatNo" value="' + list[i].chatNo + '">'
									+			'<input type="hidden" class="content" name="content">'
									+			'<input type="hidden" name="userId" value="' + list[i].userId + '">'
									+		'</form>'
									+	'</div>'
									+'</div>'
							}
						}
						$('#listArea').html(value);
					}
					
				});
			})
		</script>
	</c:if>
</body>
</html>