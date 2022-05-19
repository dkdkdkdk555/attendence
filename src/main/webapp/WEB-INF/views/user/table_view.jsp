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
		<i class="material-icons" id="back_btn" onclick="javascript:goToMain();">arrow_back_ios</i>
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
	
	<!-- hidden -->
	<input type="hidden" value="${dto.church_code }" id="church_code"/>
	<input type="hidden" value="${dto.part_name }" id="part_name"/>
	<input type="hidden" value="${dto.sell_name }" id="sell_name" />
	<input type="hidden" value="${auth}" id="auth" />
	<input type="hidden" value="${login_id }" id="login_id" />
	<input type="hidden" value="${login_user_name }" id="login_user_name" />
	
	<!-- 검색폼 -->
	<div class="date_picker_form">
		<!-- 년도 -->
		<select class="form-select" name="year" id="year_select" 
			style="width:20%; font-size: 27px; border:none; 
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
		<select class="form-select" name="month" id="month_select" 
			style="width:8%; font-size: 27px; border:none; 
			border-radius:none; -webkit-apparance:none;
			-moz-apparance:none; apparance:none;
			background:url(../) no-repeat 80% 50%; padding-right:0;
			margin-left:7px;" onchange="javascript:research();">
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
	<div class="view_table" style="background-color:#ffffff;border-top:5px solid #F0F5F5;">
		<table class="table" style="color:#606060;">
		  <thead>
		    <tr id="table_head">
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="name" items="${nameList }">
		  	<tr id="${name }">
		      <th scope="row">${name }</th>
		      <td id="${name }_1"></td>
		      <td id="${name }_2"></td>
		      <td id="${name }_3"></td>
		      <td id="${name }_4"></td>
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
			value="${hist.god_people_name }-${hist.worship_date}${hist.late_yn eq 'Y'?'-Y':''}">
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
		
		let churchCode = $('#church_code').val();
		let partName = $('#part_name').val();
		let sellName = $('#sell_name').val();
		let login_user_auth = $('#auth').val();
		let login_id = $('#login_id').val();
		let login_user_name = $('#login_user_name').val();
		
		//우선 모든 카테고리에 적용된 활성화 효과 지우기
		$('li').css('border-bottom', 'none').css('color', '#808080');
		//클릭한 자식요소 li의 아이디 가져오기
		let id = $(this).attr('id');
		console.log(id);
		//선택한 카테고리에 활성화 밑줄 효과 주기 
		$("#"+id).css('border-bottom', '2px solid #404040').css('color', '#404040');
		if(id != 'table_view'){ // 출석페이지(현페이지) 제외
			//페이지이동
			location.href = '${pageContext.request.contextPath }/user/' + id + '.do?church_code=' + churchCode 
					+ '&part_name=' + partName 
					+ '&sell_name=' + sellName
					+ '&access_level=' + login_user_auth
					+ '&id=' + login_id
					+ '&god_people_name=' + login_user_name;	
		}
	});
	
	$('#sbt').on('click',function(){
		showUserSearchDiv();
	});
	
	// 표 세팅 
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
		
		// 출석요일 
		let attDay =  $('#attDay').val();
		
		let startDate = year_s + '-' + mon_s + '-' + day_s;
		let endDate = year_e + '-' + mon_e + '-' + day_e;
				
		let start_date = new Date(startDate);
		let end_date = new Date(endDate);
		
		// 날짜 차이 구하기
		let cnt = end_date.getDate() - start_date.getDate();
		let dayCnt = cnt + 1;
		
		let index = 0;
		$('#table_head').append($('<th scope="col">셀원</th>'));
		// 월의 시작날짜 부터 끝날짜 까지 반복문 돌며 조회요일과 일치하는 날짜들 가져오기
		for(let i=1;i<=dayCnt;i++){
			
			let date;
			
			if(i<10){
				date = new Date(year_s + '-' + mon_s + '-' + '0' + i).getDay();
			}else{
				date = new Date(year_s + '-' + mon_s + '-' + i).getDay();	
			}
			let dayOfWeek = week[date];
			if(dayOfWeek == attDay){ // 출석일과 같은 날짜는 칼럼으로 추가해준다.
				index += 1;
				let j = '';
				if(i<10){
					j = '0' + i;
				} else {
					j = i;
				}
				$('#table_head').append($('<th scope="col" id="'+ index + '" class="'
						 + mon_s + '-' + j +'">'
						 + mon_s + '.' + j + '</th>'));
			} 
		}
		
		setAttData();
	}
	
	// 출석기록 세팅
	function setAttData(){
		
		let len = $('.hist').length; // 출석기록의 갯수
		
		for(let i=1;i<=len;i++){ // 반복문을 돌면서 가져옴
			let hist = $('#hist_'+i).val();
			let histArr = hist.split('-');
			// 셀원이름으로는 row를 찾고, 출석일자로는 col을 찾는다.
			let date = histArr[2] + '-' + histArr[3]; // 날짜
			let col_no = $('.' + date).attr('id'); // 몇번째 칼럼인지 알아낸다.
			// 출석표
			if(histArr[4] != 'Y'){
				$('#' + histArr[0] + '_' + col_no).css('display', 'table-cell');
				$('#' + histArr[0] + '_' + col_no).append(
						$('<span class="badge bg-success">출석</span>')		
					);
			} else {
				$('#' + histArr[0] + '_' + col_no).css('display', 'table-cell');
				$('#' + histArr[0] + '_' + col_no).append(
						$('<span class="badge bg-warning text-dark">지각</span>')
					);
			}
		}
	}
	
	// 날짜 조건으로 조회
	function research(){
		// 조회조건 가져오기
		let year = $('select[name=year] option:selected').val();
		let month = $('select[name=month] option:selected').val();
		let churchCode = $('#church_code').val();
		let partName = $('#part_name').val();
		let sellName = $('#sell_name').val();
		
		let startDate = year + month + '01';		
		let endDate = year + month + new Date(year, month, 0).getDate();
		
		$.ajax({
			url:"${pageContext.request.contextPath }/user/histResearch.do",
			method:"POST",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
			data:{
				church_code : churchCode,
				part_name : partName,
				sell_name : sellName,
				start_date : startDate,
				end_date : endDate
			}, 
			success:function(response) {
				/*
				 * 1. 날짜 세팅
				*/
				// 출석요일 #attDay는 바꿀 필요가 없고 start_date와 end_date는 값 안 받고 바로 바꿔주면됨
				$('#start_date').val(startDate);
				$('#end_date').val(endDate);
				// .prop으로 셀렉터 선택  
				let year = startDate.substr(0, 4);
				let month = startDate.substr(4, 2);
				$("#year_select").val(year).prop("selected", true);
				$("#month_select").val(month).prop("selected", true);
				
				/*
				 * 2. 출석기록 데이터 세팅
				*/
				// .hist 지우고
				$('.hist').remove();
				// 기존 출석기록 .badge 지우기
				$('.badge').remove();
				// 날짜 세팅된거 지우기
				$('th[scope="col"]').remove();
				// 출석기록 데이터 세팅
				let size = response.length;
				for(let i=0;i<size;i++){
					$('body').append($('<input type="hidden" class="hist" id="hist_' + (i+1)  + 
							'" value="' + response[i].god_people_name + 
							'-' + response[i].worship_date 
							+ (response[i].late_yn == "Y"?"-Y":"") + '">'));
				}
				
				/*
				 * 3. 출석표 세팅 -> 출석기록 매핑
				*/
				getAttendHistDate();
				
			}
		});
		
		
	}

	function getCurrentDate() {
		var date = new Date();
		var year = date.getFullYear().toString();

		var month = date.getMonth() + 1;
		month = month < 10 ? '0' + month.toString() : month.toString();

		var day = date.getDate();
		day = day < 10 ? '0' + day.toString() : day.toString();

		return year + month + day;
	}
	
	function goToMain(){ // 헤더에 백버튼 눌렀을때
    	
    	let id = $('#login_id').val();
    
    	location.href = "${pageContext.request.contextPath }/user/main.do?id=" + id ;
    	
    }
</script>
</html>