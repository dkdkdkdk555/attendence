package com.ukha.attend.user.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.user.service.UserPrivateSerivce;
import com.ukha.attend.user.service.UserPrivateServiceImpl;

@Controller
public class UserController {
	
	@Autowired
	private UserPrivateSerivce userPrivateSerivce;
	
	@RequestMapping("/user/user_private.do")
	public ModelAndView userPirvateInit(ModelAndView mView, @ModelAttribute("dto") GPIDto dto){
		
		// GPI 데이터 가져오기
		GPIDto data = userPrivateSerivce.getSellPeoplePrivateData(dto);
		mView.addObject("dto", data);
		
		/*
		    	새신자 여부 및 장기결석 여부
		 */
		// data에서 churchcode 추출 - 해당 교회의 새신자기준 및 장기결석자기준 칼럼에서 횟수 추출
		ChurchDto churchDto = userPrivateSerivce.getBadgeStandard(data.getChurch_code());
		// 새신자인지 장기결석자인지 계산
		Map<String,String> calResult = userPrivateSerivce.calculateToStand(churchDto, data);
		mView.addObject("isCalResult", calResult);		
		
		mView.setViewName("user/user_private");
		
		return mView;
	}
}
