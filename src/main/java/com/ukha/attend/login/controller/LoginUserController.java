package com.ukha.attend.login.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.service.LoginUserService;

@Controller
public class LoginUserController {
	
	@Autowired
	private LoginUserService loginService;

	// 로그인페이지 이동
	@RequestMapping("/home.do")
	public ModelAndView login(HttpServletRequest request, ModelAndView mView){
		
		mView.setViewName("login");
		
		return mView;
	}
	
	// 로그인 체크
	@RequestMapping(value = "/login/userLogin.do", method = {RequestMethod.POST})
	@ResponseBody
	public String userLogin(HttpServletRequest request){ 
		
		String result = loginService.loginCheck(request);
				
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/login/userLogout.do")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mView){
		
		mView.setViewName("login");
		
		return mView;
	}
	
}
