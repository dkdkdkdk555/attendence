package com.ukha.attend.main.dto;

public class SellDto {
//	`church_code` CHAR(10) NOT NULL,
	private String church_code;
//	`church_name` VARCHAR(50) NOT NULL,
	private String church_name;
//	`part_name` VARCHAR(50) NOT NULL,
	private String part_name;
//	`sell_img_path` VARCHAR(40) NULL DEFAULT NULL,
	private String sell_img_path;
//	`sell_name` VARCHAR(10) NOT NULL COMMENT '셀이름',
	private String sell_name;
//	`sell_leader_name` VARCHAR(8) NOT NULL COMMENT '셀장이름',
	private String sell_leader_name;
//	`sell_leader_birthday` DATE NOT NULL,
	private String sell_leader_birthday;
	
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
	public String getSell_img_path() {
		return sell_img_path;
	}
	public void setSell_img_path(String sell_img_path) {
		this.sell_img_path = sell_img_path;
	}
	public String getSell_name() {
		return sell_name;
	}
	public void setSell_name(String sell_name) {
		this.sell_name = sell_name;
	}
	public String getSell_leader_name() {
		return sell_leader_name;
	}
	public void setSell_leader_name(String sell_leader_name) {
		this.sell_leader_name = sell_leader_name;
	}
	public String getSell_leader_birthday() {
		return sell_leader_birthday;
	}
	public void setSell_leader_birthday(String sell_leader_birthday) {
		this.sell_leader_birthday = sell_leader_birthday;
	}
	
	
}
