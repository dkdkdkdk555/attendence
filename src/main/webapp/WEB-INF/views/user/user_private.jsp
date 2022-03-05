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
		<div class="input_div">
		  <div class="inputdiv">
		    <label class="form-label">이름</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">생일</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">연락처</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">주소</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  
		  <div class="inputdiv">
		    <label class="form-label">봉사부서</label><!-- 부서랑 셀 같이 드렁감 -->
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">세례여부</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">기도제목</label><!-- textarea도 고민 -->
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">마지막 출석일</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">새신자 등록일</label>
		    <input type="text" class="form-control" id="">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">최근 출석 수정</label>
		    <input type="text" class="form-control" id="">
		  </div>
		</div><!-- 셀정보수정 저장버튼 -> 컨펌 모달창 -->
	</div>
	
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	

	
	
</script>
</html>