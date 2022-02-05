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
	}

</style>
</head>
<body>
	<div class="main_header">
		<p>출결관리</p>
		<i class="material-icons">more_horiz</i><!-- 개인메뉴 버튼 -->
	</div>

	<jsp:include page="../include/info_modal.jsp"></jsp:include>
</body>
</html>