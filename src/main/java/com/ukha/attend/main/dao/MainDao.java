package com.ukha.attend.main.dao;

import java.util.List;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

public interface MainDao {
	
	public GPIDto getUserBelongInfo(String id);
	
	public ChurchDto getChurchInfo(String code);
	
	public List<SellDto> getSellList(GPIDto dto);
	
	public List<SellDto> getVolunSellList(GPIDto dto);
}
