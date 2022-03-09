package com.ukha.attend.user.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.user.service.UserPrivateSerivce;

@Controller
public class UserController {
	
	@Autowired
	private UserPrivateSerivce userPrivateService;
	
	@RequestMapping("/user/user_private.do")
	public ModelAndView userPirvateInit(ModelAndView mView, @ModelAttribute("dto") GPIDto parameter){
		
		// GPI 데이터 가져오기
		GPIDto dto = userPrivateService.getSellPeoplePrivateData(parameter);
		mView.addObject("dto", dto);
		
		/*
		    	새신자 여부 및 장기결석 여부
		 */
		// data에서 churchcode 추출 - 해당 교회의 새신자기준 및 장기결석자기준 칼럼에서 횟수 추출
		ChurchDto churchDto = userPrivateService.getBadgeStandard(dto.getChurch_code());
		// 새신자인지 장기결석자인지 계산
		Map<String,String> calResult = userPrivateService.calculateToStand(churchDto, dto);
		mView.addObject("isCalResult", calResult);
		
		/*
		  		최근출석일로 최근출석이력 가져오기
		 */
		String attendHist = userPrivateService.getAttendHist(dto);
		mView.addObject("attendHist", attendHist);
		
		mView.setViewName("user/user_private");
		
		return mView;
	}
	
	@RequestMapping(value = "/user/updateRecentAttend.do", method = {RequestMethod.POST})
	@ResponseBody
	public String updateRecentAttend(@ModelAttribute("dto") AttendHistDto parameter){
		
		String result = "";
		
		// 출석유형에 따른 분기
		String attendType = parameter.getAttend_value();
		switch(attendType){
			case "secondary": // row select -> row 삭제
				result = userPrivateService.secondaryLogic(parameter);
				break;
			case "warning": // row select -> 지각여부를 "Y"로 업데이트 or row 생성
				result = userPrivateService.warningLogic(parameter);
				break;
			case "success": // row select -> row 생성 or 지각여부  "N"처리
				result = userPrivateService.successLogic(parameter);
				break;
		}
		
		return result; 
	}
	
	@RequestMapping(value = "/user/updateSellPeopleInfo.do", method = {RequestMethod.POST})
	@ResponseBody
	public String updateSellPeopleInfo(@ModelAttribute("dto") GPIDto parameter){
		
		String result = "";
		
		int n = userPrivateService.updateSellPPInfo(parameter);
		
		if(n==1){
			result = "SUCCESS";
		} else if(n==12){
			result = "ERROR";
		} else{
			result = "FAIL";
		}
		
		return result; 
	}
}
