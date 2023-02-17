package com.mini.openChatting.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mini.openChatting.member.model.dao.MemberDao;
import com.mini.openChatting.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m, sqlSession);
	}

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m, sqlSession);
	}
}
