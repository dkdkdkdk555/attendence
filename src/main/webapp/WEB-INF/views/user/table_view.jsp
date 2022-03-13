<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.07, maximum-scale=5.0, user-scalable=0" />
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
		  <option>2022</option>
		  <option>2023</option>
		  <option>2024</option>
		  <option>2025</option>
		</select>
		<p class="labl">년</p>
		<!-- 월 -->
		<select class="form-select" id="month_select" 
			style="width:8%; font-size: 30px; border:none; 
			border-radius:none; -webkit-apparance:none;
			-moz-apparance:none; apparance:none;
			background:url(../) no-repeat 80% 50%; padding-right:0;
			margin-left:7px;">
		  <option>1</option>
		  <option>2</option>
		  <option>3</option>
		  <option>4</option>
		  <option>5</option>
		  <option>6</option>
		  <option>7</option>
		  <option>8</option>
		  <option>9</option>
		  <option>10</option>
		  <option>11</option>
		  <option>12</option>
		</select>
		<p class="labl">월</p>
	</div>
	<!-- 출결표 -->
	<div class="view_table">
		
	</div>
	
<!-- 	<ul> -->
<%-- 	<c:forEach var="dto" items="${HistList }"> --%>
<%-- 		<lil>${dto }</p> --%>
<%-- 	</c:forEach> --%>
<!-- 	</ul> -->
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	$(document).ready(function(){
		$("#table_view").trigger("click");//트리거로 강제 클릭

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