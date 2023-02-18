<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	
	<jsp:include page="chat/chatListView.jsp"/>
	
	
	<!-- <hr>
	
	<button onclick="connect();">접속</button>
	<button onclick="disconnect();">종료</button>
	
	<script>
		var socket;
		function connect(){
			
			var uri = ' ws://localhost:8683/openChatting/chat';
			socket = new WebSocket(uri);

			socket.onopen = function(){ //소켓이 열리면 이 함수를 호출해라
				console.log('서버연결');
			}
			socket.onclose = function(){
				console.log('연결 종료');
			}
			socket.onerror = function(e){
				console.log('서버와 연결중 오류 발생');
			}
			socket.onmessage = function(e){
				console.log("메시지가 도착했습니다");
				
				var div =$('<div></div>');
				div.text(e.data);
				$('.message-warp').append(div);
			}
			
		}
		function disconnect(){
			socket.close();
		}
		function send(){
			var text = $('#chat-input').val();
			if(!text){
				return;
			}
			
			socket.send(text);
			$('#chat-input').val('');
			
		}
	</script>
	
	<input type="text" id="chat-input">
	<button onclick="send();">전송</button>
	수신된 메시지가 출력될 영역
	<div class="message-warp"> -->
	
</body>
</html>