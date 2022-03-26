<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/userCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/table_view.css">
<title>table_view.do</title>
</head>
<body>	
	<div class="main_header">
		<h5 id="main_text">셀 관리</h5>
		<i class="material-icons" id="personal_btn">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>
	<div class="menu">
		<nav class="menu_nav">
			<li class="menu_li" id="attend">출석체크</li>
			<li class="menu_li" id="management">사역관리</li>
			<li class="menu_li" id="statistics">통계</li>
			<li class="menu_li" id="table_view">출결표</li>
		</nav>	
	</div>
	
	<!-- 검색폼 -->
	<div class="date_picker_form">
		<!-- 년도 -->
		<select class="form-select" id="year_select" 
			style="width:20%; font-size: 30px; border:none; 
			border-radius:none; -webkit-apparance:none;
			-moz-apparance:none; apparance:none;
			background:url(../) no-repeat 80% 50%; padding-right:0;
			margin-left:7px;">
		  <option value="2022">2022</option>
		  <option value="2023">2023</option>
		  <option value="2024">2024</option>
		  <option value="2025">2025</option>
		</select>
		<p class="labl">년</p>
		<!-- 월 -->
		<select class="form-select" id="month_select" 
			style="width:8%; font-size: 30px; border:none; 
			border-radius:none; -webkit-apparance:none;
			-moz-apparance:none; apparance:none;
			background:url(../) no-repeat 80% 50%; padding-right:0;
			margin-left:7px;">
		  <option value="01">1</option>
		  <option value="02">2</option>
		  <option value="03">3</option>
		  <option value="04">4</option>
		  <option value="05">5</option>
		  <option value="06">6</option>
		  <option value="07">7</option>
		  <option value="08">8</option>
		  <option value="09">9</option>
		  <option value="10">10</option>
		  <option value="11">11</option>
		  <option value="12">12</option>
		</select>
		<p class="labl">월</p>
	</div>
	<input type="hidden" value="${AttDay }" id="attDay">
	<input type="hidden" value="${month.start_date }" id="start_date">
	<input type="hidden" value="${month.end_date }" id="end_date">
	
	<!-- 출결표 -->
	<div class="view_table">
		<table class="table">
		  <thead>
		    <tr id="table_head">
		      <th scope="col">셀원</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="name" items="${nameList }">
		  	<tr id="${name }">
		      <th scope="row">${name }</th>
		      <td style="display:none" id="${name }_1"></td>
		      <td style="display:none" id="${name }_2"></td>
		      <td style="display:none" id="${name }_3"></td>
		      <td style="display:none" id="${name }_4"></td>
		      <td style="display:none" id="${name }_5"></td>
		      <td style="display:none" id="${name }_6"></td>
		    </tr>
		  </c:forEach>
		  </tbody>
		</table>
	</div>
	
	<!-- 출석데이터 -->
	<c:forEach var="hist"  varStatus="status" items="${HistList }">
		<input type="hidden" class="hist" id="hist_${status.index + 1 }" 
			value="${hist.god_people_name }-${hist.worship_date}${hist.late_yn eq "Y"?"-Y":""}">
	</c:forEach>
	

<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	$(document).ready(function(){
		$("#table_view").trigger("click");//트리거로 강제 클릭
		// 조회조건에 처음 화면 로드시 조회조건이 들어가도록
		let currDate = getCurrentDate();
		let year = currDate.substr(0, 4);
		let month = currDate.substr(4, 2);
		$("#year_select").val(year).prop("selected", true);
		$("#month_select").val(month).prop("selected", true);
		getAttendHistDate();
	});
	
	//상단탭선택
	$(".menu_nav").children("li").on("click", function(){
		//우선 모든 카테고리에 적용된 활성화 효과 지우기
		$('li').css('border-bottom', 'none').css('color', '#808080');
		//클릭한 자식요소 li의 아이디 가져오기
		let id = $(this).attr('id');
		console.log(id);
		//선택한 카테고리에 활성화 밑줄 효과 주기 
		$("#"+id).css('border-bottom', '2px solid #404040').css('color', '#404040');
	});
	
	$('#sbt').on('click',function(){
		showUserSearchDiv();
	});
	
	function getAttendHistDate(){
		
		let week = ['일', '월', '화', '수', '목', '금', '토'];
		
		// 월의 시작과 끝날짜 가져오기
		let start = $('#start_date').val();
		let year_s = start.substr(0,4); // 시작일 년
		let mon_s = start.substr(4,2); // 시작일 월
		let day_s = start.substr(6,2); // 시작일 일
		let end = $('#end_date').val(); 
		let year_e = end.substr(0,4); // 마지막일 년
		let mon_e = end.substr(4,2); // 마지막일 월
		let day_e = end.substr(6,2); // 마지막일 일
		
		// 출석일 
		let attDay =  $('#attDay').val();
		
		let startDate = year_s + '-' + mon_s + '-' + day_s;
		let endDate = year_e + '-' + mon_e + '-' + day_e;
		
		let start_date = new Date(startDate);
		let end_date = new Date(endDate);
		// 날짜 차이 구하기
		let cnt = end_date.getDate() - start_date.getDate();
		let dayCnt = cnt + 1;
		
		let index = 0;
		// 월의 시작날짜 부터 끝날짜 까지 반복문 돌며 조회요일과 일치하는 날짜들 가져오기
		for(let i=1;i<=dayCnt;i++){
			let date = new Date(year_s + '-' + mon_s + '-' + i).getDay();
			let dayOfWeek = week[date];
			if(dayOfWeek == attDay){ // 출석일과 같은 날짜는 칼럼으로 추가해준다.
				index += 1;
				let j = '';
				if(i<10){
					j = '0' + i;
				} else {
					j = i;
				}
				$('#table_head').append($('<th scope="col" id="'+ index + '">' + 
						 mon_s + '.' + j + '</th>'));
			} 
		}
		
		setAttData();
	}
	
	// 출석 기록을 세팅해주는 메소드
	function setAttData(){
		let histList =
		console.log(histList);
	}
	
	
	
    function getCurrentDate()
    {
        var date = new Date();
        var year = date.getFullYear().toString();

        var month = date.getMonth() + 1;
        month = month < 10 ? '0' + month.toString() : month.toString();

        var day = date.getDate();
        day = day < 10 ? '0' + day.toString() : day.toString();

        return year + month + day ;
    }
</script>
</html>