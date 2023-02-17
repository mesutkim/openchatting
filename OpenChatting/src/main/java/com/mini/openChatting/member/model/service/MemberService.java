package com.mini.openChatting.member.model.service;

import com.mini.openChatting.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	Member loginMember(Member m);
}
