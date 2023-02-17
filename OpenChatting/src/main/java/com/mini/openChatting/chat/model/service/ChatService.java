package com.mini.openChatting.chat.model.service;

import java.util.ArrayList;

import com.mini.openChatting.chat.model.vo.Chat;
import com.mini.openChatting.common.model.vo.PageInfo;

public interface ChatService {
	
	int insertChat(Chat c);
	
	int selectListCount();
	
	ArrayList<Chat> selectChatList(PageInfo pi);
	
	int insertFirstChat(Chat c);
	
	int selectChatDetailStatus(Chat c);
	
	int selectChatDetailNo(Chat c);
}
