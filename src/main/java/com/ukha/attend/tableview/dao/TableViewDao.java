package com.ukha.attend.tableview.dao;

import java.util.List;

import com.ukha.attend.main.dto.AttendHistDto;

public interface TableViewDao {
	
	public List<AttendHistDto> selectSellAttendHist(AttendHistDto dto);
	
	public String selectSellAttendDate(AttendHistDto dto);
	
	public List<String> selectSellPPNameList(AttendHistDto dto);
}