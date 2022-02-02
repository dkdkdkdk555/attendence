package com.ukha.attend.login.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
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
	public String userLogin(HttpServletRequest request, HttpServletResponse response){ 
		
		String result = loginService.loginCheck(request, response);
				
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/login/userLogout.do")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mView){
		
		mView.setViewName("login");
		
		return mView;
	}
	
	// 회원가입페이지 이동
	@RequestMapping("/signup.do")
	public ModelAndView signupPage(HttpServletRequest request, ModelAndView mView){
		
		mView.setViewName("signup");
		
		return mView;
	}
	
	// 교인검색
	@RequestMapping(value = "/signup/godPeopleSearch.do", method = {RequestMethod.POST})
	@ResponseBody
	public List<GPIDto> godPeopleSearchDo(@ModelAttribute("dto") GPIDto dto){ 
		
		List<GPIDto> list = loginService.searchUser(dto);
		
		return list;
	}
	
	// 교회코드 유효여부
	@RequestMapping(value = "/signup/churchcode.do", method = {RequestMethod.POST})
	@ResponseBody
	public String testChurchCode(HttpServletRequest request){ 
		
		String code = request.getParameter("church_code");
		
		String result = loginService.testChurchCode(code); // Y or N
		
		return result;
	}
}
