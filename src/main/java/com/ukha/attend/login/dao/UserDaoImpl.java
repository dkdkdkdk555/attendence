package com.ukha.attend.login.dao;

import java.util.List;

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

	@Override
	public String testChurchCode(String code) {
		String result = session.selectOne("userDao.testChurchCode", code);
		return result;
	}

	@Override
	public List<GPIDto> selectUser(GPIDto dto) {
		
		List<GPIDto> result = session.selectList("userDao.selectUser", dto);
		
		return result;
	}

	@Override
	public String testDuplicateId(String id) {
		
		String result = session.selectOne("userDao.testDuplicateId", id);
		
		return result;
	}
	
	@Override
	public int signup(GPIDto dto) {
		
		int result = session.update("userDao.signup", dto);
		
		return result;
	}

}
