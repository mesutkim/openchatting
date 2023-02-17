package com.mini.openChatting.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	   
	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
	      
	      HttpSession session = request.getSession();
	      
	      if(session.getAttribute("loginUser")!= null) { // 로그인이 되어있을때
	         return true;
	      } else { // 로그인이 되어있지 않을 때
	         session.setAttribute("alertMsg", "로그인 하세요 ^^");
	         response.sendRedirect(request.getContextPath());
	         return false;
	      }
	      
	   }
	   
	}