package com.ukha.attend.login.dao;

import java.util.HashMap;

import com.ukha.attend.login.dto.GPIDto;

public interface UserDao {
	
	// 로그인체크
	public GPIDto getLogin(String id);

	// 비밀번호 오류횟수 +1
	public int incrementPwdFailNum(String id);
}
