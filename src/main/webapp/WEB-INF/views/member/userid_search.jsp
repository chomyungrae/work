<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 body{
  margin:0px;
  width:100%;
  height:95%;
  background:#eeeeee;
 }
 section{
 margin:auto;
  width:80%;
  height:400px;
  margin-top:20px;
  text-align:center;
  font-size:20px;
 
 }

 section table td:first-child{
  font-weight:bold;
  width:100px;
 }
 section table td:last-child{
  height:50px;
 }
 section #pom input{
  width:250px;
  height:22px;
  font-size:15px;
  font-weight:bold;
 }
 #btn{
 
  background:black;
  color:white;
  font-size:22px;
  font-weight:bold;
 }
  #btn:hover{
  color:red;
 }
 #view{
  margin:auto;
  margin-top:100px;
  font-size:22px;
   display:none;
 }
 #userid{
  font-size:25px;
  font-weight:bold;
  color:green;
 }
 
</style>
<script>

function searching_userid()
  {
	var name=document.pom.name.value;
	var ymd=document.pom.ymd.value;
	var err=0;
	
    var chk=new XMLHttpRequest(); 
    chk.open("get","searching_userid?name="+name+"&ymd="+ymd);
    chk.send();
    chk.onreadystatechange=function()
    {
       if(chk.readyState==4)
    	   {
    	     if(chk.responseText=="null")
    	    	 {
    	    	  alert("아이디를 찾을수 없습니다");
    	    	   err=0;
    	    	 }
    	     else
    	    	 {
    	    	// document.pom.style.visibility="hidden";
    	    	   document.pom.style.display="none";
    	    	  document.getElementById("view").style.display="inline-block";
    	    	  
    	    	  document.getElementById("userid").innerText=chk.responseText;
    	    	 }
    	   } 
    }
  }
  function hide()
  {
	  self.close();
	
  }
  
</script>
</head>
<body>
 <section>
  <form name="pom" id="pom">
  <table align="center">
   <caption><h1> 아이디 찾기 </h1></caption>
   <tr>
    <td>이름</td>
    <td><input type="text" name="name" placeholder="이름을 입력하세요"></td>
   </tr> 
   <tr>
    <td>생년월일</td>
    <td><input type="text" name="ymd" placeholder="생년월일" maxlength="8"></td>
   </tr> 
   
   <tr>
    <td colspan="2" align="center">
    <input id="btn" type="button" onclick="searching_userid()" value="아이디 찾기" style="height:40px">
    </td>
   </tr>
   
  </table>
  </form>
  <div id="view">
   아이디 <span id="userid"></span> 입니다.
  <div><input type="button" onclick="hide()" value="창 닫기"></div>
  </div>
  </section>
</body>
</html>

