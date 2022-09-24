<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
	width: 1800px;
	height: 1200px;
	margin: auto;
}

a {
	color: black;
	text-decoration: none;
}

#first {
	width: 80%;
	height: 35px;
	background: #2d2d2d;
	margin: auto;
	color:white;
}
#first a{
color:white;
 }

#first #right {
	float: right;
	margin-right: 10px;
	padding-top: 3px;
}

#second {
	width: 80%;
	height: 100px;
	margin: auto;
}

#second .logo {
	float: left;
	width: 250px;
	height: 100px;
	background: blue;
}

#second .search {
	width: 100%;
	height: 80px;
	padding-top: 30px;
	text-align: center;
	margin-left:-50px;
}

#second .search input[type=text] {
	width: 500px;
	height: 40px;
	border-radius:20px;
	background:#eeeeee;
	padding-left:20px;
	border:3px solid black;
	
}
input::placeholder{
 text-align:center;
  font-style: italic;
}
/* ㅡㅡㅡㅡㅡㅡ */
#topMenu {
	height:60px;
	width:84%;
	margin:auto;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float:left;
	line-height: 60px;
	vertical-align: middle;
	text-align: center;
	margin-left:0px;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width:287px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}

footer {
	height: 150px;
	width: 80%;
	margin: auto;
	background: black;
	color: white;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
  $(function()
  {
	   $("#topMenu").mouseover(function(){
		   $("").show(); 
	   });
  });
 </script>
<decorator:head />
</head>
<body>
	<div id="first">
		<div id="right">
		  <c:if test="${userid == null}">
			<a href="../member/login">로그인</a> | <a href="../member/member_input">
				회원가입 </a> |
	         </c:if>
	      <c:if test="${userid != null}">
	      ${name} 님
	       <a href="../mypage/myinfo">MY</a> |
	       <a href="../logout"> 로그아웃</a>    
	      </c:if>
	          <b onclick="alert('Ctrl+D키를 누르시면 즐겨찾기에 추가됩니다')">＃ 즐겨찾기</b>
		</div>
	</div>

	<div id="second">
		<div class="logo">
			<a href="../main/home"><img src="../resources/main/logo.png"
				width="250" height="100"></a>
		</div>
		<div class="search">

		  <input type="text" name="search" placeholder="검색어"> <br>
			#여의도 #일산
	    
		</div>
	</div>


	<div id="topMenu">
	<ul>
	    <li><a class="menuLink" href="../work_mywork"> 맞춤알바 </a></li>
		<li><a class="menuLink" href="../work/shortwork">일일 알바정보</a></li>
		<li><a class="menuLink" href="../work/longwork">장단기 알바정보</a></li>
		<li><a class="menuLink" href="../notice/notice_list">공지사항</a></li>
		<li><a class="menuLink" href="#">자유게시판</a></li>

	</ul>
	</div>


	<decorator:body />

	<footer> 사이트 정보 </footer>
	<!-- 사이트 관련 하단부  -->
</body>
</html>