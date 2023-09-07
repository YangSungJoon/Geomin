<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>아이디 찾기 결과</title>
    <link rel='stylesheet' href='../resources/css/findId.css'>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class='regi_area'>
		<div class="intro-box">
			<div class="location">
				<ul class="clearFix">
					<li class="home"><a href="#"> 
						<img src="../resources/image/homeicon.png" alt=""> 
					</a></li>
					<li><a href="#"> / 아이디 찾기  </a></li>
				</ul>
			</div>
			<div class="left-sideBar">
				<ul>
                <li class = "site-intro"><a href = "/login/findId" id = "intro-hover">아이디 찾기</a></li>
            </ul>
			</div>
		    <div id="login_container">
		        <div class="text-center">
		        	<div id=title>
		            <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1><br>
				 </div>           
		        </div><br>
		        <form class="user" action="/login/findId" method="post">
		            <div class="form-group">
		               <p> <input type="email" class="form-control form-control-user"
		                       id="email" aria-describedby="emailHelp" name="email"
		                       placeholder="이메일을 입력하세요" required> </p>
		            </div><br>
		        
		     	<div id="findId_login">
		            <button type="submit" class="buttonA btnPush btnColor">
		                Find ID
		            </button>
		        <button type="submit" class="buttonA btnPush btnColor" onclick="location.href='/login/findPw'" >비밀번호 찾기</button>
		     
		        </div>
		        </form>
		        <br>
		     		<div id="login_btn2">
		            	<button type="button" class="buttonA btnPush btnColor" onclick="location.href='/login/login'">로그인페이지</button>
		           </div>
		       <br>
		        <div class="jumbotron">
		        
		            <br>
		            <ul>
		                <c:forEach items="${userList}" var="user" varStatus="status">
			                
				            
		                    <li id='id_answer'>
		                    <svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 448 512">
		                    <!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM218 271.7L64.2 172.4C66 156.4 79.5 144 96 144H352c16.5 0 30 12.4 31.8 28.4L230 271.7c-1.8 1.2-3.9 1.8-6 1.8s-4.2-.6-6-1.8zm29.4 26.9L384 210.4V336c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V210.4l136.6 88.2c7 4.5 15.1 6.9 23.4 6.9s16.4-2.4 23.4-6.9z"/></svg><i class="fa-solid fa-square-envelope" aria-hidden="true"></i>&nbsp;&nbsp;<strong> 아이디 : </strong> ${user.user_id } </li><br>
		                </c:forEach>
		            </ul>
		          
		        </div>
		         </div>
		    
	</div>
</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
