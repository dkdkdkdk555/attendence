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

import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.tableview.service.TableViewService;

@Controller
public class TabelViewController {
	
	@Autowired
	private TableViewService tableViewService;
	

	@RequestMapping("/user/table_view.do")
	public ModelAndView doPage(@ModelAttribute("dto") AttendHistDto parameter, ModelAndView mView){
		
		// 서비스에서 교회코드, 부서이름, 셀이름으로 ATTEND_HIST의 기록 가져오기 - 해당월의 기록 가져오기
		List<AttendHistDto> list = tableViewService.getAttendHist(parameter);
		
		mView.addObject("HistList", list);
		
		
		mView.setViewName("user/table_view");
		
		return mView;
	}
	
	@RequestMapping(value = "/user/histResearch.do", method = {RequestMethod.POST})
	@ResponseBody
	public List<AttendHistDto> doResearch(@ModelAttribute("dto") AttendHistDto parameter){
		
		return null;
	}
	
}
