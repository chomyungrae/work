<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 section {
  width:80%;
  height:60%;
  margin:auto;
  /* background:#eeeeee; */
 }
 section #content{
  width:100%;
  margin:auto;
  height:500px;
  margin-top:50px;
 
 }
 section #content table{
 width:800px;
 height:427px;
  border-collapse :collapse;
 border-top:3px solid black;
 }
 section #content table td{
  border-top:1px solid #D7D7D7;

 }
   section #content table td:first-child{
    width:150px;
    text-align:center;
    background:#eeeeee;
   }
   section #content table td:last-child{
    width:400px;
    padding-left:20px;
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
#detail{
 width:800px;
 height:700px;
 margin:auto;
 display:none;
 border:1px solid black;
 text-align:center;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

 $(function(){
	 $("#view").click(function(){
		 $("#detail").slideToggle();
	 });
	
 });
 
 function apply(){
  
	 if(confirm("${wvo.workday}일 ${wvo.workname} 근무를 신청하시겠습니까?")){
		
			 {
		   alert("   신청완료\n담당자 확인 후 연락드리겠습니다");
		   location="../work/apply?wid=${wvo.id}";
			 }
	 }
	 else{
		 return false;
		 
	 }

 }
</script>
</head>
<body>
 <section>
   <div id="content">
    <table align="center">
     <caption align="left"><h2>모집내용</h2></caption>
     <tr>
      <td>모집인원</td>
      <td>${wvo.inwon}명</td>
     </tr>
     <tr>
      <td>근무일</td>
      <td>${wvo.workday}</td>
     </tr>
     <tr>
      <td>근무지</td>
      <td>${wvo.workname}</td>
     </tr>
     <tr>
      <td>근무시간</td>
      <td>${wvo.start_time}~${wvo.close_time}</td>
     </tr>
     
     <tr>
      <td>성별</td>
      <c:if test="${wvo.gender==0}">
	      <c:set var="gender" value="무관"/>
	     </c:if>
	     <c:if test="${wvo.gender==1}">

	      <c:set var="gender" value="남자"/>
	     </c:if>
	     <c:if test="${wvo.gender==2}">
	      <c:set var="gender" value="여자"/>
	     </c:if>
      <td>${gender}</td>
     </tr>
     
     <tr>
      <td>급여</td>
      <td>
      <c:if test="${wvo.paytype==0}"> <!-- 급여: 일당 일경우-->
	       <span id="daypay">일급</span>
	      </c:if>
	      <c:if test="${wvo.paytype==1}"> <!-- 급여: 시급 일경우-->
	       <span id="hourpay">시급</span>
	      </c:if>
      \<fmt:formatNumber value="${wvo.pay}"/>원</td>
     </tr>
     <tr>
      <td>근무위치</td>
      <td>${wvo.workplace}</td>
     </tr>
  
    <tr>
     <td colspan="2" align="center">
       <span id="view"> 상세설명</span> | <a href="../main/home">목록 </a>  | <span onclick="apply()">신청하기</span>  
     </td>
     
    </table>
    </div>
    <div id="detail">${wvo.content}</div>
    
   
 </section>
</body>
</html>