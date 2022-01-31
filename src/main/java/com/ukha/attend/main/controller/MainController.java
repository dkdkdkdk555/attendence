package com.ukha.attend.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/user/main.do")
	public String mainInit(HttpServletRequest request){
		
		return "user/main";
	}
}
