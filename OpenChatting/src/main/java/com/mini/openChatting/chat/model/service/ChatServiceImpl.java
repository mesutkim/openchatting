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
	public int selectChatDetailStatus(Chat c) {
		return chatDao.selectChatDetailStatus(c, sqlSession);
	}

	@Override
	public int insertChatDetail(Chat c) {
		return chatDao.insertChatDetail(c, sqlSession);
	}

	@Override
	public int insertFirstChat(Chat c) {
		return chatDao.insertFirstChat(c, sqlSession);
	}

	@Override
	public ArrayList<Chat> selectChatContent(Chat c) {
		return chatDao.selectChatContent(c, sqlSession);
	}

	


}
