<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<!-- <meta name="viewport" content="width=device-width, initial-scale=0.07, maximum-scale=5.0, user-scalable=0" /> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/userCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/attend.css">
<title>attend.do</title>
</head>
<body>

	<!-- hidden -->
	<input type="hidden" value="${sellInfo.church_code }" id="church_code"/>
	<input type="hidden" value="${sellInfo.part_name }" id="part_name"/>
	<input type="hidden" value="${auth }" id="login_user_auth"/>
	<input type="hidden" value="${login_user_name }" id="login_user_name"/>
	<input type="hidden" value="${sellInfo.att_day_of_week }" id="att_day"/><!-- 셀의 출석 요일 -->
	<input type="hidden" value="${login_id }" id="login_id"/>
	
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
	
	<!-- 출석기능시 사용하는 스피너  -->
	<div class="back-drop">
		<img src="../../resources/svg/spinner.png" />
	</div>
	
	<!-- 셀 설명 섹션 -->
	<div class="sell_info_container">
		<c:choose>
			<c:when test="${not empty sellInfo.sell_img_path }">
				<img src="" alt="" /> <!-- 아직 파일 올리는 경로 모름-->
			</c:when>
			<c:otherwise>
				<img alt="" src="../../resources/svg/reunion.png">
			</c:otherwise>
		</c:choose>
		<div id="sell_comment">
			<h4>${sellInfo.sell_name }</h4>
			<p id="sell_leader_name">${sellInfo.sell_leader_name }</p>
		</div>	
	</div>
	<!-- 셀원목록 섹션 -->
	<div class="people_list">
		<div class="list_head">
			<p>셀원</p>
			<p id="list_head_text">출석하기</p>		
		</div>
		<div class="list_body">
		<c:forEach items="${peopleList }" varStatus="status" var="tmp">
			<div class="people" id="people${status.index }">
			<c:choose>
				<c:when test="${not empty tmp.img_path }">
				<img src="" alt="" class="sellPeopleImg"/><!-- 이미지 있으면 -->
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${tmp.gender eq 'M'}">
						<img alt="" class="sellPeopleImg" src="../../resources/svg/man.png">
						</c:when>
						<c:otherwise>
						<img alt="" class="sellPeopleImg" src="../../resources/svg/woman.png">
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
				<p>${tmp.god_people_name }</p>
				<input type="hidden" value="${tmp.birthday }"/>
				<div class="buttons">
					<button type="button" class="btn btn-outline-secondary">✖ ️</button><!-- 결석 -->
					<button type="button" class="btn btn-outline-warning">△</button><!-- 지각 -->
					<button type="button" class="btn btn-outline-success">✔ </button><!-- 출석 -->
				</div>
			</div>	
		</c:forEach>
		</div>
		<div class="list_foot"> <!-- 셀원 추가 버튼 잇는곳 -->
			<img src="../../resources/svg/add.png" onclick="javascript:showUserSearchDiv();" alt="" />
			<p>셀원 추가하기</p>
		</div>
		<div class="userAddForm">
			<i class="material-icons" id="searchLogo">search</i>
	  		<div id="searchResultDiv">
	  			<input class="form-control" list="userList" id="userSearchDataList" placeholder="이름으로 검색">
	  			<datalist id="userList"></datalist>
	  		</div>
	  		<button type="button" id="userAddBtn" class="btn btn-success">추가</button>
		</div>
		<div class="confirm">
			<button type="button" onclick="javascript:attend();" id="confirm_btn" class="btn">저장하기</button>
		</div>
	</div>
	
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	$(document).ready(function(){
		$("#attend").trigger("click");//트리거로 강제 클릭
		calculateDay();
	});
	
	let churchCode = $('#church_code').val();
	let partName = $('#part_name').val();
	let sell_name = $('#sell_comment').children('h4').text();
	
	//출석요일 계산
	function calculateDay(){
		
		let week = ['일', '월', '화', '수', '목', '금', '토'];
		
		let today = new Date().getDay();
		let dayOfWeek = week[today];
		
		let sellAttDay = $('#att_day').val();
		
		console.log(dayOfWeek + '*' + sellAttDay);
		
		if(dayOfWeek != sellAttDay){ // 출석요일이 아닌 요일에 접속시 모든 출석관련 버튼들을 보여주지 않는다. 
			$('.buttons').css('display', 'none'); 
			$('.confirm').css('display', 'none');
			$('#list_head_text').css('display', 'none');
		};
	}
	
	//상단탭선택
	$(".menu_nav").children("li").on("click", function(){
		
		let login_user_auth = $('#login_user_auth').val();
		let login_id = $('#login_id').val();
		let login_user_name = $('#login_user_name').val();
		
		//우선 모든 카테고리에 적용된 활성화 효과 지우기
		$('li').css('border-bottom', 'none').css('color', '#808080');
		//클릭한 자식요소 li의 아이디 가져오기
		let id = $(this).attr('id');
		console.log(id);
		//선택한 카테고리에 활성화 밑줄 효과 주기 
		$("#"+id).css('border-bottom', '2px solid #404040').css('color', '#404040');
		if(id != 'attend'){ // 출석페이지(현페이지) 제외
			//페이지이동
			location.href = '${pageContext.request.contextPath }/user/' + id + '.do?church_code=' + churchCode 
					+ '&part_name=' + partName 
					+ '&sell_name=' + sell_name
					+ '&access_level=' + login_user_auth
					+ '&id=' + login_id
					+ '&god_people_name=' + login_user_name;	
		}
		
	});
	
	//교인검색폼 보이기
	function showUserSearchDiv(){

		let isAllow = false;
		
		// 권한검증
		let login_user_auth = $('#login_user_auth').val();
		let sell_leader_name = $('#sell_leader_name').text();
		let login_user_name = $('#login_user_name').val();
				
		// 00(임원)이거나  01(셀장)이면서 자신의 셀일 경우 
		if(login_user_auth == '00' || (login_user_auth == '01' && login_user_name == sell_leader_name)){
			isAllow = true;
		} else { // 권한이 없는 경우
			show('권한이 없습니다.');
		}
		
		if(isAllow){
			// 보이는 상태 -> 감추기, 감춰진 상태 -> 보이기
			let attr = $('.userAddForm').css('display');
			
			if(attr == 'none'){
				$('.userAddForm').css('display', 'flex');
			} else if(attr == 'flex'){
				$('.userAddForm').css('display', 'none');
			}	
		} else {
			
		}
	}
	
	//교인 검색
	$('#userSearchDataList').on('keyup',function(){
		
		$('#userList').empty(); 
		
		let typingContent = $('#userSearchDataList').val();
		
		// 이미 소속되어 있는 셀이 없어야함 , 해당 셀의 부서와 같은 부서여야함 -> 그래서 컨트롤러 새로 만드는거다.
		$.ajax({
			url:"${pageContext.request.contextPath }/attend/searchForAddUser.do",
			method:"POST",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
			data:{
				church_code : churchCode,
				part_name : partName,
				god_people_name : typingContent
				
			}, 
			success:function(response) {
				response.forEach(function(value, index){ //  object에서 값 꺼내올때 -> object["key"]
					$('#userList').append($('<option value="' + value["god_people_name"] + ' ' + value["birthday"] + '"> </option>'));					
				});
			}
		});
	});
	
	//셀원추가하기
	$('#userAddBtn').on('click',function(){
		
		// 파라미터 : 교회코드, 부서, 셀, 이름, 생년월일
		let userSearchData = $('#userSearchDataList').val();
		let arr = userSearchData.split(" ");
		
		let name = arr[0];
		let birth = arr[1];
		
		// 추가하기
		$.ajax({
			url:"${pageContext.request.contextPath }/attend/addSellPeople.do",
			method:"POST",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				church_code : churchCode,
				part_name : partName,
				god_people_name : name,
				sell_name : sell_name,
				birthday : birth
			}, 
			success:function(response) {
				if(response == "SUCCESS"){  // 성공이면 페이지 새로고침
					window.location.reload();
				} else { // 실패면
					show('검색된 교인정보를 확인해주세요.');
				}
			}
		});
	});
	
	// 누르면 누른버튼 확정표시
	$('.buttons').children('.btn').on('click',function(){
		// 이미 선택된거는 또 선택 안되게
		if($(this).attr('class').split('-').length == 2){
			return;
		}
				
		// 나머지 것들은 다 색 돌려놓기
		let thisEle = $(this).siblings(); // 형제요소를 배열로 리턴
		for(let i=0; i<thisEle.length; i++){
			let siblebtn = $(thisEle[i]).attr('class').split('-');
			if(siblebtn.length == 2){ // 이미 눌린 버튼이라면
				let btnType = siblebtn[1];
				$(thisEle[i]).attr('class', 'btn btn-outline-'+ btnType);
				$(thisEle[i]).attr('name', '');
			}
		}
		
		// 버튼색깔바뀐
		let eleClass = $(this).attr('class').split('-');
		let btnType = eleClass[2];
		$(this).attr('class', 'btn btn-' + btnType);
		$(this).attr('name', 'clicked');
		
		// 모든 셀원별 출석버튼을 눌러야 저장하기버튼이 활성화된다.
		let people = $('.people').length;
		let clickedBtn = $('button[name=clicked]').length;
		if(people == clickedBtn){ // 인원수만큼 클릭했으면
			// 저장하기 버튼 활성화 
			$('#confirm_btn').css('color', '#ffffff');
			$('#confirm_btn').css('background-color', '#0f87ff');
			$('#confirm_btn').css('disabled', 'false');
		} 
	});
	
	// 출석하기 ㄱㄱ
	function attend(){
		
		// 스피너 보이기
		$('.back-drop').show();
				
		let list = new Array();
		
		let worship_date = getCurrentDate().toString();
		
		let size = $('.people').length;
		// 반복문 돌며 map 객체 만들고 list에 집어넣기
		for(let i=0;i<size;i++){
			
			let choicebtn = $('#people' + i).children('.buttons').children('button[name=clicked]').attr('class');
			
			let btnType = choicebtn.split('-');
			
			if(btnType[1] == 'success' || btnType[1] == 'warning'){ // 결석은 데이터를 생성하지 않음
			// 만약 지각을 관리한다고 하면 지각 로직은 따로 만들자
				let data = new Object();
			
				data.god_people_name = $('#people' + i).children('p').text();
				data.god_people_birthday = $('#people' + i).children('input').val();
				data.church_code = churchCode;
				data.part_name = partName;
				data.sell_name = sell_name;
				data.worship_date = worship_date;
				
				list.push(data);
			}
		}
			
		// 셀원들의 최근 출석일만 업데이트 해준다. 
		$.ajax({
			url:"${pageContext.request.contextPath }/attend/lastAttendUpdate.do",
			method:"POST",
			data : { // 교회코드, 부서이름, 셀이름, 예배일
				church_code : churchCode,
				part_name : partName,
				sell_name : sell_name,
				last_attend_date : worship_date
			},
			success:function(response) {
				if(response != size){ // 모든 셀인원의 최근출석일이 업데이트 됬으면
					// 스피너 닫기
					$('.back-drop').hide();
					show('오류가 발생했습니다. [error:not match GPIDto updated count with front row count.]');
					return;
				} 
			}
		});
		
		if(list == null){ // 모두 결석인 경우
			// 스피너 닫기
			$('.back-drop').hide();
			show('출석한 인원이 없습니다.');
			return;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath }/attend/attendTry.do",
			method:"POST",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(list),
			success:function(response) {
				switch(response){
					case "DUPLI":
						// 스피너 닫기
						$('.back-drop').hide();
						show('이미 출석 하였습니다.');
						break;
					case "SUCCESS":
						// 스피너 닫기
						$('.back-drop').hide();
						show('출석을 완료하였습니다.');
						break;
					case "FAIL":
						// 스피너 닫기
						$('.back-drop').hide();
						show('출석을 실패하였습니다. 관리자에게 문의하세요.');
						break;
				}
			}
		});
		
	}
	
	
	// 셀원 이미지 클릭 리스너 -> 셀원정보페이지로 이동
	$('.sellPeopleImg').on('click',function(){
		
		let isAllow = false;
		
		let god_people_name = $(this).siblings('p').text();
		let birthday = $(this).siblings('input').val();
		
		// 권한검증
		let login_user_auth = $('#login_user_auth').val();
		let sell_leader_name = $('#sell_leader_name').text();
		let login_user_name = $('#login_user_name').val();
				
		// 00(임원)이거나  01(셀장)이면서 자신의 셀이거나 자기자신인 경우
		if(login_user_auth == '00' || 
				(login_user_auth == '01' && login_user_name == sell_leader_name) || 
					login_user_name == god_people_name){
			isAllow = true;
		} else { // 권한이 없는 경우
			show('권한이 없습니다.');
		}
		
		if(isAllow){
			location.href = "${pageContext.request.contextPath }/user/user_private.do?god_people_name=" + god_people_name + "&birthday=" + birthday + "&church_code=" + churchCode + "&part_name=" + partName + "&sell_name=" + sell_name;  
		}
		
	});
	

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
    
    function goToMain(){ // 헤더에 백버튼 눌렀을때
    	
    	let id = $('#login_id').val();
    
    	location.href = "${pageContext.request.contextPath }/user/main.do?id=" + id ;
    	
    }

</script>
</html>