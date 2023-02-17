package com.mini.openChatting.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.openChatting.chat.model.dao.ChatDao;
import com.mini.openChatting.chat.model.vo.Chat;
import com.mini.openChatting.common.model.vo.PageInfo;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	@Override
	public int insertChat(Chat c) {
		return chatDao.insertChat(c, sqlSession);
	}

	@Override
	public int selectListCount() {
		return chatDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Chat> selectChatList(PageInfo pi) {
		return chatDao.selectChatList(pi, sqlSession);
	}

	@Override
	public int insertChatDetail(int cno) {
		return chatDao.insertChatDetail(cno, sqlSession);
	}

}
