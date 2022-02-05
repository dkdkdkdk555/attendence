<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<title>login.do</title>
<style>
	
	body{
		background-color: #F0F5F5; 		
	}

	.container{
		display: flex;
		flex-direction: column;
		width: 90%;
		margin-top: 30px;
		background-color: #FFFFFF;
		border-radius: 25px;	
		padding: 25px;	
	}
	
	.innerForm{
		width: 100%;
		flex-grow:1;
	}
	
	.inputdiv{
		margin-bottom: 8px;
		color: #7E878B;
		font-size: 14px;
	}
	
	.form-label{
		margin-bottom: 5px;
	}
	
	.form-check-label{
		color: #7E878B;
	}
	
	.btn{
		width: 100%;
		border-radius: 12px;
	    color: #ffffff;
	    background-color: #0f87ff;
	    border-color: #0f87ff;
	}
	
	h4{
		font-weight: bold;
		margin:0px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h4>로그인</h4>
		<form class="innerForm">
		  <div class="inputdiv" style="margin-top:20px;">
		    <label class="form-label">아이디</label>
		    <input type="text" class="form-control" id="idInput">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="pwInput">
		  </div>
		  <div class="mb-3 form-check">
		    <input type="checkbox" class="form-check-input" id="autoLoginCheck">
		    <label class="form-check-label">로그인 정보 저장</label>
		  </div>
		  <button type="button" id="submitBtn" class="btn btn-primary">로그인</button>
		</form>
	</div>
	<div class="container" id="signUp" style="margin-top:15px;">
		<h4>회원가입</h4>
	</div>
	<jsp:include page="include/info_modal.jsp"></jsp:include>
</body>
<script>
	
	// 쿠키에 로그인정보 저장되어있으면 가져오기
	$('#idInput').val(getCookie('savedId'));
 	$('#pwInput').val(getCookie('savedPwd'));
 	$('#autoLoginCheck').prop('checked',true);
	
	//로그인시도 
	$('#submitBtn').on("click", function(){
		
		let id = $('#idInput').val();
		let pw = $('#pwInput').val();
		
		let checked = $('#autoLoginCheck').is(':checked');
		
		console.log(checked);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/login/userLogin.do",
			method:"POST",
			data:{
				loginId : id,
				loginPassword : pw
			}, // 컨트롤러에서 리턴타입이 String일때 ajax에서 dataType을 json으로 해주면안됨 그래서 생략
			success:function(response) {
				
 				switch(response){
 					case "SUCCESS" :
 						if(checked == true) {
 							setAutoLogin(id, pw);
 						}
 						// 메인페이지 이동 <- id가 정상으로 응답받은거니까 안전함
 						location.href = "${pageContext.request.contextPath }/user/main.do?id=" + id ;
 						break;
 					case "NOTEXIST" :
 						// 알림창
 						show("아이디가 존재하지 않습니다.");
						break;
					case "NOTMATCH" :
						// 알림창
						show("아이디와 비밀번호가 불일치합니다.");
						break;
					case "OVERPWDFAIL" :
						// 알림창
						show("비밀번호 오류 횟수 초과로 계정이 잠겼습니다. 관리자한테 문의하세요.");
						break;
					case "ERROR" :
						// 알림창
						show("시스템 오류입니다. 관리자에게 문의하세요");
						break;
				}
			}			
		});
	});
	
	// 쿠키에 로그인정보 저장
	function setAutoLogin(id, pw){
		let savedId = getCookie('savedId');
		let savedPwd = getCookie('savedPwd');
		if(savedId == null){
			setCookie('savedId', id);
			setCookie('savedPwd', pw);
		}
	}
	
	//쿠키 생성 메소드_2021.04.23
	function setCookie(key, value) {
	    let expiration_date = new Date();
	   	expiration_date.setFullYear(expiration_date.getFullYear()+1);// 시간을 1년으로 지정
	    document.cookie = key + "=" + escape(value) + "; path=/; expires=" + expiration_date.toUTCString();
	}
	
	
	//쿠키 가져오는 메소드_2021.04.23
	function getCookie(key) {
		let result = null;
		let cookie = document.cookie.split(';');// 쿠키 문자열을 ';'를 기준으로 나누고 배열을 리턴 
	    cookie.some(function(item){ // cookie 배열을 가지고 some의 테스트 함수를 실행시켜 하나의 엘리먼트라도 true면은 true를 리턴하는 메소드 .some() (근데 여기선 걍 배열 요소들 가지고 함수 실행만)
	      
	        item = item.replace(' ', '');// 공백을 제거
	 
	        let dic = item.split('=');// 각 인덱스를 '='기준으로 또 나눔
	 
	        if (key === dic[0]) { // = 의 좌측이 전달받은 key 와 같다면
	            result = dic[1]; // 결과로 value를 담고 (쿠키값 얻어내기)
	            return true;    // getCookie메소드를 종료
	        }
	    });
	    return result; //키값과 일치하는 쿠키가 없다면 null을 리턴
	}
	
	// 회원가입 페이지로 이동
	$('#signUp').on('click', function(){
		location.href = "${pageContext.request.contextPath }/signup.do";
	});
	
</script>
</html>
