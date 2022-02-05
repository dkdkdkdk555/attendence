package com.ukha.attend.main.dto;

public class ChurchDto {
//	`church_name` VARCHAR(50) NOT NULL,
	private String church_name;
//	`church_code` CHAR(10) NOT NULL,
	private String church_code;
//	`loc_cd` VARCHAR(10) NULL DEFAULT NULL COMMENT '지역번호',
//	`church_address` VARCHAR(50) NOT NULL,
//	`denomination` VARCHAR(10) NULL DEFAULT NULL COMMENT '교단',
//	`church_scale` VARCHAR(10) NULL DEFAULT NULL,
//	`longterm_absent_standard` SMALLINT(6) NOT NULL COMMENT '장기결석기준횟수',
	private int longterm_absent_standard;
//	`newpp_term_standard` SMALLINT(6) NOT NULL COMMENT '새신자기준횟수',
	private int newpp_term_standard;
//	`church_img_path` VARCHAR(20) NULL DEFAULT NULL,
	private String church_img_path;
	
	public String getChurch_name() {
		return church_name;
	}
	public void setChurch_name(String church_name) {
		this.church_name = church_name;
	}
	public String getChurch_code() {
		return church_code;
	}
	public void setChurch_code(String church_code) {
		this.church_code = church_code;
	}
	public int getLongterm_absent_standard() {
		return longterm_absent_standard;
	}
	public void setLongterm_absent_standard(int longterm_absent_standard) {
		this.longterm_absent_standard = longterm_absent_standard;
	}
	public int getNewpp_term_standard() {
		return newpp_term_standard;
	}
	public void setNewpp_term_standard(int newpp_term_standard) {
		this.newpp_term_standard = newpp_term_standard;
	}
	public String getChurch_img_path() {
		return church_img_path;
	}
	public void setChurch_img_path(String church_img_path) {
		this.church_img_path = church_img_path;
	}
}
