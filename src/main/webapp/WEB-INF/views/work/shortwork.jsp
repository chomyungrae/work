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

<style>
section{
 height:800px;
 margin-top:100px;
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

<link href="<c:url value="/resources/css/short_work.css" />" rel="stylesheet"> <!--  css 불러오기 -->
</head>
<body>
	<section>
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
					<li><a href="shortwork" class="dayTotal">전체</a></li>
					<li><a href="shortwork?day=1" class="day">월</a></li>
					<li><a href="shortwork?day=2" class="day">화</a></li>
					<li><a href="shortwork?day=3" class="day">수</a></li>
					<li><a href="shortwork?day=4" class="day">목</a></li>
					<li><a href="shortwork?day=5" class="day">금</a></li>
					<li><a href="shortwork?day=6" class="day">토</a></li>
					<li><a href="shortwork?day=0" class="day">일</a></li>
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
	   <c:forEach items="${list}" var="wvo">
	   <tr>
	    <td>${wvo.workday}</td>
	    
	    <c:if test="${wvo.day==0}"> <c:set var="dday" value="일"/></c:if>
	     <c:if test="${wvo.day==1}"> <c:set var="dday" value="월"/> </c:if>
	     <c:if test="${wvo.day==2}"><c:set var="dday" value="화"/></c:if>
	     <c:if test="${wvo.day==3}"><c:set var="dday" value="수"/></c:if>
	     <c:if test="${wvo.day==4}"><c:set var="dday" value="목"/></c:if>
	     <c:if test="${wvo.day==5}"><c:set var="dday" value="금"/></c:if>
	    <c:if test="${wvo.day==6}"><c:set var="dday" value="토"/></c:if>
	  <td>${dday}</td>
	  
	  
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
	
<div id="pageNum">
<div class="page_wrap">
   <div class="page_nation">
   
   <!-- 10페이지 단위로 이전 이동하기 -->
  <c:if test="${pstart!= 1}"> <!--  첫번째 그룹이 아닐때는-->
  <a class="arrow pprev" href="shortwork?page=${pstart-1}&pcnt=${pcnt}&day=${day}"></a>
  </c:if>
   <!-- 1페이지 단위로 이전으로 가기  => 현재페이지에서 1을 뺀 페이지로 이동-->
    <c:if test="${page!=1}">
     <a class="arrow prev" href="shortwork?page=${page-1}&pcnt=${pcnt}&day=${day}"></a>
   </c:if>
   
 <c:forEach begin="${pstart}" end="${pend}" var="i">
   <!-- 현재 페이지의 색 -->
     <c:if test="${page == i}"> <!-- 출력되는 페이지가 현재페이지와 같다면-->
      <a class="active" href="shortwork?page=${i}&pcnt=${pcnt}&day=${day}">${i}</a>
     </c:if>
      
     <c:if test="${page != i }"> <!-- 출력되는 페이지가 현재페이지와 다르다면 -->
       <a href="shortwork?page=${i}&pcnt=${pcnt}&day=${day}">${i}</a>  
     </c:if>
 </c:forEach>
 
   <!--1페이지 단위로 다음 이동하기-->
      <c:if test="${page!=chong}"> <!-- 현재페이지가 마지막페이지가 아니라면 -->
      <a class="arrow next" href="shortwork?page=${page+1}&pcnt=${pcnt}&day=${day}"></a> 
      </c:if>
      <!-- 10페이지 단위로 다음 이동하기 -->  
      <c:if test="${chong != pend}">    <!-- 현재 출력되는 페이지 그룹이 마지막이 아닐경우 -->  
     <a class="arrow nnext" href="shortwork?page=${pend+1}&pcnt=${pcnt}&day=${day}"></a>
      </c:if> 
     
 
 
 </div></div>
</div>	
</div>
<style>
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#f8f8f8 url('../resources/main/page_pprev.png') no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#f8f8f8 url('../resources/main/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('../resources/main/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#f8f8f8 url('../resources/main/page_nnext.png') no-repeat center center;
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
 #pageNum{
  width:80%;
  margin:auto;
 height:50px;
 padding-top:30px;
 text-align:center;
 /* background:pink; */
 }

</style>

</section>
</body>
</html>