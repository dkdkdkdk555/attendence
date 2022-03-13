package com.ukha.attend.main.dto;


public class AttendHistDto { // 출석기록 테이블 dto
//	`church_code` CHAR(10) NOT NULL,
	private String church_code;
//	`part_name` VARCHAR(50) NOT NULL,
	private String part_name;
//	`sell_name` VARCHAR(10) NOT NULL,
	private String sell_name;
//	`worship_date` DATE NOT NULL,
	private String worship_date;
//	`god_people_name` VARCHAR(10) NOT NULL,
	private String god_people_name;
//	`god_people_birthday` DATE NOT NULL,
	private String god_people_birthday;
//	`late_yn` CHAR(1) NULL DEFAULT NULL COMMENT '지각여부',
	private String late_yn;
	
	// db칼럼에는 존재하지 않지만 출석수정시 출석정보 값 구분위해 추가 1 
	private String attend_value;
	
	// db칼럼에는 존재하지 않지만 출석수정시 출석정보 값 구분위해 추가 1 
	private String recent_attend_value;
	
	// 출석표페이지에서 출석기록 가져오는 기간 
	private String start_date;
	private String end_date;	
	
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getRecent_attend_value() {
		return recent_attend_value;
	}
	public void setRecent_attend_value(String recent_attend_value) {
		this.recent_attend_value = recent_attend_value;
	}
	public String getAttend_value() {
		return attend_value;
	}
	public void setAttend_value(String attend_value) {
		this.attend_value = attend_value;
	}
	public String getChurch_code() {
		return church_code;
	}
	public void setChurch_code(String church_code) {
		this.church_code = church_code;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public String getSell_name() {
		return sell_name;
	}
	public void setSell_name(String sell_name) {
		this.sell_name = sell_name;
	}
	public String getWorship_date() {
		return worship_date;
	}
	public void setWorship_date(String worship_date) {
		this.worship_date = worship_date;
	}
	public String getGod_people_name() {
		return god_people_name;
	}
	public void setGod_people_name(String god_people_name) {
		this.god_people_name = god_people_name;
	}
	public String getGod_people_birthday() {
		return god_people_birthday;
	}
	public void setGod_people_birthday(String god_people_birthday) {
		this.god_people_birthday = god_people_birthday;
	}
	public String getLate_yn() {
		return late_yn;
	}
	public void setLate_yn(String late_yn) {
		this.late_yn = late_yn;
	}
	
	
}
