<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 80%;
	height: 1000px;
	margin: auto;
}

section #top {
	text-align: center;
	padding-top: 50px;
	height: 60px;
	width: 80%;
	margin: auto;
	font-size: 25px;
	font-weight: bold;
}

section table {
	border-top: 3px solid black;

	text-align: center;
	border-collapse: collapse;
}

section table tr:first-child td {
	
	height: 80px;
	padding-top:20px;
}

section table td{

	border-bottom: 2px solid #eeeeee;
}
section table .last td{
	border-bottom: 2px solid black;
}
section table tr:last-child td{

 border:0px;
}
section .right{
 float: right;

}
</style>
</head>
<body>
	<section>
	<div id="top">공지사항</div>
	<table width="1200" align="center">
		<tr>
          <td>
          <b>${nvo.title}</b> <br>
           <div class="right">등록일 ${nvo.writeday} | ${nvo.state} | 조회수 ${nvo.readnum}</div> 
          </td>
		</tr>
		<tr height="400" class="last">
		 <td>${nvo.content }</td>
		</tr>
	
	<!-- 이전글,다음글 -->
	
	<c:if test="${!empty prev_id}">
	<tr height="50">
	  <td align="left"><b>▲ 이전글</b><span class="next"><a href="notice_content?id=${prev_id}">$z</a></span></td>
	</tr>
	</c:if>
	<c:if test="${!empty next_id}">
	<tr height="50">
	  <td align="left"><b>▼ 다음글</b><span class="next"><a href="notice_content?id=${next_id}">zz</a></span></td>
	</tr>
	</c:if>
	<tr height="120">
	 <td> <span id="home"><a href="notice_list">목록</a></span></td>
	</tr>

	
	
	</table>
	</section>
</body>
</html>