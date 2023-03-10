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

	public int selectChatDetailStatus(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectChatDetailStatus", c);
	}

	public int insertChatDetail(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chatMapper.insertChatDetail", c);
	}

	public int insertFirstChat(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chatMapper.insertFirstChat", c);
	}

	public ArrayList<Chat> selectChatContent(Chat c, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatContent", c);
	}

	public ArrayList<Chat> selectDetailNoList(Chat c, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectDetailNoList", c);
	}

	public ArrayList<Chat> selectChatDetailList(ArrayList<Chat> list, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatDetailList", list);
	}

	public ArrayList<Chat> selectChatDetail(int cno, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatMapper.selectChatDetail", cno);
	}

	public int insertChatContent(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("chatMapper.insertChatContent", c);
	}

	public Chat selectLastChatContent(Chat c, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chatMapper.selectLastChatContent", c);
	}

}
