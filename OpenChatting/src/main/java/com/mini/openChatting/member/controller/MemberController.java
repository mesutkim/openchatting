package com.mini.openChatting.member.controller;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.mini.openChatting.member.model.service.MemberServiceImpl;
import com.mini.openChatting.member.model.vo.Member;

@Controller
public class MemberController extends TextWebSocketHandler{
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("EnrollForm.me")
	public ModelAndView enrollFrom(ModelAndView mv) {
		mv.setViewName("member/memberEnrollForm");
		return mv;
	}
	
	@RequestMapping("insert.me")
	public ModelAndView insertMember(ModelAndView mv, Member m, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		if(memberService.insertMember(m) > 0) {
//			mv.addObject("alertMsg", "회원가입 성공!");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "가입 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginUser(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
//			mv.addObject("alertMsg", loginUser.getUserId() + " 님 로그인 되셨습니다.");
			mv.setViewName("redirect:/");
		} else {
//			mv.addObject("alertMsg", "아이디, 비밀번호를 확인해주세요.");
			mv.setViewName("redirect:/");
		}
		session.setAttribute("nowPage", "chatListView");
		return mv;
	}
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
