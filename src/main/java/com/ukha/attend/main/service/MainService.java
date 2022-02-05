package com.ukha.attend.main.service;

import java.util.List;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

public interface MainService {
	
	public GPIDto getUserBelongInfo(String id);
	
	public ChurchDto getChurchInfo(String code);
	
	public List<SellDto> getSellList(GPIDto dto, String f);
}
