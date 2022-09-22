<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<c:set var="height" value="${wlist.size()*48}"/>
<style>
section{
 height:${height}px;
}
#daypay{
 width:auto;
 height:auto;
 padding:3px;
 background:#65FF5E;
 font-size:14px;
 font-weight:bold;
}
 #hourpay{
 width:auto;
 height:auto;
 padding:3px;
 background:yellow;
 font-size:14px;
 font-weight:bold;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		function mainmove() {
			ss = setInterval(function() {
				$("#fourth #inner").animate(
						{
							marginLeft : "-1440px"
						},
						3000,
						function() {
							$("#fourth #inner").css("margin-left", "0px");
							$("#fourth #inner img").eq(0).insertAfter(
									$("#fourth #inner img").eq(1));
						});
			}, 6000);
		}
		mainmove();

		//멈추기
		$("#fourth #inner").mouseover(function() {
			clearInterval(ss);
		});
		$("#fourth #inner").mouseout(function() {
			mainmove();
		});
	});
	
	
	
	
	</script>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"> <!--  css 불러오기 -->
</head>
<body>
	<section>
	<div id="fourth">
		<div id="inner">
			<img src="../resources/main/3.jpg" width="1440" height="300"><img src="../resources/main/4.jpg" width="1440" height="300">
		</div>
	</div>

	<style>

</style>
<div id="list">
   <div id="tab">
			<div class="left">
				<ul>
					<li><a href="#none" class="tabBtn">하루알바 /일당지급</a></li>
					<li><a href="#none" class="tabBtn">장단기 채용정보</a></li>
				</ul>
			</div>
			<div class="right">
				<ul>
					<li><a href="home" class="dayTotal">전체</a></li>
					<li><a href="home?day=1" class="day">월</a></li>
					<li><a href="home?day=2" class="day">화</a></li>
					<li><a href="home?day=3" class="day">수</a></li>
					<li><a href="home?day=4" class="day">목</a></li>
					<li><a href="home?day=5" class="day">금</a></li>
					<li><a href="home?day=6" class="day">토</a></li>
					<li><a href="home?day=0" class="day">일</a></li>
				</ul>
			</div> 
	</div>
	<div id="worklist">
	  <table align="center">
	   <tr>
	   <td>날짜</td><td>요일</td>
	   <td>근무지</td><td>위치</td>
	   <td>모집내용</td><td>근무시간</td>
	   <td>인원</td><td>성별</td><td>시급/일급</td><td>상태</td>	   
	   </tr>
	   <!-- 알바리스트 출력부분 -->
	   <c:forEach items="${wlist}" var="wvo">
	   <tr>
	    <td>${wvo.workday}</td>
	    
	    <c:if test="${wvo.day==0}"> <c:set var="day" value="일"/></c:if>
	     <c:if test="${wvo.day==1}"> <c:set var="day" value="월"/> </c:if>
	     <c:if test="${wvo.day==2}"><c:set var="day" value="화"/></c:if>
	     <c:if test="${wvo.day==3}"><c:set var="day" value="수"/></c:if>
	     <c:if test="${wvo.day==4}"><c:set var="day" value="목"/></c:if>
	     <c:if test="${wvo.day==5}"><c:set var="day" value="금"/></c:if>
	    <c:if test="${wvo.day==6}"><c:set var="day" value="토"/></c:if>
	  <td>${day}</td>
	  
	  
	    <td>${wvo.workname}</td>
	    <td>${wvo.workplace}</td>
	    <td><a href="../work/work_content?id=${wvo.id}">${wvo.content}</a></a></td>
	    <td>${wvo.start_time}~${wvo.close_time}</td>
	    <td>${wvo.inwon}명</td>
	    <td>
	     <c:if test="${wvo.gender==0}">
	      <c:set var="gender" value="무관"/>
	     </c:if>
	     <c:if test="${wvo.gender==1}">

	      <c:set var="gender" value="남자"/>
	     </c:if>
	     <c:if test="${wvo.gender==2}">
	      <c:set var="gender" value="여자"/>
	     </c:if>
	     
	    ${gender}
	    </td>
	    
	    <td>
	      <c:if test="${wvo.paytype==0}"> <!-- 급여: 일당 일경우-->
	       <span id="daypay">일</span>
	      </c:if>
	      <c:if test="${wvo.paytype==1}"> <!-- 급여: 시급 일경우-->
	       <span id="hourpay">시</span>
	      </c:if>
	    \<fmt:formatNumber value="${wvo.pay}"/>원 </td></td>
	   
	    <c:if test="${wvo.state==0}">
	      <c:set var="state" value="모집"/>
	     <td><span id="state0">${state}</span> </td>
	     </c:if>
	     <c:if test="${wvo.state==1}">
	      <c:set var="state" value="마감"/>

	       <td><span id="state1">${state}</span> </td>
	     </c:if>
	    
	   
	   </tr>
	   </c:forEach>
	  </table>
	</div>
</div>
</section>
</body>
</html>