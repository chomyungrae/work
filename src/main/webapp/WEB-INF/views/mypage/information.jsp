<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1000px;
	height: 600px;
	margin: auto;

    
}
 section a{
  text-decoration:none;
  color:black;
 }
 .myTab{
 margin-top:50px;
 margin-left:0px;
 width:700px;
  position:relative;
 
  }
 
 .main li{
  list-style-type:none;
  display:inline-block;
  width:150px;
  height:30px;
  border:1px solid #cccccc;
  border-left:0px;
  margin-left:0px;
  text-align:center;
   padding-top:10px;
    padding-bottom:5px;
    font-weight:bold;
 }
 .main .sub2
 { 
  background:skyblue;
 }
 #tb
 {
  margin-top:0px;
 width:800px;
  height:400px;
  position:absolute;
  text-align:center;
 }
</style>
</head>
<body>
<section>
 <div class="myTab">
  <ul class="main">
   <li class="sub1"><a href="myinfo">회원정보수정</a></li><li class="sub2"><a href="reserve_info">이력서관리</a></li><li class="sub3"><a href="my_qna">지원내역</a></li>
  </ul>
  </div>
  
</section>
</body>
</html>