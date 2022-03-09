package com.ukha.attend.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;

@Repository
public class UserPrivateDaoImpl implements UserPrivateDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public GPIDto getSellPeoplePrivateData(GPIDto dto) {
		return session.selectOne("userPrivateDao.getSellPeoplePrivateData", dto);
	}

	@Override
	public ChurchDto getChurchStandard(String code) {
		return session.selectOne("userPrivateDao.getChurchInfoStandard", code);
	}
	
	@Override
	public AttendHistDto getAttendHist(GPIDto dto) {
		// 한부서에 한날에 출석은 한번밖에 못하므로 단일행만 가져온다.
		return session.selectOne("userPrivateDao.getAttendHist", dto);
	}

	@Override
	public int deleteAttendHist(AttendHistDto dto) {
		return session.delete("userPrivateDao.deleteAttendHistRow", dto);
	}

	@Override
	public int insertAttendHist(AttendHistDto dto) {
		return session.insert("userPrivateDao.insertAttendHistRow", dto);
	}

	@Override
	public int updateAttendHist(AttendHistDto dto) {
		return session.update("userPrivateDao.updateAttendHistRow", dto);
	}

	@Override
	public int updateSellPPInfo(GPIDto dto) {
		return session.update("userPrivateDao.updateSellPeopleInfo", dto);
	}
}
