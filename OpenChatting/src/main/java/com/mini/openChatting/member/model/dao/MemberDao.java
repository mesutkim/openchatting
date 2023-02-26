package com.mini.openChatting.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mini.openChatting.common.entity.CertVO;
import com.mini.openChatting.member.model.vo.Member;

@Repository
public class MemberDao {

	public int insertMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertKey(CertVO certVo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertKey", certVo);
	}

	public int selectCheckKey(CertVO certVo, SqlSessionTemplate sqlSession) {
		int result = sqlSession.selectOne("memberMapper.selectCheckKey", certVo);
		if(result > 0) {
			sqlSession.delete("memberMapper.deleteCheckKey", certVo);
		}
		return result;
	}

	public int deleteOldKey(CertVO certVo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("memberMapper.deleteOldKey", certVo);
	}

}
