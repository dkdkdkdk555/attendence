package com.ukha.attend.tableview.service;

import java.util.List;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;

public interface TableViewService {
	
	public List<AttendHistDto> getAttendHist(AttendHistDto dto);
	
	public AttendHistDto calTodayMonth();
	
	public String getAttendDay(AttendHistDto dto);
	
	public List<GPIDto> getSellPPNameList(AttendHistDto dto);
}
