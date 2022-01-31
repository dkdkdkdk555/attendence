package com.ukha.attend.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.login.dto.GPIDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public GPIDto getLogin(String inputId) {
		
		GPIDto user = new GPIDto();
		
		try {
			user = session.selectOne("userDao.loginSelect", inputId);
			System.out.println(user.getPw());
		} catch (NullPointerException e) {
			return null;
		}
		
		return user;
	}

	@Override
	public int incrementPwdFailNum(String inputId) {
		
		int n = session.update("userDao.incrementPwdFailNum", inputId);

		return n;
	}

}
