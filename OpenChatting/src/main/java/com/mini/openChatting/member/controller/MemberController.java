package com.mini.openChatting.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.mini.openChatting.common.entity.CertVO;
import com.mini.openChatting.member.model.service.MemberServiceImpl;
import com.mini.openChatting.member.model.vo.Member;

@Controller
public class MemberController extends TextWebSocketHandler{
	
	@Autowired
	private JavaMailSender sender;
	
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
	
	@ResponseBody
	@RequestMapping(value="insertKey.me", produces="appliction/json; charset=UTF-8")
	public String insertEmail(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr(); // ip 가져오기

		//6자리 숫자 만들기
		Random r = new Random();	
		int n = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(n); 
		
		CertVO certVo = new CertVO();
		certVo.setWho(ip);
		certVo.setSecret(secret);
		
		helper.setTo(email);
		helper.setSubject("인증번호입니다.");
		helper.setText("인증번호 : " + secret);
		
		sender.send(message); // 메일 전송
		
		
		return new Gson().toJson(memberService.insertKey(certVo));  // 테이블에 등록
	}
	
	@ResponseBody
	@RequestMapping(value="checkKey.me", produces="appliction/json; charset=UTF-8")
	public String CheckKey(String secret, HttpServletRequest request) {
		CertVO certVo = new CertVO();
		certVo.setSecret(secret);
		certVo.setWho(request.getRemoteAddr());
		
		return Integer.toString(memberService.selectCheckKey(certVo));
	}
	
	@ResponseBody
	@RequestMapping(value="deleteKey.me")
	public void deleteKey(HttpServletRequest request) {
		CertVO certVo = new CertVO();
		certVo.setWho(request.getRemoteAddr());
		memberService.deleteOldKey(certVo);
	}
	
	
	
	
}
