package com.ukha.attend.tableview.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.tableview.dao.TableViewDao;

@Service
public class TableViewServiceImpl implements TableViewService {
	
	@Autowired
	private TableViewDao tableViewDao;

	@Override
	public List<AttendHistDto> getAttendHist(AttendHistDto dto) {
		
		// 기간 조건 전달
		String sd = dto.getStart_date();
		System.out.println("@#@##@ : " + sd);
		if(sd == null || sd == ""){ // 전달된 기간이 없다면 이번달을 계산
			AttendHistDto ahd = calTodayMonth();
			dto.setStart_date(ahd.getStart_date());
			dto.setEnd_date(ahd.getEnd_date());
		}
		
		List<AttendHistDto> list = new ArrayList<AttendHistDto>();
		try {
			list = tableViewDao.selectSellAttendHist(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public AttendHistDto calTodayMonth(){
		
		SimpleDateFormat yearFmt = new SimpleDateFormat("yyyy");
		SimpleDateFormat monthFmt = new SimpleDateFormat("MM");
		
		Date today = new Date();
		String year = yearFmt.format(today); // 년도
		String month = monthFmt.format(today); // 월
		int y = Integer.parseInt(year);
		int m = Integer.parseInt(month);
		
		Calendar cal = Calendar.getInstance();
		cal.set(y, m-1, 1);
		int d = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		String start_date = year + month + "01";
		String end_date = year + month + d;
		
		AttendHistDto val = new AttendHistDto();
		val.setStart_date(start_date);
		val.setEnd_date(end_date);
		
		return val;
	}

	@Override
	public String getAttendDay(AttendHistDto dto) {
		
		String result = "";
		try {
			result = tableViewDao.selectSellAttendDate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public List<String> getSellPPNameList(AttendHistDto dto) {

		List<String> list = new ArrayList<String>();
		
		try {
			list = tableViewDao.selectSellPPNameList(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
