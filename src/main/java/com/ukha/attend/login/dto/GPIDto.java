package com.ukha.attend.login.dto;

// 교인정보테이블 데이터전달객체
public class GPIDto {
//	`church_code` CHAR(10) NOT NULL,
	private String church_code;
//	`part_name` VARCHAR(50) NOT NULL,
	private String part_name;
//	`sell_name` VARCHAR(10) NULL DEFAULT NULL,
	private String sell_name;
//	`access_level` VARCHAR(10) NULL DEFAULT NULL,
	private String access_level;
//	`god_people_name` VARCHAR(20) NOT NULL,
	private String god_people_name;
//	`address` VARCHAR(50) NULL DEFAULT NULL,
	private String address;
//	`birthday` DATE NOT NULL,
	private String birthday;
//	`last_attend_date` DATE NULL DEFAULT NULL COMMENT '마지막출석일',
	private String last_attend_date;
//	`id` VARCHAR(20) NULL DEFAULT NULL,
	private String id;
//	`pw` VARCHAR(20) NULL DEFAULT NULL,
	private String pw;
//	`baptism_yn` CHAR(1) NULL DEFAULT NULL COMMENT '세례여부',
	private boolean baptism_yn;
//	`cell_no` VARCHAR(20) NULL DEFAULT NULL,
	private String cell_no;
//	`create_nm` VARCHAR(20) NOT NULL,
	private String create_nm;
//	`create_date` DATE NOT NULL,
	private String create_date;
//	`update_nm` VARCHAR(20) NOT NULL,
	private String update_nm;
//	`update_date` DATE NOT NULL,
	private String update_date;
//	`newpp_reg_date` DATE NULL DEFAULT NULL COMMENT '새신자등록일',
	private String newpp_reg_date;
//	`volun_part_code` VARCHAR(20) NULL DEFAULT NULL COMMENT '봉사부서코드',
	private String volun_part_code;
//	`volun_part_sell` VARCHAR(20) NULL DEFAULT NULL COMMENT '봉사부서셀 또는 역할',
	private String volun_part_sell;
//	`img_path` VARCHAR(40) NULL DEFAULT NULL COMMENT '교인사진경로',
	private String img_path;
//	`parent_m` VARCHAR(20) NULL DEFAULT NULL COMMENT '어머니 이름',
	private String parent_m;
//	`parent_f` VARCHAR(20) NULL DEFAULT NULL COMMENT '아버지 이름',
	private String parent_f;
//	`prayer_topic` VARCHAR(60) NULL DEFAULT NULL COMMENT '기도제목',
	private String prayer_topic;
//	`etc` VARCHAR(40) NULL DEFAULT NULL COMMENT '비고',
	private String etc;
//	`pwd_fail_num` SMALLINT(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0' COMMENT '비밀번호오류횟수',
	private int pwd_fail_num;
	
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
	public String getAccess_level() {
		return access_level;
	}
	public void setAccess_level(String access_level) {
		this.access_level = access_level;
	}
	public String getGod_people_name() {
		return god_people_name;
	}
	public void setGod_people_name(String god_people_name) {
		this.god_people_name = god_people_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getLast_attend_date() {
		return last_attend_date;
	}
	public void setLast_attend_date(String last_attend_date) {
		this.last_attend_date = last_attend_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public boolean isBaptism_yn() {
		return baptism_yn;
	}
	public void setBaptism_yn(boolean baptism_yn) {
		this.baptism_yn = baptism_yn;
	}
	public String getCell_no() {
		return cell_no;
	}
	public void setCell_no(String cell_no) {
		this.cell_no = cell_no;
	}
	public String getCreate_nm() {
		return create_nm;
	}
	public void setCreate_nm(String create_nm) {
		this.create_nm = create_nm;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_nm() {
		return update_nm;
	}
	public void setUpdate_nm(String update_nm) {
		this.update_nm = update_nm;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getNewpp_reg_date() {
		return newpp_reg_date;
	}
	public void setNewpp_reg_date(String newpp_reg_date) {
		this.newpp_reg_date = newpp_reg_date;
	}
	public String getVolun_part_code() {
		return volun_part_code;
	}
	public void setVolun_part_code(String volun_part_code) {
		this.volun_part_code = volun_part_code;
	}
	public String getVolun_part_sell() {
		return volun_part_sell;
	}
	public void setVolun_part_sell(String volun_part_sell) {
		this.volun_part_sell = volun_part_sell;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getParent_m() {
		return parent_m;
	}
	public void setParent_m(String parent_m) {
		this.parent_m = parent_m;
	}
	public String getParent_f() {
		return parent_f;
	}
	public void setParent_f(String parent_f) {
		this.parent_f = parent_f;
	}
	public String getPrayer_topic() {
		return prayer_topic;
	}
	public void setPrayer_topic(String prayer_topic) {
		this.prayer_topic = prayer_topic;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getPwd_fail_num() {
		return pwd_fail_num;
	}
	public void setPwd_fail_num(int pwd_fail_num) {
		this.pwd_fail_num = pwd_fail_num;
	}
	
}