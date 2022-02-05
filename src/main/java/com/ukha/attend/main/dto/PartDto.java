package com.ukha.attend.main.dto;

public class PartDto {
//	`church_code` CHAR(10) NOT NULL,
	private String church_code;
//	`church_name` VARCHAR(50) NOT NULL,
	private String church_name;
//	`part_name` VARCHAR(10) NOT NULL COMMENT '부서이름',
	private String part_name;
//	`part_img_path` VARCHAR(40) NULL DEFAULT NULL COMMENT '부서이미지경로',
	private String part_img_path;
	
	public String getChurch_code() {
		return church_code;
	}
	public void setChurch_code(String church_code) {
		this.church_code = church_code;
	}
	public String getChurch_name() {
		return church_name;
	}
	public void setChurch_name(String church_name) {
		this.church_name = church_name;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public String getPart_img_path() {
		return part_img_path;
	}
	public void setPart_img_path(String part_img_path) {
		this.part_img_path = part_img_path;
	}
	
	
}
