package com.ukha.attend.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.user.service.UserPrivateSerivce;

@Controller
public class UserController {
	
	@Autowired
	private UserPrivateSerivce userPrivateSerivce;
	
	@RequestMapping("/user/user_private.do")
	public ModelAndView userPirvateInit(ModelAndView mView, @ModelAttribute("dto") GPIDto dto){
		
		// GPI 데이터 가져오기
		mView.addObject("dto", userPrivateSerivce.getSellPeoplePrivateData(dto));
		
		mView.setViewName("user/user_private");
		
		return mView;
	}
}
