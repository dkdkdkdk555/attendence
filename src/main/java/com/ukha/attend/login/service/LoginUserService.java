package com.ukha.attend.login.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface LoginUserService {
	
	//로그인체크
	public String loginCheck(HttpServletRequest request);
}
