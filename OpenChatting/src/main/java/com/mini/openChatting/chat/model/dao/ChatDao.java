package com.mini.openChatting.chat.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mini.openChatting.chat.model.vo.Chat;
import com.mini.openChatting.common.model.vo.PageInfo;

@Repository
public class ChatDao {

	public int insertChat(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chatMapper.insertChat", c);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectListCount");
	}

	public ArrayList<Chat> selectChatList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatList", null, rowBounds);
	}

}
