package com.ukha.attend.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.user.dao.UserPrivateDao;

@Service
public class UserPrivateServiceImpl implements UserPrivateSerivce{

	@Autowired
	private UserPrivateDao usrPrivateDao;
	
	@Override
	public GPIDto getSellPeoplePrivateData(GPIDto dto) {
		
		GPIDto result = new GPIDto();
		
		try {
			result = usrPrivateDao.getSellPeoplePrivateData(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
