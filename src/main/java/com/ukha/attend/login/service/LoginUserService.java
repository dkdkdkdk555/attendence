package com.ukha.attend.login.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LoginUserService {
	
	//로그인체크
	public String loginCheck(HttpServletRequest request, HttpServletResponse response);
}
