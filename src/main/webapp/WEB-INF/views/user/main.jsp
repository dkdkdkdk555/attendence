<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../include/resource.jsp"></jsp:include>
<meta content="text/html; charset=UTF-8">
<title>main.do</title>
<style>
	body{
		background-color: #F0F5F5; 		
		font-family: 'Spoqa Han Sans Neo', 'sans-serif';	
	}
	
	.main_header{
		display: flex;
		justify-content: space-around;
		align-items: center;
		background-color: #FFFFFF;
		height: 8%;
	}
	
	#main_text{
		flex-grow:1;
		text-align:center;
		margin-top:auto;
		margin-bottom:auto;	
		font-size: 20px;	
		margin-left:40px;
	}
	
	#personal_btn{
		margin-right:10px;
		color: #808080;
		
	}
	
	

</style>
</head>
<body>
	<div class="main_header">
		<p id="main_text">부서정보</p>
		<i class="material-icons" id="personal_btn">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>

	<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
</html>