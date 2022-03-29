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
<title>management.do</title>
</head>
<body>

	<!-- hidden -->
	<input type="hidden" value="${param.church_code }" id="church_code"/>
	<input type="hidden" value="${param.part_name }" id="part_name"/>
	<input type="hidden" value="${param.sell_name }" id="sell_name" />
	<input type="hidden" value="${param.access_level}" id="auth" />
	<input type="hidden" value="${param.id }" id="login_id" />
	<input type="hidden" value="${param.god_people_name }" id="login_user_name" />
	
	
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
	
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	$(document).ready(function(){
		$("#management").trigger("click");//트리거로 강제 클릭
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
		if(id != 'management'){ // 출석페이지(현페이지) 제외
			//페이지이동
			location.href = '${pageContext.request.contextPath }/user/' + id + '.do?church_code=' + churchCode 
					+ '&part_name=' + partName 
					+ '&sell_name=' + sellName
					+ '&access_level=' + login_user_auth
					+ '&id=' + login_id
					+ '&god_people_name=' + login_user_name;	
		}
	});
	
</script>
</html>