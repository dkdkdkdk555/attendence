package com.ukha.attend.user.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ukha.attend.login.dto.GPIDto;
import com.ukha.attend.main.dto.AttendHistDto;
import com.ukha.attend.main.dto.ChurchDto;
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

	@Override
	public ChurchDto getBadgeStandard(String code) {

		ChurchDto result = new ChurchDto();
		
		try {
			result = usrPrivateDao.getChurchStandard(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Map<String, String> calculateToStand(ChurchDto dto, GPIDto data) {
		
		String isNewPeople = "N";
		String isLongAbsent = "N";
		
		// 교회별 기준 추출
		int as = dto.getLongterm_absent_standard(); // 장기결석자 기준
		int ns = dto.getNewpp_term_standard(); // 새신자 기준
		
		System.out.println("장기결기준 :" + as);
		System.out.println("새신자기준 :" + ns);
		
		// 셀원의 기준과 비교할 데이터 추출
		String regDate = data.getNewpp_reg_date(); // 새신자 등록일
		String lastDate = data.getLast_attend_date(); // 마지막 출석일
		
		int nc = 0;
		int ac = 0;
		
		// 셀원의 데이터와 현재날짜 비교하여 새신자 등록일로 부터 몇주가 지났는지, 마지막 출석일로 부터 몇주가 지났는지 int값 계산
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
        if(regDate != null && lastDate != null){
        	Date today = new Date();
			Date regDay = new Date(sdf.parse(regDate).getTime());
			Date lastDay = new Date(sdf.parse(lastDate).getTime());
			
			long diff = today.getTime() - regDay.getTime();
			long diff2 = today.getTime() - lastDay.getTime();

	        TimeUnit time = TimeUnit.DAYS; 
	        
	        long diffrence = time.convert(diff, TimeUnit.MILLISECONDS);
	        long diffrence2 = time.convert(diff2, TimeUnit.MILLISECONDS);
	        
	        nc = (int) diffrence / 7;
	        ac = (int) diffrence2 / 7;
	        
	        System.out.println("교회등록한지 : "+ nc);
	        System.out.println("출석안한지 : " + ac);
        }
	        
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 계산한 값과 교회별 기준 비교
		if((nc < ns)&& regDate != null){
			isNewPeople = "Y";
		}
		
		if(ac > as){
			isLongAbsent = "Y";
		}
		// map객체에 담기
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("isNewPeople", isNewPeople);
		map.put("isLongAbsent", isLongAbsent);
		
		return map;
	}
	
	
	@Override
	public String getAttendHist(GPIDto dto) {
		
		String result = "";
		
		AttendHistDto attendHist = new AttendHistDto();
		
		try {
			attendHist = usrPrivateDao.getAttendHist(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(attendHist == null) {
			result = "secondary"; // 결석 (기록이 없음)
		} else{
			if("Y".equals(attendHist.getLate_yn())){
				result = "warning"; // 지각
			} else {
				result = "success"; // 출석
			}
		}
		
		return result;
	}

}
