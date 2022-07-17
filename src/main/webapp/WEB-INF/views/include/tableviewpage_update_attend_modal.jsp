<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="background">
  <div class="window">
    <div class="popup">
    	<div class="content">
    		<div><!-- 출석대상자 이름 의 날짜 출석을 수정합니다. -->
    			<p id="messageU" style="margin-bottom:6px; font-size:14px;"></p>
    		</div>
    		<div class="buttons"><!-- 결석 지각 출석 버튼 -->
    			<button type="button" id="secondary" class="btn btn-outline-secondary">✔</button><!-- 결석 -->
				<button type="button" id="warning" class="btn btn-outline-warning">✔</button><!-- 지각 -->
				<button type="button" id="success" class="btn btn-outline-success">✔</button><!-- 출석 -->
    		</div>
    		<div style="padding-top:10px;"><!-- 수정하기 버튼 -->
    			<button type="button" id="submit" class="btn btn-primary">수정하기</button>
    		</div>
    	</div>
    </div>
  </div>
</div>