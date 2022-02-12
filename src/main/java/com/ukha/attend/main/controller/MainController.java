package com.ukha.attend.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;
import com.ukha.attend.main.service.MainService;

@Controller
public class MainController { // 메인화면(출석부목록화면) 컨트롤러
	
	@Autowired
	private MainService mainService;
	
	// 메인페이지 이동
	@RequestMapping("/user/main.do")
	public ModelAndView mainInit(HttpServletRequest request, ModelAndView mView){
		
		HashMap<String, Object> resultData = null;
		
		// 파라미터로 아이디가 넘어옴 -> 아이디가 고유하고 이름+생일 정보를  모두 담고있기에
		String id = request.getParameter("id");
		// 1. 아이디로 gpi에서 소속정보 및 권한 가져오기
		GPIDto gpiDto =  mainService.getUserBelongInfo(id);
		// 2. 교회코드로 교회이름 및 이미지경로 얻어옴
		ChurchDto churchDto = mainService.getChurchInfo(gpiDto.getChurch_code());
		// 3. 부서에 해당하는 셀목록을 가져온다
		// 소속부서 셀리스트
		List<SellDto> sellList = mainService.getSellList(gpiDto, "origin");
		// 봉사부서 셀리스트
		List<SellDto> volunSellList = mainService.getSellList(gpiDto, "volun");
		
		// 뷰파라미터 추가
		mView.addObject("churchDto", churchDto);
		mView.addObject("gpiDto", gpiDto);
		mView.addObject("sellList", sellList);
		mView.addObject("volunSellList", volunSellList);
		
		
		mView.setViewName("user/main");
		
		return mView;
	}
	
	// 출석페이지 이동
	@RequestMapping(value="/user/attend.do", method = {RequestMethod.GET} )
	public ModelAndView attendInit(HttpServletRequest request, ModelAndView mView){
		mView.addObject("id", request.getParameter("id"));
		mView.addObject("auth", request.getParameter("auth"));
		mView.addObject("sell", request.getParameter("sell"));
		
		mView.setViewName("user/attend");
		
		return mView;
	}
}
