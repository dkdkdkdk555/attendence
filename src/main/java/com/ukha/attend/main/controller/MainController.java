package com.ukha.attend.main.controller;

import java.util.HashMap;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;
import com.ukha.attend.main.service.MainService;

@Controller
public class MainController { // 메인화면(출석부목록화면) 및 출석페이지의 컨트롤러
	
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
		
		String id = request.getParameter("id");
		String sell = request.getParameter("sell_name");
		String part = request.getParameter("part_name");
		
		// 로그인 유저의 아이디 
		mView.addObject("login_user_name", mainService.loginUserInfo(id));
		mView.addObject("login_id", id);
		
		// 셀정보 가져오기 
		SellDto sellInfo = mainService.getSellInfo(id, sell, part);
		mView.addObject("sellInfo", sellInfo);
		// 셀원목록 가져오기
		List<GPIDto> sellPeopleList = mainService.getSellPeopleList(id, sell, part);
		mView.addObject("peopleList", sellPeopleList);
		mView.addObject("auth", request.getParameter("access_level"));
		
		mView.setViewName("user/attend");
		
		return mView;
	}
	
	// 교인검색
	@RequestMapping(value = "/attend/searchForAddUser.do", method = {RequestMethod.POST})
	@ResponseBody
	public List<GPIDto> godPeopleSearchDo(@ModelAttribute("dto") GPIDto dto){ 
		
		List<GPIDto> list = mainService.searchUser(dto);
		
		return list;
	}
	
	// 교인추가
	@RequestMapping(value = "/attend/addSellPeople.do", method = {RequestMethod.POST})
	@ResponseBody
	public String addSellPeople(@ModelAttribute("dto") GPIDto dto){ 
		
		return mainService.addSellPeople(dto);
	}
	
	// 출석하기
	@RequestMapping(value = "/attend/attendTry.do", method = {RequestMethod.POST})
	@ResponseBody
	public String doAttend(@RequestBody List<AttendHistDto> list){ 
		
		try {
			//중복출석 인지 검사
			int n = mainService.examDuplAttend(list.get(0));
			if(n>0){ // 이미 해당날짜에 출석한 셀원이 있으면 중복출석으로 간주
				return "DUPLI";
			}
			// 출석처리
			int m = mainService.insertAttendHist(list);
			if(m == list.size()){
				return "SUCCESS";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "FAIL";
	}
	
	@RequestMapping(value = "/attend/lastAttendUpdate.do", method = {RequestMethod.POST})
	@ResponseBody
	public int doLastAttendUpdate(@ModelAttribute("dto") GPIDto dto){
		
		int n = mainService.updateLastAttend(dto);
		
		return n;
	}
	
	// 재적 등록 
	@RequestMapping(value = "/main/insertPeople.do", method = {RequestMethod.POST})
	@ResponseBody
	public String insertNewPeople(@ModelAttribute("dto") GPIDto dto){ 
		
		return mainService.insertNewPeople(dto);
	}
}
