package com.mini.openChatting.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private String userId;
	private String userPwd;
	private String name;
	private String address;
	private String detailAddress;
	private String birthDate;
	private String gender;
	private String email;
}
