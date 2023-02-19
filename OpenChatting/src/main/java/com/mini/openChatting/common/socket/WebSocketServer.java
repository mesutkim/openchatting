package com.mini.openChatting.common.socket;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mini.openChatting.member.model.vo.Member;

public class WebSocketServer extends TextWebSocketHandler{

	private Set<WebSocketSession> users = new CopyOnWriteArraySet();
	
	/*
	 *  -젒속 시 실행되는 메소드 =>콜백
	 *  session : 접속한 사용자의 웹 소켓 정보
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		((Member)session.getAttributes().get("loginUser")).setWsSession(session.getId()); //로그인 한 유저에게 session의 id값 넣어주기
		users.add(session);
	}
	
	/*
	 *  -메시지 수신 시 호출될 메소드
	 *  session : 전송자의 웹 소켓 정보
	 *  message : 사용자가 전송한 메시지 정보
	 *  		payload : 실제 보낸 내용
	 *  		byteCount : 보낸 메시지 크기
	 *  		last : 메시지 종료 여부
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메시지를 모든 사용자에게 전송(사용자 수만큼 반복)
		TextMessage newMessage = new TextMessage(message.getPayload()); //payload 필드에 있는 사용자가 실제로 보낸 내용 (본문)
		
		for(WebSocketSession ws : users) {
			ws.sendMessage(newMessage);
		}
	}
	
	/*
	 * 접속 종료 시 호출되는 메소드 -> 콜백
	 * session : 접속한 사용자의 웹 소켓 정보
	 * status : 접속이 종료된 원인과 관련된 정보
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		System.out.println("사용자 종료! 현재 " + users.size() + "명");
	}
	
	
	
}
