package com.human.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chatController {
	
	@GetMapping("/")
	   public String login() {
	      
	      return "chat";
	   }

}
