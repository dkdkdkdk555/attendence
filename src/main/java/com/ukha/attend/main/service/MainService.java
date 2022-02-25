package com.ukha.attend.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

public interface MainService {
	//메인페이지 - 소속정보 및 권한
	public GPIDto getUserBelongInfo(String id);
	//메인페이지 - 교회정보 
	public ChurchDto getChurchInfo(String code);
	//메인페이지 - 셀목록
	public List<SellDto> getSellList(GPIDto dto, String f);
	//출석페이지 - 셀정보
	public SellDto getSellInfo(String id, String sell, String part);
	//출석페이지 - 셀원목록
	public List<GPIDto> getSellPeopleList(String id, String sell, String part);
	//출석페이지 - 교인검색
	public List<GPIDto> searchUser(GPIDto dto);
	//출석페이지 - 셀원추가
	public String addSellPeople(GPIDto dto);
	//출석페이지 - 로그인 유저의 정보
	public String loginUserInfo(String id);
	//출석페이지 - 중복검사
	public int examDuplAttend(AttendHistDto dto);
}
