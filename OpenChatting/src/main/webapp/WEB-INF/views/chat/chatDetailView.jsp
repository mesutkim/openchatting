<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
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
		margin-top: 3px;
		margin-bottom : 3px;
		background-color: rgb(58, 58, 58);
		border-radius: 15px;
	}
	.speechBubble-other p{
		margin-bottom: 3px;
		margin-top : 3px;
		padding : 7px;
		color : white;
	}
	.speechBubble-mine{
		margin-top: 3px;
		margin-right: 5px;
		margin-bottom : 3px;
		background-color: rgb(170, 170, 170);
		border-radius: 15px;
	}
	.speechBubble-mine p{
		margin-bottom: 3px;
		padding : 7px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="outer">
		<div>
			<h3>${ list[0].title }</h3>
		</div>
		
		<div id="chatContent-area">
			<c:forEach items="${ list }" var="c">
				<!-- 남이 쓴 채팅 -->
				<c:if test="${ loginUser.userId != c.userId }">
					<div id="chatAlign-other"> 
			            <div style="width : 100%," class="align-left">
			                <div style="width : 50px; margin-left: 5px;">
			                    <img width="50px" height="50px" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F480%2Fno-image.png&type=sc960_832"> <!-- 이미지-->
			                </div>
			                <div style="max-width: 270px; margin-left: 5px;">
			                    <div style="height : 20px">
			                      	 ${ c.userId }
			                    </div>
			                    <div class="speechBubble-other">
			                    	<P>${ c.content }</P>
								</div>	
							</div>
						<div style="display: flex; align-content: flex-end; margin-left: 10px;">
							<p style="margin-top: auto; margin-bottom: 0;">
								${ c.createDate }
							</p>
						</div>
			            </div>
			        </div>
				</c:if>
				
		        <!-- 내가 쓴 채팅 -->
		        <c:if test="${ loginUser.userId == c.userId }">
			        <div id="chatAlign-mine" class="align-right">
						<div class="align-right">
							<div style="max-width : 270px">
								<div class="speechBubble-mine">
									<P>${ c.content }</P>
								</div>
							</div>
						</div>
						<div class="align-right">
							<div style="display: flex; align-content: flex-end; margin-right: 5px;">
								<p style="margin-top: auto; margin-bottom: 0;">
									${ c.createDate }
								</p>
							</div>
						</div>
					</div>
			</c:if>
			</c:forEach>
		</div>
		
		<div class="align-left" style="margin-top : 20px;">
            <input type="text" class="form-control form-control-lg" id="chatContent-input">
            <button class="btn btn-secondary" style="width:70px" onclick="send();">입력</button>
        </div>
		
	</div>
	
	
	<script>
		$(function(){
			scrollDown();
			$('#chatContent-input').keyup(function(key){
		        if(key.keyCode==13) {
		            send();
		        };
		    });
		})
		function scrollDown(){
			$("#chatContent-area").scrollTop($("#chatContent-area")[0].scrollHeight);
		}
		
		function selectChatDetail(e){
			
			var detailNo = ${ list[0].detailNo };
			
			$.ajax({
				url : "select.co",
				data : {
					content : e, //입력된 내용
					detailNo : detailNo
				},
				success : function(c){
					var value = '';
					if(c.detailNo == detailNo){ //전달된 메세지가 이 채팅방의 메세지 일 경우
						if('${loginUser.userId}' == c.userId){//내가 쓴 채팅
							value = '<div id="chatAlign-mine" class="align-right">'
								  +		'<div style="width : 100%," class="align-left">'
								  +			'<div style="max-width : 270px">'
								  +				'<div class="speechBubble-mine">'
								  +					'<P>' + c.content + '</P>'
								  +				'</div>'
								  +			'</div>'
								  +		'</div>'
								  +		'<div class="align-right">'
								  +			'<div style="display: flex; align-content: flex-end; margin-right: 5px;">'
								  +				'<p style="margin-top: auto; margin-bottom: 0;">'
								  +					c.createDate
								  +				'</p>'
								  +			'</div>'
								  +		'</div>'
								  +	'</div>'
						
						}else{ //상대방이 쓴 채팅
							value = '<div id="chatAlign-other">'
							      + 	'<div style="width : 500px," class="align-left">'
							      + 		'<div style="width : 50px; margin-left: 5px;">'
							      + 			'<img width="50px" height="50px" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.icons8.com%2Fcolor%2F480%2Fno-image.png&type=sc960_832"> <!-- 이미지-->'
							      + 		'</div>'
							      + 		'<div style="max-width: 270px; margin-left: 5px;">'
							      + 			'<div style="height : 20px">'
							      +                	 c.userId
							      + 			'</div>'
							      + 			'<div class="speechBubble-other">'
							      + 				'<P>' + c.content +'</P>'
								  +				'</div>'
								  +			'</div>'
								  +		'<div style="display: flex; align-content: flex-end; margin-left: 10px;">'
								  +			'<p style="margin-top: auto; margin-bottom: 0;">'
								  +				c.createDate
								  +			'</p>'
								  + 	'</div>'
							      + 	'</div>'
							      + '</div>'
						}
					}
					$('#chatContent-area').html($('#chatContent-area').html() + value);
					scrollDown();
				}
			});
		}	
		
				
		function disconnect(){
			socket.close();
			
		}
		function send(){
			var text = $('#chatContent-input').val();
			if(!text){
				return;
			}
			$.ajax({
				url : "insert.co",
				data : {
					userId : '${loginUser.userId}',
					content : text,
					detailNo : ${ list[0].detailNo },
					chatNo : ${ list[0].chatNo }
				},
				success : function(result){
					if(result > 0){
						socket.send(text);
					}
				}
			});
			$('#chatContent-input').val('');
			
		}
	</script>
	
</body>
</html>