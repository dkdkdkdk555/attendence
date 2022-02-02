package com.ukha.attend.login.dao;

import java.util.HashMap;
import java.util.List;

import com.ukha.attend.login.dto.GPIDto;

public interface UserDao {
	
	// 로그인체크
	public GPIDto getLogin(String id);

	// 비밀번호 오류횟수 +1
	public int incrementPwdFailNum(String id);
	
	// 교회코드 유효성 검사
	public String testChurchCode(String code);
	
	// 교인 검색
	public List<GPIDto> selectUser(GPIDto dto);
}
