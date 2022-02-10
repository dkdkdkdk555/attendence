<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/css/carousel.css"/>
<meta content="text/html; charset=UTF-8">
<title>main.do</title>
<style>
	body{
		background-color: #F0F5F5; 		
		font-family: 'Spoqa Han Sans Neo', 'sans-serif';	
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
	}
	
</style>
</head>
<body>
	
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
				<img alt="" src="../../resources/svg/church.png">
			</c:otherwise>
		</c:choose>
		<div id="church_comment">
			<h4>${churchDto.church_name }</h4>
			<p>건강한 성도, 행복한 교회 환영합니다!</p>
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
		</div>
	</div>
	
	<jsp:include page="../include/info_modal.jsp"></jsp:include>
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
			if(i<5){
				$('.cards__container').append($('<li class="box" id="' + idnm + i  + '">' + $("#"+ idnm + i).val() + '</li>'));
			}else {
				$('.cards__container').append($('<li class="box box--hide" id="' + idnm + i  + '">' + $("#"+ idnm + i).val() + '</li>'));
			}
		}	
	}

	// 부서선택
	$(".part_nav").children("li").on("click", function(){
		//우선 모든 카테고리에 적용된 활성화 효과 지우기
		$('li').css('border-bottom', 'none');
		//클릭한 자식요소 li의 아이디 가져오기
		let id = $(this).attr('id');
		//선택한 카테고리에 활성화 밑줄 효과 주기 
		$("#"+id).css('border-bottom', '3px solid #8080ff');
		
		// 케러셀 세팅
		setCarousel(id);
		
	});
	
	
	// 케러셀
	$('.cards__container').on("scroll", function() {
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
	});
	
	function shiftRight() {
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
</script>
</html>