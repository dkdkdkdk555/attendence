package com.ukha.attend.tableview.service;

import java.util.List;

import com.ukha.attend.main.dto.AttendHistDto;

public interface TableViewService {
	
	public List<AttendHistDto> getAttendHist(AttendHistDto dto);
}
