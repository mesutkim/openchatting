package com.mini.openChatting.chat.model.vo;

import lombok.Data;

@Data
public class Chat {
	private int chatNo;
	private int detailNo;
	private String userId;
	private String title;
	private String content;
	private String originName;
	private String changeName;
	private String createDate;
}
