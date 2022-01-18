package com.ukha.attend;

import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@RequestMapping("/home.do")
	public ModelAndView home(ModelAndView mView) {
		
		String str = sqlSession.selectOne("testDao.testSelect");
		mView.addObject("str", str);
		mView.setViewName("home");
		
		return mView;
	}
	
}
