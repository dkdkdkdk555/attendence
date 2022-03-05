package com.ukha.attend.user.dao;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;

public interface UserPrivateDao {
	
	// 셀원정보페이지 데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);
	
	// 교회정보에서 장기결석기준 및 새신자기준 가져오기
	public ChurchDto getChurchStandard(String code);
}
