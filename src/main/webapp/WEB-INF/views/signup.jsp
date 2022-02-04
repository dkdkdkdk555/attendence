<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<title>signup.do</title>
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
	
	.form-control{
		height: 28px;
	}
	
	#submitBtn{
		margin-top: 10px;
	}
	
	#searchDiv{
		display:flex;
		flex-direction:row;
	}
	
	/* 검색 버튼 */
	#searchLogo{
		display:inline;
		flex-grow:1;
		height:35px;
		width:15px;
	}
	
	/* 검색결과를 ajax로 받는창 */
	#searchResultDiv{
		display: flex;
		flex-direction: column;
		width:90%;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h4>회원가입</h4>
		<form class="innerForm">
		  <div class="inputdiv" style="margin-top:20px;">
		  	<label class="form-label">교회코드</label>
		    <input type="text" class="form-control" id="inputChurchCode" style="width:40%;">
		    <div class="valid" id="chruchCodeValid"></div>
		  </div>
		  <div class="inputdiv">
		  	<label class="form-label">교인검색</label>
		  	<div id="searchDiv">
		  		<i class="material-icons" id="searchLogo">search</i>
		  		<div id="searchResultDiv">
		  			<input class="form-control" list="userList" id="userSearchDataList" placeholder="이름으로 검색">
		  			<datalist id="userList"></datalist>
		  		</div>
		  	</div>
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">연락처</label>
		    <input type="text" class="form-control" id="cellNoInput" placeholder="숫자만 입력해주세요">
		    <div class="valid" id="cellValid"></div>
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">아이디</label>
		    <input type="text" class="form-control" id="idInput">
		    <div class="valid" id="idValid"></div>
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="pwInput">
		   	<div class="valid" id="pwValid"></div>
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">비밀번호 확인</label>
		    <input type="password" class="form-control" id="pwInput2">
		    <div class="valid" id="pwConfirmValid"></div>
		  </div>
		  <button type="button" id="submitBtn" class="btn btn-primary">회원가입</button>
		</form>
	</div>
	<div class="container" id="loginPagedo" style="margin-top:15px;">
		<h4>로그인</h4>
	</div>
	<jsp:include page="include/info_modal.jsp"></jsp:include>
</body>
<script>

	//로그인 페이지로 이동
	$('#loginPagedo').on('click', function(){
		location.href = "${pageContext.request.contextPath }/home.do";
	});

	// 교회코드 검증
	$('#inputChurchCode').on('keyup',function(){ // keydown으로 하면 이전입력까지만 전달된다. keyup으로 하는게 맞다
		
		let churchCode = $('#inputChurchCode').val();
		
		
		$.ajax({
			url:"${pageContext.request.contextPath }/signup/churchcode.do",
			method:"POST",
			data:{
				church_code : churchCode
			},
			success:function(response){
				if(response == 'Y'){ // 존재하는 교회코드면
					$('#inputChurchCode').attr('class', 'form-control is-valid');
					$('#chruchCodeValid').attr('class', 'valid-feedback');
					$('#chruchCodeValid').text('유효한 교회코드입니다.');
				} else { // 존재하지 않는 교회코드면
					$('#inputChurchCode').attr('class', 'form-control is-invalid');
					$('#chruchCodeValid').attr('class', 'invalid-feedback');
					$('#chruchCodeValid').text('유효하지 않은 교회코드입니다.');
				}
			}
		})
		
	});

	// 교인 검색
	$('#userSearchDataList').on('keyup',function(){
		
		$('#userList').empty(); 
		
		let churchCode = $('#inputChurchCode').val();
		let typingContent = $('#userSearchDataList').val();
		
		$.ajax({
			url:"${pageContext.request.contextPath }/signup/godPeopleSearch.do",
			method:"POST",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
			data:{
				church_code : churchCode,
				god_people_name : typingContent
				
			}, 
			success:function(response) {
				response.forEach(function(value, index){ //  object에서 값 꺼내올때 -> object["key"]
					$('#userList').append($('<option value="' + value["god_people_name"] + ' ' + value["birthday"] + '"> </option>'));					
				});
			}
		});
	});
	
	
	// 아이디 중복검사 및 유효성 검사
	$('#idInput').on('input',function(){
		
		let idInput = $('#idInput').val();
		
		// 정규표현식
		let reg_id = /^[a-z]+[a-z0-9]{5,19}$/g;
		// 유효성검사
		let isIdValid = reg_id.test(idInput);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/signup/idDuplicateTest.do",
			method:"POST",
			data:{
				id: idInput
			}, // 컨트롤러에서 리턴타입이 String일때 ajax에서 dataType을 json으로 해주면안됨 그래서 생략
			success:function(response) {
				
				console.log(response);
				
				if(response == 'Y' || isIdValid == false){ // 중복아이디가 존재하거나 정규표현식에 안맞을경우
					$('#idInput').attr('class', 'form-control is-invalid');
					$('#idValid').attr('class', 'invalid-feedback');
					$('#idValid').text('사용불가능한 아이디입니다.');
				} else if(response == '' && isIdValid == true) {
					$('#idInput').attr('class', 'form-control is-valid');
					$('#idValid').attr('class', 'valid-feedback');
					$('#idValid').text('사용가능한 아이디입니다.');
				}
			}
		});
		
	});
	
	
	// 휴대폰 번호 유효성 검사
	$('#cellNoInput').on('input',function(){
		
		let cellNo = $('#cellNoInput').val();
		
		//정규표현식
		let reg_cellno = /[0-9]{10,12}/;
		
		let isCellValid = reg_cellno.test(cellNo);
		
		if(isCellValid == true){ // 유효성 통과
			$('#cellNoInput').attr('class', 'form-control is-valid');
			$('#cellValid').attr('class', 'valid-feedback');
			$('#cellValid').text('사용가능한 전화번호입니다.');
		} else {
			$('#cellNoInput').attr('class', 'form-control is-invalid');
			$('#cellValid').attr('class', 'invalid-feedback');
			$('#cellValid').text('사용불가능한 전화번호입니다.');
		}
	});
	
	
	// 비밀번호 검사
	$('#pwInput').on('input',function(){
		
		let inputPw = $('#pwInput').val();
		
		let reg_pw = /^[A-Za-z0-9]{6,12}$/; // 숫자와 문자 포함 6-12자리 비번 정규식
		
		let isPwValid = reg_pw.test(inputPw);
		
		if(isPwValid == true){ // 유효성 통과
			$('#pwInput').attr('class', 'form-control is-valid');
			$('#pwValid').attr('class', 'valid-feedback');
			$('#pwValid').text('사용가능한 비밀번호입니다.');
		} else {
			$('#pwInput').attr('class', 'form-control is-invalid');
			$('#pwValid').attr('class', 'invalid-feedback');
			$('#pwValid').text('6자리 이상 12자리 이내 숫자와 문자가 포함되도록 작성해주세요.');
		}
		
	});
	
	// 비밀번호 확인 검사
	$('#pwInput2').on('input',function(){
		let inputPw = $('#pwInput2').val();
		
		if(inputPw == $('#pwInput').val()){ // 비밀번호와 비밀번호확인이 같다면
			$('#pwInput2').attr('class', 'form-control is-valid');
			$('#pwConfirmValid').attr('class', 'valid-feedback');
			$('#pwConfirmValid').text('비밀번호가 일치합니다.');
		} else {
			$('#pwInput2').attr('class', 'form-control is-invalid');
			$('#pwConfirmValid').attr('class', 'invalid-feedback');
			$('#pwConfirmValid').text('비밀번호가 일치하지 않습니다.');
		}
	});
	
	// 회원가입 검증
	$('#submitBtn').on('click', function(){
		
		let church_code_valid = ($('#chruchCodeValid').attr('class') == 'valid-feedback') ? true : false;
		let cell_valid = ($('#cellValid').attr('class') == 'valid-feedback') ? true : false;
		let id_valid = ($('#idValid').attr('class') == 'valid-feedback') ? true : false;
		let pw_valid = ($('#pwValid').attr('class') == 'valid-feedback') ? true : false;
		let pw_confirm_valid = ($('#pwConfirmValid').attr('class') == 'valid-feedback') ? true : false;
		
		if(church_code_valid & cell_valid & id_valid & pw_valid & pw_confirm_valid){
			doSignUp();
		} else {
			show('가입조건을 모두 입력해주세요.');
		}
	});
	
	// 회원가입
	function doSignUp(){
		
		let churchCode = $('#inputChurchCode').val();
		let cellNo = $('#cellNoInput').val();
		let idIn = $('#idInput').val();
		let pwIn = $('#pwInput').val();
		
		let userSearchData = $('#userSearchDataList').val();
		let arr = userSearchData.split(" ");
		
		let name = arr[0];
		let birth = arr[1];
		
		$.ajax({
			url:"${pageContext.request.contextPath }/signup/signup.do",
			method:"POST",
			data:{
				church_code : churchCode,
				cell_no : cellNo,
				id : idIn,
				pw : pwIn,
				god_people_name : name,
				birthday : birth
			}, // 컨트롤러에서 리턴타입이 String일때 ajax에서 dataType을 json으로 해주면안됨 그래서 생략
			success:function(response) {
				
				switch(response){
					case "SUCCESS":
						show("회원가입을 축하드립니다!!");
						
						// 확인누르면 로그인페이지로 이동
						$('#confirmBtn').on('click',function(){
							location.href = "${pageContext.request.contextPath }/home.do";
						});
						break;
					case "FAIL":
						show("일치하는 인적사항이 \n없습니다. 교인검색을 확인해주세요");
						break;
					case "ERROR":
						show("시스템오류입니다. \n관리자에게 문의하세요.");
						break;
				}
				
			}
		});
		
	}
	
</script>
</html>
