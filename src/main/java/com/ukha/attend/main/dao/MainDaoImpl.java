package com.ukha.attend.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.ChurchDto;
import com.ukha.attend.main.dto.SellDto;

@Repository
public class MainDaoImpl implements MainDao{

	
	@Autowired
	private SqlSession session;
	
	@Override
	public GPIDto getUserBelongInfo(String id) {
		
		GPIDto result = session.selectOne("mainDao.getUserBelongInfo", id);
		
		return result;
	}
	
	@Override
	public ChurchDto getChurchInfo(String code) {
		return session.selectOne("mainDao.getChurchInfo", code);
	}
	
	@Override
	public List<SellDto> getSellList(GPIDto dto) {
		return session.selectList("mainDao.getSellList", dto);
	}
	
	@Override
	public List<SellDto> getVolunSellList(GPIDto dto) {
		return session.selectList("mainDao.getVolunSellList", dto);
	}
}
