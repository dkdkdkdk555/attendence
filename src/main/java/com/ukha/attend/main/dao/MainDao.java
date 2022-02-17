package com.ukha.attend.main.dao;

import java.util.List;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

public interface MainDao {
	//메인페이지 - 소속정보 및 권한
	public GPIDto getUserBelongInfo(String id);
	//메인페이지 - 교회정보 
	public ChurchDto getChurchInfo(String code);
	//메인페이지 - 셀목록
	public List<SellDto> getSellList(GPIDto dto);
	//메인페이지 - 봉사셀목록
	public List<SellDto> getVolunSellList(GPIDto dto);
	//출석페이지 - 셀정보
	public SellDto getSellInfo(String id, String sell, String part);
	//출석페이지 - 셀원목록
	public List<GPIDto> getSellPeopleList(String id, String sell, String part);
	//출석페이지 - 교인검색
	public List<GPIDto> selectUser(GPIDto dto);
	//출석페이지 - 셀원추가
	public int addSellPeople(GPIDto dto);
	//출석페이지 - 로그인유저정보
	public String loginUserInfo(String id);

}