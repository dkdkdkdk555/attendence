package com.ukha.attend.user.service;

import java.util.Map;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;

public interface UserPrivateSerivce {
	
	// 셀원정보페이지 셀원데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);
	// 교회정보의 새신자기준 및 장기결석자 기준 가져오기
	public ChurchDto getBadgeStandard(String code);
	// 새신자이거나 장기결석자인지 계산
	public Map<String, String> calculateToStand(ChurchDto dto, GPIDto data);
	// 최근출석이력 가져오기
	public String getAttendHist(GPIDto dto); 
	// 출석유형 분기 - 결석
	public String secondaryLogic(AttendHistDto dto);
	// 출석유형 분기 - 지각
	public String warningLogic(AttendHistDto dto);
	// 출석유형 분기 - 출석
	public String successLogic(AttendHistDto dto);
	// 셀원정보 수정
	public int updateSellPPInfo(GPIDto dto);
}
