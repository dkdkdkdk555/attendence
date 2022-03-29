package com.ukha.attend.statistics.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StatisticsController {

	@RequestMapping("/user/statistics.do")
	public ModelAndView doPage(HttpServletRequest request, ModelAndView mView){
		
		Map<String, String>  map = new HashMap<>();
		map.put("church_code", (String) request.getAttribute("church_code"));
		map.put("part_name", (String) request.getAttribute("part_name"));
		map.put("sell_name", (String) request.getAttribute("sell_name"));
		map.put("access_level", (String) request.getAttribute("access_level") );
		map.put("id", (String) request.getAttribute("id"));
		map.put("god_people_name", (String) request.getAttribute("god_people_name"));
		
		mView.addObject("param", map);
		
		mView.setViewName("user/statistics");
		
		return mView;
	}
}
