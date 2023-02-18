package com.mini.openChatting.chat.model.service;

import java.util.ArrayList;

import com.mini.openChatting.chat.model.vo.Chat;
import com.mini.openChatting.common.model.vo.PageInfo;

public interface ChatService {
	
	int insertChat(Chat c);
	
	int selectListCount();
	
	ArrayList<Chat> selectChatList(PageInfo pi);
	
	int selectChatDetailStatus(Chat c);
	
	int insertChatDetail(Chat c);
	
	int insertFirstChat(Chat c);
	
	ArrayList<Chat> selectChatContent(Chat c);
	
	ArrayList<Chat> selectDetailNoList(Chat c);
	
	ArrayList<Chat> selectChatDetailList(ArrayList<Chat> list);
	
	ArrayList<Chat> selectChatDetail(int cno);
}
