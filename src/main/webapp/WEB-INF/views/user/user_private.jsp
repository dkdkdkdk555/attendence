<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/userCommon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user_private.css">
<style>
	body{
		background-color: #FFFFFF;
	}
</style>
<title>user_private.do</title>
</head>
<body>	
	<div class="main_header">
		<i class="material-icons" id="back_btn" onclick="javascript:history.back();">arrow_back_ios</i>
		<h5 id="main_text">셀원 정보</h5>
		<i class="material-icons" id="personal_btn">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>
	
	<!-- 프로필 사진 영역 -->
	<div class="profile_section">
		<div class="image_section">
			<c:choose>
				<c:when test="${not empty dto.img_path }">
				<img src="" alt="" class="peopleImg"/><!-- 이미지 있으면 -->
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${dto.gender eq 'M'}">
						<img alt="" class="peopleImg" src="../../resources/svg/man.png">
						</c:when>
						<c:otherwise>
						<img alt="" class="peopleImg" src="../../resources/svg/woman.png">
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="badge_section"><!-- 새신자여부, 장기결석 여부를 나타내는  배지가 들어감-->
			<c:if test="${isCalResult.isNewPeople eq 'Y' }">
				<span class="badge bg-light text-dark" id="isNew">새신자</span>
			</c:if>
			<c:if test="${isCalResult.isLongAbsent eq 'Y' }">
				<span class="badge bg-danger" id="isLongtermNo">장기결석</span>
			</c:if>
		</div>
	</div>
	<!-- hidden 셀원 정보 -->
	<input type="hidden" id="attendValue" value="${attendHist }">
	<input type="hidden" id="church_code" value="${dto.church_code }">
	<input type="hidden" id="part_name" value="${dto.part_name }">
	<input type="hidden" id="sell_name" value="${dto.sell_name }">
	<input type="hidden" id="prayer_topic" value="${dto.prayer_topic }">
	<input type="hidden" id="address" value="${dto.address }">
	
	<!-- hidden 로그인 유저 정보 -->
	
	
	<!-- 나머지 개인정보가 들어가는 영역 -->
	<div class="private_section">
	  <div class="update_attend"><!-- 최근 -> 최근날짜로 변경하기 -->
		<label class="" style="margin-bottom:7px;">최근 출석 수정</label>
		<div class="buttons">
			<button type="button" id="secondary" class="btn btn-outline-secondary">✔</button><!-- 결석 -->
			<button type="button" id="warning" class="btn btn-outline-warning">✔</button><!-- 지각 -->
			<button type="button" id="success" class="btn btn-outline-success">✔</button><!-- 출석 -->
		</div>
		<button type="button" id="submit" class="btn btn-outline-primary">수정하기</button>
	  </div>
	  <div class="inputdiv">
	    <label class="form-label" style="margin-bottom:0px;">이름</label>
	    <input type="text" class="form-control" id="sell_pp_name" value="${dto.god_people_name }" readonly>
	    <label class="form-label" style="margin-bottom:0px;">생일</label>
	    <input type="text" class="form-control" id="sell_pp_birth" value="${dto.birthday }" readonly>
	    <label class="form-label" style="margin-bottom:0px;">연락처</label>
	    <input type="text" class="form-control" id="sell_pp_cell" value="${dto.cell_no }" readonly>
	    <label class="form-label" style="margin-bottom:0px;">주소</label>
	    <input type="text" class="form-control" id="sell_pp_addr" value="${dto.address }">
	    <c:if test="${not empty dto.volun_part_name }">
	    	<label class="form-label" style="margin-bottom:0px;">봉사부서</label><!-- 부서랑 셀 같이 드렁감 -->
	    	<input type="text" class="form-control" id="sell_pp_volun" value="${dto.volun_part_name } - ${dto.volun_part_sell}" readonly>
	    </c:if>
	    <c:if test="${dto.baptism_yn eq true}">
	    	<label class="form-label" style="margin-bottom:0px;">세례여부</label>
		    <input type="text" class="form-control" id="sell_pp_bapt" value="Y" readonly>
	    </c:if>
	    <label class="form-label" style="margin-bottom:0px;">기도제목</label>
	    <textarea class="form-control" placeholder="" id="sell_pp_pray">${dto.prayer_topic }</textarea>
	    <label class="form-label" style="margin-bottom:0px;">마지막 출석일</label>
	    <input type="text" class="form-control" id="sell_pp_lastattd" value="${dto.last_attend_date }" readonly>
	    <label class="form-label" style="margin-bottom:0px;">새신자 등록일</label>
	    <input type="text" class="form-control" id="sell_pp_reg" value="${dto.newpp_reg_date }" readonly>
		<div class="confirm"><!-- 셀원정보 수정 저장 -->
			<button type="button" onclick="" id="confirm_btn" class="btn">저장하기</button>
		</div>
	  </div>
	</div>
	
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>

	let churchCode = $('#church_code').val();
	let partName = $('#part_name').val();
	let sellName = $('#sell_name').val();
	let ppName = $('#sell_pp_name').val();
	let ppBirth = $('#sell_pp_birth').val();
	

	$(document).ready(function(){
		let attVal = $('#attendValue').val();
		$("#" + attVal ).trigger("click");
	});

	// 출석버튼 선택시 
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
	});
	
	//출석수정
	$('#submit').on('click',function(){
				
		let recentAttend = $('#attendValue').val();
		let clickedBtn = $('.buttons').children('button[name=clicked]').attr('id');
		let worshipDate = $('#sell_pp_lastattd').val();
		
		// 최근출석내용과 같은걸 눌렀럿다면 수정 불가
		if(recentAttend == clickedBtn){ 
			return;
		}
		
		// 수정하기
		$.ajax({
			url:"${pageContext.request.contextPath }/user/updateRecentAttend.do",
			method:"POST",
			data : {
				recent_attend_value : recentAttend,
				attend_value : clickedBtn,
				church_code : churchCode,
				part_name : partName,
				sell_name : sellName,
				worship_date : worshipDate,
				god_people_name : ppName,
				god_people_birthday : ppBirth
			},
			success:function(response) {
				switch(response){
					case "SUCCESS":
						window.location.reload();
						break;
					case "FAIL":
						show('출석 수정에 실패하였습니다. 다시 시도하여 주세요.');
						break;
					case "ERROR":
						show('시스템 오류입니다. 관리자에게 문의하세요.');
						break;
				}
			}
		});
	});
	
	// 셀원정보 수정
	$('#confirm_btn').on('click', function(){
		// 바뀐값이 있는지 검사
		let prayer_setting_value = $('#prayer_topic').val();
		let address_setting_value = $('#address').val();
		
		let pray_chv = $('#sell_pp_pray').val();
		let addr_chv = $('#sell_pp_addr').val();
		
		let isUpdateOkay = false;
		
		if(prayer_setting_value != pray_chv || address_setting_value != addr_chv){
			isUpdateOkay = true;
		}
		
		if(isUpdateOkay){
			$.ajax({
				url:"${pageContext.request.contextPath }/user/updateSellPeopleInfo.do",
				method:"POST",
				data : {
					church_code : churchCode,
					part_name : partName,
					sell_name : sellName,
					god_people_name : ppName,
					birthday : ppBirth,
					prayer_topic : pray_chv,
					address : addr_chv
				},
				success:function(response) {
					switch(response){
						case "SUCCESS":
							window.location.reload();
							break;
						case "FAIL":
							show('정보 수정에 실패하였습니다.');
							break;
						case "ERROR":
							show('시스템 오류입니다. 관리자에게 문의하세요.');
							break;
					}
				}
			});
		} else {
			show('수정된 값이 없습니다.');
		}
		
	});
	
</script>
</html>