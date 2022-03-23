package com.ukha.attend.tableview.dao;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.main.dto.AttendHistDto;

@Repository
public class TableViewDaoImpl implements TableViewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AttendHistDto> selectSellAttendHist(AttendHistDto dto) {
		return session.selectList("tableViewDao.getSellAttendHist", dto);
	}

	@Override
	public String selectSellAttendDate(AttendHistDto dto) {
		return session.selectOne("tableViewDao.getSellAttendDate", dto);
	}

	@Override
	public List<String> selectSellPPNameList(AttendHistDto dto) {
		return session.selectList("tableViewDao.getSellPPList", dto);
	}
	

}
