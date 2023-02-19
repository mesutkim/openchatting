package com.mini.openChatting.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
import com.mini.openChatting.member.model.vo.Member;

@Controller
public class ChatController {
	
	@Autowired
	private ChatServiceImpl chatService;
	
	
	// 글 목록  view로
	@RequestMapping("list.ch")
	public ModelAndView selectChatList(ModelAndView mv) {
		mv.setViewName("chat/chatListView");
		return mv;
	}
	
	// 글 목록
	@ResponseBody
	@RequestMapping(value="ajaxlist.ch", produces="appliction/json; charset=UTF-8")
	public String ajaxSelectChatList(@RequestParam(value="cPage", defaultValue="1") int currentPage) {
		PageInfo pi = Pagination.getPageInfo(chatService.selectListCount(), currentPage, 10, 7);
		return new Gson().toJson(chatService.selectChatList(pi));
	}
	
	//글 작성 폼으로
	@RequestMapping("enrollForm.ch")
	public ModelAndView chatEnrollForm(ModelAndView mv) {
		mv.setViewName("chat/chatEnrollForm");
		return mv;
	}
	
	//글 작성
	@RequestMapping("insert.ch")
	public ModelAndView insertChat(ModelAndView mv, Chat c) {
		if(chatService.insertChat(c) > 0) {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	//첫번째 채팅 입력
	@RequestMapping("insert.de")
	public ModelAndView insertFirstChat(ModelAndView mv, Chat c, HttpSession session) {
		c.setUserId2(((Member)session.getAttribute("loginUser")).getUserId());
		System.out.println(c);
		if (chatService.selectChatDetailStatus(c) == 0) {
			chatService.insertChatDetail(c);
			chatService.insertFirstChat(c);
			
		} else {
			chatService.insertFirstChat(c);
		};
		mv.addObject("list", chatService.selectChatContent(c))
		.setViewName("chat/chatDetailView");
		return mv;
	}
	
	//채팅 목록
	@RequestMapping("list.de")
	public ModelAndView selectChatDetailList(ModelAndView mv, Chat c) {
		ArrayList<Chat> list = chatService.selectDetailNoList(c);
		mv.addObject("list", chatService.selectChatDetailList(list))
		.setViewName("chat/chatDetailListView");
		return mv;
	}
	
	//채팅 내용
	@RequestMapping("detail.de")
	public ModelAndView selectChatDetail(ModelAndView mv, HttpSession session , int cno) {
		mv.addObject("list", chatService.selectChatDetail(cno))
		.setViewName("chat/chatDetailView");
		return mv;
	}
	
	//채팅 insert
	@ResponseBody
	@RequestMapping(value="insert.co", produces="appliction/json; charset=UTF-8")
	public String ajaxInsertChatContent(Chat c) {
		return new Gson().toJson(chatService.insertChatContent(c));
	}
	
	//방금 쓴 채팅 select
	@ResponseBody
	@RequestMapping(value="select.co", produces="appliction/json; charset=UTF-8")
	public String ajaxSelectChatContent(Chat c) {
		return new Gson().toJson(chatService.selectLastChatContent(c));
	}
}
