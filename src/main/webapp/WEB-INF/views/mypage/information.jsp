<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/myinfo.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<link href="<c:url value="/resources/css/information.css" />" rel="stylesheet"> <!--  css 불러오기 -->
<style>
section {
	width: 80%;
	height: 1200px;
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
  height:740px;
 
 
 }
 #tb table{
  border-top:3px solid #3d88eb;
   border-spacing: 0 10px;
   margin-top:20px;
 }
 #tb table tr:first-child td{
  border-top:0px;
 }
 #tb table td:first-child{
   width:150px;
   border-top:1px solid #3d88eb;
   font-weight:bold;
   text-align:center;
 }
  #tb table td:last-child{
   padding-left:40px; text-align:center;
  }
#tb table td{
  padding-top:5px;
  height:50px;
  
 }
#tb table input{
 width:300px;
 height:30px;
 margin-left:10px;
}
#tb table select{
 width:120px;
 text-align:center;
 height:30px;
}

.chu{
 font-size:25px;
}

#tb2{


}
#tb2 caption{
 margin-bottom:10px;
}
#tb2 #left{
 float:left;
 font-weight:bold;
 font-size:25px;
 padding-left:10px;

}
#tb2 input[type=date]
{
width:150px;
}
 section #end{

 width:60%;
 height:50px;
  margin:auto;
  text-align:center;
 }
 section #end input{
  width:400px;
  height:50px;
  font-size:22px;
 }

</style>
<script>
 
 onload=function(){
	 <c:if test="${empty ivo.bank}">
	  document.pom.bank.value=="0";
	 </c:if>
	 <c:if test="${!empty ivo.bank}">
	  document.pom.bank.value="${ivo.bank}";
	 </c:if>
 	 
 }
 
 function form_add() // 경력사항 추가 최대3개
 {
	 var tb2=document.getElementsByClassName("tb2");
	 var len=tb2.length
	 len++;
	 var inner=document.getElementById("aa").innerHTML;	
    document.getElementById("outer").innerHTML=document.getElementById("outer").innerHTML+inner;
   
 }
  function form_del()
  {
	  var len=document.getElementsByClassName("tb2").length;
      if(len >1)
    	  {
    	  len--; // 배열 인덱스는 0부터시작이므로 1하나뺴줌
          document.getElementsByClassName("tb2")[len].remove(); // 삭제
    	  }
  }
</script>
</head>
<body>
<section>
 <div id="myTab">
 <a class="tab" href="myinfo">회원정보</a><a class="tab" href="information">이력서관리</a><a class="tab" href="my_apply">신청내역</a>
  </div>

 <div id="tb"> 
  <form method="post" name="pom" action="info_input_ok">
  <table id="tb1" width="800" align="center">
  <caption><h3 align="left" class="chu">추가사항</h3></caption>
  <tr>
   <td>지급받으실 계좌</td>
   <td>
   <select name="bank">
    <option value="0">선택</option><option>신한</option><option>우리</option><option>국민</option><option>농협</option>
   </select>
    <input type="text" name="account" placeholder="계좌번호" value="${ivo.account}">
   </td>  
  </tr>
   <tr>
   <td>학력사항</td>
   <td><select>
   <option>대학교재학중</option><option>대학교졸업</option><option>고등학교졸업</option><option>중학교졸업</option>
  </select> 
     &nbsp;&nbsp;학교명 <input type="text">
  </td>
  </tr>
  <tr>
   <td>이력서 제목</td>
   <td><input type="text" name="info_title" value="${ivo.info_title}"></td>
  </tr>
  <tr>
   <td>내용(간단히)</td>
   <td><textarea cols="40" rows="4" name="info_content">${ivo.info_content}</textarea></td>
  </tr>
 </table>
  
  <div id="outer">
  <div id="aa">
    <table class="tb2" id="tb2" width="800" align="center">
  <caption><span id="left">경력사항<font size="3px">(근무경력 있는 분만 작성)</font></span>
  <span class="add" onclick="form_add()">+경력추가</span></caption>
   <tr>
   <td>회사명</td>
   <td><input type="text" name="company"></td>
  </tr>
   <tr>
   <td>직무내용</td>
   <td><input type="text" name="job"></td>
  </tr>
  <tr>
   <td>근무기간</td>
   <td>
   <input type="date" name="start_day">~<input type="date" name="end_day">
   </td>
  </tr>
  <tr>
   <td colspan="2" align="center" height="80">
   <input class="del" type="button" onclick="form_del()" value="삭제"></td> 
  </tr>
    </table>
   </div>
  </div>


</div>
 <div id="end"><input type="submit" value="작성"></div>
</form>
</section>
</body>
</html>