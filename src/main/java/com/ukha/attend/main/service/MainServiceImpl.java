package com.ukha.attend.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dao.MainDao;
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
}
