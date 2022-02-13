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
	}
</style>
</head>
<body>
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
	<div>	
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
			<p>${sellInfo.sell_leader_name }</p>
		</div>	
	</div>
	<!-- 셀원목록 섹션 -->
	<div class="people_list">
		<div class="list_head">
			<p>셀원</p>
			<p>출석하기</p>		
		</div>
		<div class="list_body">
		<c:forEach items="${peopleList }" varStatus="status" var="tmp">
			<div class="people">
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
				<input type="hidden" value="${tmp.birthday }" />
				<div class="buttons">
					<button type="button" class="btn btn-outline-secondary">✔</button>
					<button type="button" class="btn btn-outline-warning">✔</button>
					<button type="button" class="btn btn-outline-success">✔</button>
				</div>
			</div>	
		</c:forEach>
		</div>
		<div class="list_foot"> <!-- 셀원 추가 버튼 잇는곳 -->
			<img src="../../resources/svg/add.png" alt="" />
			<p>셀원 추가하기</p>
		</div>
		<div class="confirm">
			<button type="button" id="confirm_btn" class="btn">저장하기</button>
		</div>
	</div>
	
<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	$(document).ready(function(){
		$("#check").trigger("click");//트리거로 강제 클릭
	});
	
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
	
	
</script>
</html>