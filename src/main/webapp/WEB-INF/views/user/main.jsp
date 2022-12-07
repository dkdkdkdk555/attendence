<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/css/carousel.css"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main.do</title>
<style>
	html, body{
		background-color: #F0F5F5; 		
		font-family: 'Spoqa Han Sans Neo', 'sans-serif';	
		overflow-x: hidden;
		overflow-y: auto;
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
		height: 8%;
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
	
	/* 교회정보 div */
	.church_info{
		display: flex;
		background-color: #FFFFFF;
		margin-top: 2%;
		align-items: center;
	}
	
	.church_info img{
		width:90px;
		height: 90px;
		margin:4% 4%;
	}
	
	#church_comment{
		margin-top: 4%;
		margin-left: 10px;
	}
	
	/* 출석부 목록 */
	
	.part_info{
		display:flex;
		background-color: #FFFFFF;
		margin-top: 2%;
		flex-direction: column;
	}
	
	.part_nav{
		display:flex;
		width: 100%;
		height: 40px;
		overflow-x:auto; /*기본 스크롤 상태*/
		padding-left:0px;
		padding-right:0px;
/* 		border-bottom: 5.5px solid #e6e6e6; */
		background-color:white;
		margin-color:white;
		text-align:center;
		
	}

	.part_nav::-webkit-scrollbar{ /*스크롤 기능은 유지하면서 스크를바는 없애기*/
		display:none;
	}
	
	/*각각의 카테고리 메뉴 */
	.part_li{
		display:inline-block;
		flex-grow:1;
		list-style:none;
		margin:5 auto 0 auto;
		
	}
	
	.sellList{
		background-color: #FFFFFF;
		display:flex;
		flex-direction:column;
		
	}
	
	.listMoveBtn{
		background-color: #FFFFFF;
		display:flex;
		flex-direction:row;
		justify-content:space-around;
		padding-bottom:3px;
		border-top:2px solid #F0F5F5;
	}
	
	#left_move{
		padding-right:5px;
	}

	#right_move{
		padding-left:5px;
	}
	
	/* 재적등록 div */
	.add_people{
		display: flex;
		background-color: #FFFFFF;
		margin-top: 2%;
		align-items: center;
	}
	
	.add_people img{
		width: 60px;
		height: 60px;
		margin:1% 2%;
	}
	
	.add_people p{
		margin: 0px;
		/* font-weight: bold; */	
	}
	
	/* 재적등록form div */
	.peopleInsertForm{
		display: none;
		flex-direction: column;
		width: 96%;
		margin-top: 1%;
		background-color: #FFFFFF;
		border-radius: 25px;
		padding: 25px;
	}
	
		
</style>
</head>
<body>
	
	<!-- 소속정보 및 권한 -->
	<input type="hidden" value="${gpiDto.god_people_name }" id="user_name"  />
	<input type="hidden" value="${gpiDto.access_level }" id="user_authority"  />
	<input type="hidden" value="${gpiDto.sell_name }" id="user_sell"  />
	<input type="hidden" value="${gpiDto.volun_part_sell }" id="user_volun_sell"  />
	<input type="hidden" value="${gpiDto.id }" id="user_id"  />
	<input type="hidden" value="${churchDto.church_code }" id="church_code" />
		
	<!-- 셀리스트 -->
	<c:if test="${not empty sellList }">
		<div id="sell_list">
		<c:forEach items="${sellList }" varStatus="status" var="tmp">
			<input type="hidden" value="${tmp.sell_name }" id="box${status.index }"/>
			<input type="hidden" value="${tmp.sell_img_path }" id="img_${status.index }"/>
		</c:forEach>
		</div>
	</c:if>
	<!-- 봉사셀리스트 -->
	<c:if test="${not empty volunSellList }">
		<div id="volunsell_list">
		<c:forEach items="${volunSellList }" varStatus="status" var="tmp">
			<input type="hidden" value="${tmp.sell_name }" id="vbox${status.index }"/>
			<input type="hidden" value="${tmp.sell_img_path }" id="vimg_${status.index }"/>
		</c:forEach>
		</div>
	</c:if>

	<div class="main_header">
		<h5 id="main_text">부서정보</h5>
		<i class="material-icons" id="personal_btn">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>
	<div class="church_info">
		<c:choose>
			<c:when test="${not empty churchDto.church_img_path }">
				<img src="" alt="" /> <!-- 아직 파일 올리는 경로 모름-->
			</c:when>
			<c:otherwise>
				<img src="../../resources/svg/church.png" alt="" />	
			</c:otherwise>
		</c:choose>
		<div id="church_comment">
			<h4>${churchDto.church_name }</h4>
			<p>${churchDto.church_comment }</p>
		</div>
	</div>
	<div class="part_info">
		<nav class="part_nav">
			<c:if test="${not empty gpiDto.part_name }"> <!-- 소속부서 -->
				<li id="belong_part" class="part_li">${gpiDto.part_name }</li>
			</c:if>
			<c:if test="${not empty gpiDto.volun_part_name }"> <!-- 봉사부서 -->
				<li id="volun_part" class="part_li">${gpiDto.volun_part_name }</li>
			</c:if>
		</nav>
		<div class="sellList">
			<jsp:include page="../include/carousel.jsp"></jsp:include>
		   	<div class="listMoveBtn">
		   		<i class="material-icons" id="left_move" onclick="javascript:leftScroll();" >navigate_before</i>
		   		<i class="material-icons" id="right_move" onclick="javascript:rightScroll();">keyboard_arrow_right</i>
		   	</div>
		</div>
	</div>
	<div class="add_people"> <!-- 재적 등록 버튼 잇는곳 -->
		<img src="../../resources/svg/add.png" onclick="javascript:showUserInsertDiv();" alt="" />
		<p>재적 등록</p>
	</div>
	<div class="peopleInsertForm"><!-- 재적 등록 form -->
		<!-- 이름* -->
		<div>
			<label for="name_input" class="form-label">이름</label>
			<input type="text" id="name_input" />
		</div>
		<!-- 생년월일* -->
		<div>	
			<label for="birthDay_input" class="form-label">생년월일</label>
			<input type="date" id="birthDay_input"/>
		</div>
		<!-- 소속될 셀 -->
		<div>
			<label for="sell_name">소속될 셀</label>
			<select name="" id="">
				
			</select>
		</div>
		<!-- 연락처 -->
		<div>
			<label for="tel_input" class="form-label">연락처</label>
			<input type="text" id="tel_input"/>
		</div>
		<button type="button" id="peopleInsert" class="btn btn-primary">등록</button>
	</div>
	
	<jsp:include page="../include/info_modal.jsp"></jsp:include>
	<jsp:include page="../include/personal_btn_modal.jsp"></jsp:include>
</body>
<script>

	$(document).ready(function(){
		$("#belong_part").trigger("click");//트리거로 강제 클릭
	});
	
	// 케러셀 세팅
	function setCarousel(id){
		
		// 선택시마다 클리어
		$('.cards__container').empty();
		
		let cnt = 0;
		let idnm = "";
		let imgidnm = "";
		
		if(id == "belong_part"){ // 소속부서
			cnt = $('#sell_list').children().length / 2;
			idnm = "box";
			imgidnm = "img_";
		}else { // 봉사부서
			cnt = $('#volunsell_list').children().length / 2;
			idnm = "vbox";
			imgidnm = "vimg_";
		}
		
		console.log(cnt);
		
		for(let i=0; i<cnt; i++){
			let sellNm = $("#"+ idnm + i).val();
			if(i<5){
				$('.cards__container').append($('<li onClick="javascript:movePage(this);" class="box" id="' + idnm + i  + '">' + sellNm + '</li>'));
			}else {
				$('.cards__container').append($('<li onClick="javascript:movePage(this);" class="box box--hide" id="' + idnm + i  + '">' + sellNm + '</li>'));
			}
		}	
	}
	
	let partnm = '';

	// 부서선택
	$(".part_nav").children("li").on("click", function(){
		//우선 모든 카테고리에 적용된 활성화 효과 지우기
		$('li').css('border-bottom', 'none');
		//클릭한 자식요소 li의 아이디 가져오기
		let id = $(this).attr('id');
		partnm = $(this).text();
		console.log("부서이름" + partnm);
		//선택한 카테고리에 활성화 밑줄 효과 주기 
		$("#"+id).css('border-bottom', '3px solid #8080ff');
		
		// 케러셀 세팅
		setCarousel(id);
		
	});
		
	// 출석부 접근
	function movePage(obj){
		let clickSellName = obj.textContent;
		let auth = $('#user_authority').val();
		let userId = $('#user_id').val();
		if(auth == null || auth == ""){ // 권한이 없으면  자신의 소속셀 또는 봉사셀만 접근할 수 있다.
			if(clickSellName == $('#user_sell').val() || clickSellName == $('#user_volun_sell').val()){
				// 셀이름, 아이디, 권한 던져서 출석 페이지 접근
				location.href = "${pageContext.request.contextPath }/user/attend.do?id=" + userId + "&access_level=" + auth + "&sell_name=" + clickSellName + "&part_name=" + partnm;
			}
		} else { // 셀장 권한 이나 임원권한이면 모든 출석부에 접근이 가능하다.
			location.href = "${pageContext.request.contextPath }/user/attend.do?id=" + userId + "&access_level=" + auth + "&sell_name=" + clickSellName + "&part_name=" + partnm;
		}
	}
	
	
	//캐러셀 넘기기 리스너  --> 실제로 웹뷰에서는 리스너가 동작하지 않아 일단 주석처리한다.
// 	let mouseX = '';
		
// 	$('.cards__container').on('mousedown',function(event){
// 		eventObj = event;
// // 		console.log('x좌표 :' + event.clientX + ',  y좌표 :' + event.clientY);
// 		mouseX = event.clientX;
// 	});
	
// 	$('.cards__container').on('drag',function(event){
// 		if(mouseX < 200){
// 			rightScroll();
// 		} else if (mouseX > 325){
// 			leftScroll();
// 		}
		
// 	});
	
	
	// 케러셀
	function leftScroll() {
		const boxes = document.querySelectorAll(".box");
		const tmpNode = boxes[0];
		boxes[0].className = "box move-out-from-left";
		setTimeout(function() {
		    if (boxes.length > 5) {
		        tmpNode.classList.add("box--hide");
		        boxes[5].className = "box move-to-position5-from-left";
		    }
		    boxes[1].className = "box move-to-position1-from-left";
		    boxes[2].className = "box move-to-position2-from-left";
		    boxes[3].className = "box move-to-position3-from-left";
		    boxes[4].className = "box move-to-position4-from-left";
		    boxes[0].remove();
		    document.querySelector(".cards__container").appendChild(tmpNode);
		}, 500);
	}
	
	function rightScroll() {
		const boxes = document.querySelectorAll(".box");
		boxes[4].className = "box move-out-from-right";
		setTimeout(function() {
		    const noOfCards = boxes.length;
		    if (noOfCards > 4) {
		        boxes[4].className = "box box--hide";
		    }
		    const tmpNode = boxes[noOfCards - 1];
		    tmpNode.classList.remove("box--hide");
		    boxes[noOfCards - 1].remove();
		    let parentObj = document.querySelector(".cards__container");
		    parentObj.insertBefore(tmpNode, parentObj.firstChild);
		    tmpNode.className = "box move-to-position1-from-right";
		    boxes[0].className = "box move-to-position2-from-right";
		    boxes[1].className = "box move-to-position3-from-right";
		    boxes[2].className = "box move-to-position4-from-right";
		    boxes[3].className = "box move-to-position5-from-right";
		}, 500);
	}
	
	$('#personal_btn').on('click', function(){
		showP();
	});
	
	/*
		개인메뉴 버튼들 Js
	*/
	
	function logout(){
		location.href = "${pageContext.request.contextPath }/login/userLogout.do";
	}
	
	function systemOut(){
		webkit.messageHandlers.callbackHandler.postMessage("MessageBody");
	}
		
	function showUserInsertDiv(){
	// 재적등록폼 보이기

		let isAllow = false;
		
		// 권한검증
		let login_user_auth = $('#user_authority').val();
				
		// 00(임원)이거나  01(셀장)이면서 자신의 셀일 경우 
		if(login_user_auth == '00'){
			isAllow = true;
		} else { // 권한이 없는 경우
			show('권한이 없습니다.');
		}
		
		if(isAllow){
			// 보이는 상태 -> 감추기, 감춰진 상태 -> 보이기
			let attr = $('.peopleInsertForm').css('display');
			
			if(attr == 'none'){
				$('.peopleInsertForm').css('display', 'flex');
			} else if(attr == 'flex'){
				$('.peopleInsertForm').css('display', 'none');
			}	
		} else {
			
		}
	}
	
	// 재적등록 확인
	$('#peopleInsert').on('click',function(){
		// 이름, 생년월일 필수값 입력 여부 확인
		let name = $('#name_input').val();
		let birthDay = $('#birthDay_input').val();
		let partName = $('#belong_part').val();
		let churchCode = $('#church_code').val();
		
		if(name == '' || birthday == ''){
			show('이름과 생년월일을 입력하여 주십시오.');
			return;
		}
		
		// TODO:기존에 존재하는 재적인원인지 검증하고 알려주는 로
		
		$.ajax({
			url:"${pageContext.request.contextPath }/main/insertPeople.do",
			method:"POST",
			data:{
				church_code : churchCode,
				part_name : partName,
				god_people_name : name,
				birthday : birthDay,
				sell_name : sellName
			},
			success:function(response){
				
			}
		});
		
	});
	
	
	
	
	
</script>
</html>