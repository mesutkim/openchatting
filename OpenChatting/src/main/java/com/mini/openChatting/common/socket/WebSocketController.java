package com.mini.openChatting.common.socket;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {
	
	@RequestMapping("/basic")
	public String basic() {
		return "basic";
	}
	
}
