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
	height: 700px;
    margin: auto;
}
section #top{
text-align: center;
 padding-top:50px;
 height:60px;
 width:80%;
 margin: auto;
 font-size:25px;
 font-weight: bold;
}
section table{
border-top:3px solid black;
text-align: center;
border-collapse: collapse;
}
section table tr:first-child td{
background: #eeeeee;
height:50px;
}
section table td{
height:30px;
border-bottom: 1px solid silver;
}
</style>
</head>
<body>
	<section>
  <div id="top">
    공지사항
  </div>
  <div>
	<table width="1200" align="center">
		<tr>
			<td width="200">등록일</td>
			<td width="150">분류</td>
			<td width="750">제 목</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach items="${list}" var="nvo">
			<tr>
				<td>${nvo.writeday}</td>
				<td>${nvo.state}</td>
				<td><a href="notice_readnum?id=${nvo.id}">${nvo.title }</a></td>
				<td>${nvo.readnum }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	</section>
</body>
</html>