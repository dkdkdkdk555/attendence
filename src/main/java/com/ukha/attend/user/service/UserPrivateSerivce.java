package com.ukha.attend.user.service;

import java.util.Map;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;

public interface UserPrivateSerivce {
	
	// 셀원정보페이지 셀원데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);
	// 교회정보의 새신자기준 및 장기결석자 기준 가져오기
	public ChurchDto getBadgeStandard(String code);
	// 새신자이거나 장기결석자인지 계산
	public Map<String, String> calculateToStand(ChurchDto dto, GPIDto data);
}
