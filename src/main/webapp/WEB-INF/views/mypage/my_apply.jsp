<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/myinfo.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<style>
section {
	width: 80%;
	height: 800px;
	margin: auto;
	/* background:#eeeeee; */

    
}
 section a{
  text-decoration:none;
  color:black;
 }
 #myTab{
 margin:auto;
 margin-top:100px;
 width:800px;
 height:60px;
/*  
 background: yellow; */
  }
 
 #tb
 {
 margin:auto;
  width:100%;
  height:400px;
 
 
 }
 #tb table{
  border-top:3px solid #3d88eb;
   border-spacing: 0 10px;
 
 }
 #tb table tr:first-child td{
  border-top:0px;
 }
 #tb table td:first-child{
   width:150px;
   border-top:1px solid #3d88eb;
   font-weight:bold;
 }
  #tb table td:last-child{
   text-align:center;
  }
#tb table td{
  padding-top:5px;
  height:50px;
 }

#old{
 text-decoration:line-through;
 background:#eeeeee;
}
</style>
</head>
<body>
<section>
<div id="myTab">
 <a class="tab" href="myinfo">회원정보</a><a class="tab" href="information">이력서관리</a><a class="tab" href="my_apply">신청내역</a>
  </div>
 <div id="tb"> 
  <table width="1000" align="center">
   <tr>
    <td>근무일</td>
    <td>근무지</td>  
    <td>모집내용</td>
    <td>근무시간</td>
    <td>시급/일급</td>
    <td>상태</td>
   </tr>
   <c:forEach items="${list}" var="wvo">
    <c:if test="${wvo.state==1}">
       <c:set var="old" value="id='old'"/>
     </c:if>
     <c:if test="${wvo.state==0}">
       <c:set var="old" value=""/>
     </c:if>
    <tr ${old}>
     <td>${wvo.workday}</td>
     <td><a href="../work/work_content?id=${wvo.id}">${wvo.workname}</a></td>
     <td><a href="../work/work_content?id=${wvo.id}">${wvo.content}</a></td>
     <td>${wvo.start_time}~${wvo.close_time}</td>
     <td>
        <c:if test="${wvo.paytype==0}"> <!-- 급여: 일당 일경우-->
	       <span id="daypay">일</span>
	      </c:if>
	      <c:if test="${wvo.paytype==1}"> <!-- 급여: 시급 일경우-->
	       <span id="hourpay">시</span>
	      </c:if>
	    \<fmt:formatNumber value="${wvo.pay}"/>원
      </td>
     
     <td>
       <c:if test="${wvo.astate==1}">
         <b> 신청</b>
       </c:if>
        <c:if test="${wvo.astate==2}">
         <b> 신청확인</b>
       </c:if>  
     </td> 
     
   </tr>
    
   </c:forEach>
 </table>

</div>
</section>
</body>
</html>