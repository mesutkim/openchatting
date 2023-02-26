package com.mini.openChatting.member.model.service;

import com.mini.openChatting.common.entity.CertVO;
import com.mini.openChatting.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	Member loginMember(Member m);
	int insertKey(CertVO certVo);
	int selectCheckKey(CertVO certVo);
	int deleteOldKey(CertVO certVo);
}
