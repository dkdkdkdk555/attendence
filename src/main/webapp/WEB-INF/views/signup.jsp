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
		  			<input class="form-control" list="userList" id="userSearchDataList" placeholder="">
		  			<datalist id="userList"></datalist>
		  		</div>
		  	</div>
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">연락처</label>
		    <input type="text" class="form-control" id="cellNoInput">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">아이디</label>
		    <input type="text" class="form-control" id="idInput">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="pwInput">
		  </div>
		  <div class="inputdiv">
		    <label class="form-label">비밀번호 확인</label>
		    <input type="password" class="form-control" id="pwInput2">
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
				
			}, // 컨트롤러에서 리턴타입이 String일때 ajax에서 dataType을 json으로 해주면안됨 그래서 생략
			success:function(response) {
				response.forEach(function(value, index){ //  object에서 값 꺼내올때 -> object["key"]
					$('#userList').append($('<option value="' + value["god_people_name"] + ' ' + value["birthday"] + '"> </option>'));					
				});
			}
		});
	});
	
	// 로그인 페이지로 이동
	$('#loginPagedo').on('click', function(){
		location.href = "${pageContext.request.contextPath }/home.do";
	});
	
	// validate.js 라이브러리
	$(document).ready(function () { 
		//영문숫자만
	    jQuery.validator.addMethod("alphanumeric", function (value, element) {
	        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
	    });
	    // validate signup form on keyup and submit
	    $('#signupForm').validate({
	        errorPlacement: function(error, element) {
	        	if(element.is(":checkbox")){
	        		element.parent().after(error);
	        	}else{
	        		element.after(error);
	        	}
	        },
	    	rules: {
	            loginId:{
	            	required:true, 
	            	minlength:5, 
	            	maxlength:10, 
	            	alphanumeric: true,
		            remote : {            	
					    url : '${pageContext.request.contextPath }/v1/users/signup',
					    type : "get",
					    data : {
					    	loginId : function() {
					    		return $("#signupId").val(); //
					    	}
					    }
					    
		            }
	            },
	            pwd: {required:true, minlength:5, maxlength:10},
	            pwd2: {required:true, equalTo:'#signupPwd'},               // 
	            email: {required:true, email:true},
	            chk_care: 'required',
	            terms: 'required'
	        },
	        messages: {
	            loginId: {
	                 required:"필수 입력 항목입니다.",
	                 minlength: "영문 소문자 5~10글자 이내로 입력해 주세요.",
	                 maxlength: "비밀번호를 최대 10자 이내로 입력해 주세요.",
	                 alphanumeric: "영문이나 숫자로만 입력해 주세요.",
	                 remote : "이미 존재하는 아이디 입니다."
	                 },
	            pwd:"필수 입력 항목입니다.",
	            pwd2: {
	                required: "필수 입력 항목입니다.",
	                minlength: "영문 소문자 5~10글자 이내로 입력해 주세요.",
	                maxlength: "비밀번호를 최대 10자 이내로 입력해 주세요.",
	                equalTo: "암호를 다시 확인하세요" 
	                },
	            email: {
	                required:"필수 입력 항목입니다.",
	                email: "이메일 형식으로 입력해 주세요."
	                },
	            chk_care: "필수 입력 항목",
	            terms: "※&nbsp;이용약관에 동의해 주세요."
	        } 
	    });
	    
	});
	
</script>
</html>
