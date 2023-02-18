package com.mini.openChatting.chat.model.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private int detailNo;
	private String userId; // 글작성자
	private String userId2; //참여자
	private String title;
	private String content;
	private String originName;
	private String changeName;
	private String createDate;
}
