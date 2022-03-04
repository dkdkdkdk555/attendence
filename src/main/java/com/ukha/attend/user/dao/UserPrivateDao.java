package com.ukha.attend.user.dao;

import com.ukha.attend.login.dto.GPIDto;

public interface UserPrivateDao {
	
	// 셀원정보페이지 데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);
}
