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
