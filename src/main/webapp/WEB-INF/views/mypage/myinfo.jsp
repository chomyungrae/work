<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
  width:80%;
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

</style>
</head>
<body>
<section>
 <div id="myTab">
 <a class="tab" href="myinfo">회원정보</a><a class="tab" href="information">이력서관리</a><a class="tab" href="my_apply">신청내역</a>
  </div>
 <div id="tb"> 
  <table width="800" align="center">
  <tr>
    <td> * 아이디 </td>
    <td>${mvo.userid} </td>
  </tr>
  <tr>
    <td>* 이름 </td>
    <td>${mvo.name }</td>
  </tr>
  <tr>
   <td>* 생년월일 </td>
   <td>${mvo.ymd }</td>
  </tr>
  <tr>
   <td>* 전화번호 </td>
   <td>${mvo.phone }</td>
  </tr>
 <c:if test="${empty mvo.email}">
  <tr> 
    <td> 이메일 (선택) </td>  
    <td> X </td>
  </tr>
 </c:if>
  <c:if test="${!empty mvo.email}">
  <tr> 
    <td> 이메일 (선택) </td>  
    <td>${mvo.email }</td>
  </tr>
  </c:if>
  <tr>
   <td colspan="2" align="center">
   <a href="pwd_change"> 비밀번호변경</a> | 
   <a href="my_update"> 수정하기 </a>   |  
   <a href="member_out"> 회원탈퇴 </a>
   </td>
  </tr>
 </table>
</div>
</section>
</body>
</html>