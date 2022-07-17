package com.ukha.attend.tableview.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.tableview.service.TableViewService;

@Controller
public class TabelViewController {
	
	@Autowired
	private TableViewService tableViewService;
	

	@RequestMapping("/user/table_view.do")
	public ModelAndView doPage(@ModelAttribute("dto") AttendHistDto parameter, ModelAndView mView){
		
		String auth = parameter.getAccess_level();
		String login_id = parameter.getId();
		String login_user_name = parameter.getGod_people_name();
		
		mView.addObject("auth", auth);
		mView.addObject("login_id", login_id);
		mView.addObject("login_user_name", login_user_name);
		
		// 조회파라미터
		mView.addObject("dto", parameter);
		
		// 서비스에서 교회코드, 부서이름, 셀이름으로 ATTEND_HIST의 기록 가져오기 - 해당월의 기록 가져오기
		List<AttendHistDto> list = tableViewService.getAttendHist(parameter);
		mView.addObject("HistList", list);
		
		// 셀 이름으로 출석요일 가져오기
		String attDay = tableViewService.getAttendDay(parameter);
		mView.addObject("AttDay", attDay);
		
		// 조회 월의 시작과 끝
		AttendHistDto month = tableViewService.calTodayMonth();
		mView.addObject("month", month);
		
		// 셀원들 이름 가져오기
		List<GPIDto> nameList = tableViewService.getSellPPNameList(parameter);
		mView.addObject("nameList", nameList);
		
		mView.setViewName("user/table_view");
		
		return mView;
	}
	
	@RequestMapping(value = "/user/histResearch.do", method = {RequestMethod.POST})
	@ResponseBody
	public List<AttendHistDto> doResearch(@ModelAttribute("dto") AttendHistDto parameter){
	
		// 출석기록 가져오기
		List<AttendHistDto> list = tableViewService.getAttendHist(parameter);
		
		return list;
	}
	
}
