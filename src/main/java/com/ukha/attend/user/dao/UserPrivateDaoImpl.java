package com.ukha.attend.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.login.dto.GPIDto;

@Repository
public class UserPrivateDaoImpl implements UserPrivateDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public GPIDto getSellPeoplePrivateData(GPIDto dto) {
		return session.selectOne("userPrivateDao.getSellPeoplePrivateData", dto);
	}

}
