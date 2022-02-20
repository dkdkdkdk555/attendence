<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.07, maximum-scale=5.0, user-scalable=0" />
<title>attend.do</title>
<style>
	body{
		background-color: #F0F5F5; 		
		font-family: 'Spoqa Han Sans Neo', 'sans-serif';	
		overflow-x: hidden;
	}
	
	/* 드래그시 영역선택되는거 색 안보이게*/
	::selection {

		color:none;
		background:none;
		
	}
	
	/* 헤더 */
	.main_header{
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #FFFFFF;
		height: 7%;
		display:sticy;
	}
	
	#main_text{
		position:absolute;
		flex-grow:1;
		text-align:center;
		margin-top:auto;
		margin-bottom:auto;	

	}
	
	#personal_btn{
		position:absolute;
		right:5%;
		font-size:30px;
		color: #808080;
		
	}
	
	/* 메뉴 nav */
	
	.menu{
		display:flex;
		background-color: #FFFFFF;
		margin-top: 0.3%;
		flex-direction: column;
	}
	
	.menu_nav{
		display:flex;
		width: 100%;
		height: 50px;
		overflow-x:auto; /*기본 스크롤 상태*/
		padding-left:0px;
		padding-right:0px;
/* 		border-bottom: 5.5px solid #e6e6e6; */
		background-color:white;
		margin-color:white;
		text-align:center;
		
	}

	.menu_nav::-webkit-scrollbar{ /*스크롤 기능은 유지하면서 스크를바는 없애기*/
		display:none;
	}
	
	.menu_li{
		display:inline-block;
		flex-grow:1;
		list-style:none;
		margin:5 auto 0 auto;
		font-size: 17px;
		color:#808080;
		font-weight:bold;
		
	}
	
	/*셀정보 섹션*/
	.sell_info_container{
		display: flex;
		background-color: #FFFFFF;
		margin-top: 2%;
		align-items: center;
		border-radius: 10px;
		position: relative;
		margin-left:2%;
		margin-right:2%;
	}
	
	.sell_info_container img{
		width:90px;
		height: 90px;
		margin:4% 4%;
	}
	
	#sell_comment{
		margin-top: 4%;
		margin-left: 10px;
	}
	
	/* 셀원 목록 섹션 */
	.people_list{
		display:flex;
		background-color: #FFFFFF;
		margin-top:2%;
		flex-direction:column;
	}
	
	.list_head{
		display:flex;
		justify-content:space-between;
		margin: 6 8%;
		font-size: 18px;
	}
	
	.list_body{
		display: flex;
		flex-direction:column;
	}
	
	.list_body p{
		margin:5 3%;
		font-size:17px;
	}
	
	.people{
		display:flex;
		align-items:center;
		margin-top:10px;
	}
	
	.list_body img{
		width:60px;
		height:60px;
		margin-left: 5.4%;
	}
	
	.list_foot{
		display:flex;
		align-items: center;
	}
	
	.list_foot p{
		margin:5 1.5%;
		font-size:17px;
	}
	
	.list_foot img{
		width:75px;
		height:75px;
		margin-left: 4.2%;
		padding:0;
		margin-top:3px;
	}
	
	.buttons .btn{
		width: 40px;
		height: 40px;
		border-radius: 50%;
/* 		font-size: 12px; */
	}
	
	.buttons{
		position:absolute;
		right:5%;
	}
	
	.confirm{
		position:relative;
 		margin:0 10%;
		padding:15 0;
		
	}
	
	#confirm_btn{
		background-color: #909090;
		width: 100%;
		disabled:true;
		
	}
	
	/*교인검색창*/
	.userAddForm{
		display:none; /* 셀원 추가 버튼누르면 -> flex */
		flex-direction:row;
		justify-content: space-around;
		padding:10px 0;
		border : 2px solid #000000;
	}
	
	/* 검색 버튼 */
	#searchLogo{
		display:inline;
		height:35px;
		width:15px;
 	 	padding-top: 8px;
 	 	padding-left: 5px;
	}
	
	/* 검색결과를 ajax로 받는창 */
	#searchResultDiv{
		display: flex;
		flex-direction: row;
		justify-content: space-around;
		width:70%;
	}
	

</style>
</head>
<body>

	<!-- hidden -->
	<input type="hidden" value="${sellInfo.church_code }" id="church_code"/>
	<input type="hidden" value="${sellInfo.part_name }" id="part_name"/>
	<input type="hidden" value="${auth }" id="login_user_auth"/>
	<input type="hidden" value="${login_user_name }" id="login_user_name"/>
	<input type="hidden" value="${sellInfo.att_day_of_week }" id="att_day"/><!-- 셀의 출석 요일 -->
	
	<div class="main_header">
		<h5 id="main_text">셀 관리</h5>
		<i class="material-icons" id="personal_btn">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>
	<div class="menu">
		<nav class="menu_nav">
			<li class="menu_li" id="check">출석체크</li>
			<li class="menu_li" id="management">사역관리</li>
			<li class="menu_li" id="statistics">통계</li>
			<li class="menu_li" id="table">출결표</li>
		</nav>	
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
				<img src="" alt="" /><!-- 이미지 있으면 -->
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${tmp.gender eq 'M'}">
						<img alt="" src="../../resources/svg/man.png">
						</c:when>
						<c:otherwise>
						<img alt="" src="../../resources/svg/woman.png">
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
				<p>${tmp.god_people_name }</p>
				<input type="hidden" value="${tmp.birthday }"/>
				<div class="buttons">
					<button type="button" class="btn btn-outline-secondary">✔</button><!-- 결석 -->
					<button type="button" class="btn btn-outline-warning">✔</button><!-- 지각 -->
					<button type="button" class="btn btn-outline-success">✔</button><!-- 출석 -->
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
		$("#check").trigger("click");//트리거로 강제 클릭
		calculateDay();
	});
	
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
	
	//부서선택
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
		
		let churchCode = $('#church_code').val();
		let partName = $('#part_name').val();
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
		let churchCode = $('#church_code').val();
		let partName = $('#part_name').val();
		let sell = $('#sell_comment').children('h4').text();
		
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
				sell_name : sell,
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
		
		let list = [];
		
		let church_code = $('#church_code').val();
		let part_name = $('#part_name').val();
		let sell_name = $('#sell_comment').children('h4').text();
		let worship_date = getCurrentDate().toString();
		
		let size = $('.people').length;
		// 반복문 돌며 map 객체 만들고 list에 집어넣기
		for(let i=0;i<size;i++){
			
			let choicebtn = $('#people' + i).children('.buttons').children('button[name=clicked]').attr('class');
			
			let btnType = choicebtn.split('-');
			
			if(btnType[1] == 'success' || btnType[1] == 'warning'){ // 결석은 데이터를 생성하지 않음
			// 만약 지각을 관리한다고 하면 지각 로직은 따로 만들자
				let map = new Map();
			
				map.set('god_people_name', $('#people' + i).children('p').text());
				map.set('god_peoople_birthday', $('#people' + i).children('input').val());
				map.set('church_code', church_code);
				map.set('part_name', part_name);
				map.set('sell_name', sell_name);
				map.set('worship_date', worship_date);
				
				list.push(map);
			}
		}
				
		$.ajax({
			url:"${pageContext.request.contextPath }/attend/attendTry.do",
			method:"POST",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:list, 
			success:function(response) {
				
			}
		});
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