package com.ukha.attend.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

public interface MainService {
	
	public GPIDto getUserBelongInfo(String id);
	
	public ChurchDto getChurchInfo(String code);
	
	public List<SellDto> getSellList(GPIDto dto, String f);
	
	public SellDto getSellInfo(String id, String sell, String part);
	
	public List<GPIDto> getSellPeopleList(String id, String sell, String part);
}
