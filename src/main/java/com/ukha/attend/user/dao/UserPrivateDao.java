package com.ukha.attend.user.dao;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;

public interface UserPrivateDao {
	
	// 셀원정보페이지 데이터 가져오기
	public GPIDto getSellPeoplePrivateData(GPIDto dto);
	// 교회정보에서 장기결석기준 및 새신자기준 가져오기
	public ChurchDto getChurchStandard(String code);
	// 출석기록 가져오기
	public AttendHistDto getAttendHist(GPIDto dto);
	// 셀원출결수정 - 결석처리
	public int deleteAttendHist(AttendHistDto dto);
	// 셀원출결수정 - 지각 또는 출석처리 (데이터 생성)
	public int insertAttendHist(AttendHistDto dto);
	// 셀원출결수정 - 지각 또는 출석처리 (데이터 수정)
	public int updateAttendHist(AttendHistDto dto);
	// 셀원 정보 수정
	public int updateSellPPInfo(GPIDto dto);
}
