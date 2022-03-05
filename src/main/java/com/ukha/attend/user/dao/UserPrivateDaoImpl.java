package com.ukha.attend.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.login.dto.GPIDto;
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

}
