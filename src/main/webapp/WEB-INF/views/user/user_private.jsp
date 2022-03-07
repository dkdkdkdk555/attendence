<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.07, maximum-scale=5.0, user-scalable=0" />
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
	<!-- 나머지 개인정보가 들어가는 영역 -->
	<div class="private_section">
	  <div class="update_attend"><!-- 최근 -> 최근날짜로 변경하기 -->
		<label class="" style="margin-bottom:7px;">최근 출석 수정</label>
		<div class="buttons">
					<button type="button" class="btn btn-outline-secondary">✔</button><!-- 결석 -->
					<button type="button" class="btn btn-outline-warning">✔</button><!-- 지각 -->
					<button type="button" class="btn btn-outline-success">✔</button><!-- 출석 -->
		</div>
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
	    <label class="form-label" style="margin-bottom:0px;">세례여부</label>
	    <c:choose>
	    	<c:when test="${dto.baptism_yn eq true}">
	    		<input type="text" class="form-control" id="sell_pp_bapt" value="Y">
	    	</c:when>
	    	<c:otherwise>
	    		<input type="text" class="form-control" id="sell_pp_bapt" value="N">
	    	</c:otherwise>
	    </c:choose>
	    <label class="form-label" style="margin-bottom:0px;">기도제목</label>
	    <textarea class="form-control" placeholder="" id="sell_pp_pray">${dto.prayer_topic }</textarea>
	    <label class="form-label" style="margin-bottom:0px;">마지막 출석일</label>
	    <input type="text" class="form-control" id="sell_pp_lastattd" value=${dto.last_attend_date } readonly>
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
	
</script>
</html>