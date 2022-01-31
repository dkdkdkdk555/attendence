package com.ukha.attend.login.dto;

public class GPIDto {
//	`church_code` CHAR(10) NOT NULL,
//	`part_name` VARCHAR(50) NOT NULL,
//	`sell_name` VARCHAR(10) NULL DEFAULT NULL,
//	`access_level` VARCHAR(10) NULL DEFAULT NULL,
//	`god_people_name` VARCHAR(20) NOT NULL,
//	`address` VARCHAR(50) NULL DEFAULT NULL,
//	`birthday` DATE NOT NULL,
//	`last_attend_date` DATE NULL DEFAULT NULL COMMENT '마지막출석일',
//	`id` VARCHAR(20) NULL DEFAULT NULL,
	private String id;
//	`pw` VARCHAR(20) NULL DEFAULT NULL,
	private String pw;
//	`baptism_yn` CHAR(1) NULL DEFAULT NULL COMMENT '세례여부',
//	`cell_no` VARCHAR(20) NULL DEFAULT NULL,
//	`create_nm` VARCHAR(20) NOT NULL,
//	`create_date` DATE NOT NULL,
//	`update_nm` VARCHAR(20) NOT NULL,
//	`update_date` DATE NOT NULL,
//	`newpp_reg_date` DATE NULL DEFAULT NULL COMMENT '새신자등록일',
//	`volun_part_code` VARCHAR(20) NULL DEFAULT NULL COMMENT '봉사부서코드',
//	`volun_part_sell` VARCHAR(20) NULL DEFAULT NULL COMMENT '봉사부서셀 또는 역할',
//	`img_path` VARCHAR(40) NULL DEFAULT NULL COMMENT '교인사진경로',
//	`parent_m` VARCHAR(20) NULL DEFAULT NULL COMMENT '어머니 이름',
//	`parent_f` VARCHAR(20) NULL DEFAULT NULL COMMENT '아버지 이름',
//	`prayer_topic` VARCHAR(60) NULL DEFAULT NULL COMMENT '기도제목',
//	`etc` VARCHAR(40) NULL DEFAULT NULL COMMENT '비고',
//	`pwd_fail_num` SMALLINT(1) UNSIGNED ZEROFILL NOT NULL DEFAULT '0' COMMENT '비밀번호오류횟수',
	private int pwd_fail_num;
	
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

	public int getPwd_fail_num() {
		return pwd_fail_num;
	}

	public void setPwd_fail_num(int pwd_fail_num) {
		this.pwd_fail_num = pwd_fail_num;
	}
	
	
}