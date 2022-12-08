package com.ukha.attend.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dao.MainDao;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDao maindao;

	@Override
	public GPIDto getUserBelongInfo(String id) {
		return maindao.getUserBelongInfo(id);
	}
	
	@Override
	public ChurchDto getChurchInfo(String code) {
		return maindao.getChurchInfo(code);
	}
	
	@Override
	public List<SellDto> getSellList(GPIDto dto, String f) {
		
		List<SellDto> result = null;
		
		if(f.equals("origin")){ // 소속부서 셀렉트
			result = maindao.getSellList(dto);
		} else { // 봉사부서 셀렉트 
			result = maindao.getVolunSellList(dto);
		}
		
		return result;
	}
	
	@Override
	public SellDto getSellInfo(String id, String sell, String part) {
		
		SellDto sellDto = maindao.getSellInfo(id, sell, part);
		
		return sellDto;
	}
	
	@Override
	public List<GPIDto> getSellPeopleList(String id, String sell, String part) {
		
		List<GPIDto> gpiDto = maindao.getSellPeopleList(id, sell, part);

		return gpiDto;
	}

	@Override
	public List<GPIDto> searchUser(GPIDto dto) {

		List<GPIDto> result = maindao.selectUser(dto);
		
		return result;
	}
	
	@Override
	public String addSellPeople(GPIDto dto) {
		
		String result = "";

		int n = maindao.addSellPeople(dto);
		
		if(n > 0){
			result = "SUCCESS"; 
		} else {
			result = "FAIL";
		}
		
		System.out.println(result);
		
		return result;
	}
	
	@Override
	public String loginUserInfo(String id) {
		
		return maindao.loginUserInfo(id);
	}
	
	@Override
	public int examDuplAttend(AttendHistDto dto) {
		return maindao.examDupliAttend(dto);
	}
	
	@Override
	public int insertAttendHist(List<AttendHistDto> list) {
		
		int result = 0;
		for( AttendHistDto dto :  list ){
			result += maindao.insertAttendHist(dto);
		}
		
		return result;
	}

	@Override
	public int updateLastAttend(GPIDto dto) {
		
		int result = 0;
		try {
			result = maindao.updateLastAttend(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public String insertNewPeople(GPIDto dto) {
		String result = "";

		int n = maindao.insertNewPeople(dto);
		
		if(n > 0){
			result = "SUCCESS"; 
		} else {
			result = "FAIL";
		}
		
		System.out.println(result);
		
		return result;
	}
}
