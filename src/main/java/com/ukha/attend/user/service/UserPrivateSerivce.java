package com.ukha.attend.user.service;

import com.ukha.attend.login.dto.GPIDto;

public interface UserPrivateSerivce {
	
	// 셀원정보페이지 셀원데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);

}
