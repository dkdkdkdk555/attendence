<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="carousel">
  <div class="button" onclick="shiftLeft()"><img src="https://image.ibb.co/mRsEb7/left_arrow.png" alt=""></div>
  <div class="cards-wrapper">
  <c:choose>
  	<c:when test="${not empty sellList}">
  		<ul class="cards__container">
	          <li class="box">box 1</li>
	          <li class="box">box 2</li>
	          <li class="box">box 3</li>
	          <li class="box">box 4</li>
	          <li class="box">box 5</li>
	          <li class="box box--hide">box 6</li>
	    </ul>
  	</c:when>
  	<c:otherwise>
  	
  	</c:otherwise>
  </c:choose>
  </div>
  <div class="button" onclick="shiftRight()"><img src="https://image.ibb.co/dfPSw7/right_arrow.png" alt=""></div>
</div>