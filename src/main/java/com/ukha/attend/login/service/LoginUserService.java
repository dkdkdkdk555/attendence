package com.ukha.attend.login.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ukha.attend.login.dto.GPIDto;

public interface LoginUserService {
	
	//로그인체크
	public String loginCheck(HttpServletRequest request, HttpServletResponse response);
	
	//교인검색
	public List<GPIDto> searchUser(GPIDto dto);
	
	//교회코드테스트
	public String testChurchCode(String code);
	
	//아이디 중복검사
	public String testDuplicateId(String id);
	
	//회원가입
	public String signup(GPIDto dto);
}
