package com.mini.openChatting.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mini.openChatting.chat.model.service.ChatServiceImpl;
import com.mini.openChatting.chat.model.vo.Chat;
import com.mini.openChatting.common.model.vo.PageInfo;
import com.mini.openChatting.common.template.Pagination;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService;
	
	@ResponseBody
	@RequestMapping(value="list.ch", produces="appliction/json; charset=UTF-8")
	public String ajaxDrawBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage,  ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(chatService.selectListCount(), currentPage, 10, 7);
		return new Gson().toJson(chatService.selectChatList(pi));
	}
	
	@RequestMapping("detail.ch")
	public ModelAndView selectChatDetail(ModelAndView mv, int cno) {
		System.out.println(cno);
		chatService.insertChatDetail(cno);
		mv.setViewName("chat/chatDetailView");
		return mv;
	}
	@RequestMapping("enrollForm.ch")
	public ModelAndView chatEnrollForm(ModelAndView mv) {
		mv.setViewName("chat/chatEnrollForm");
		return mv;
	}
	@RequestMapping("insert.ch")
	public ModelAndView insertChat(ModelAndView mv, Chat c) {
		if(chatService.insertChat(c) > 0) {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
}
