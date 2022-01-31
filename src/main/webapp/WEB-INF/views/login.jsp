<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<title>login.do</title>
</head>
<body>
	<div class="parent">
		<form>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">아이디</label>
		    <input type="text" class="form-control" id="idInput">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="pwInput">
		  </div>
		  <div class="mb-3 form-check">
		    <input type="checkbox" class="form-check-input" id="exampleCheck1">
		    <label class="form-check-label" for="exampleCheck1">자동 로그인</label>
		  </div>
		  <button type="button" id="submitBtn" class="btn btn-primary">로그인</button>
		</form>
	</div>

</body>
<script>
	//로그인시도 
	$('#submitBtn').on("click", function(){
		
		let id = $('#idInput').val();
		let pw = $('#pwInput').val();
		
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
 						// 메인페이지 이동
 						location.href = "${pageContext.request.contextPath }/user/main.do";
 						break;
 					case "NOTEXIST" :
 						// 알림창
						alert("아이디가 존재하지 않습니다.");
						break;
					case "NOTMATCH" :
						// 알림창
						alert("아이디 비번 불일치");
						break;
					case "OVERPWDFAIL" :
						alert("비밀번호 오류 횟수가 5번을 넘어가서 계정이 잠겼습니다. 관리자한테 문의하세요.");
						break;
					case "ERROR" :
						// 알림창
						alert("시스템 오류");
						break;
				}
			}			
		});
	});
</script>
</html>
