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

    <div id="login_container">
        <div class="text-center">
        	<div id=title>
            <h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1><br>
		 </div>           
            <p class="mb-4">※ 이메일을 입력해주세요.</p>
        </div><br>
        <form class="user" action="/login/findId" method="post">
            <div class="form-group">
               <p> <input type="email" class="form-control form-control-user"
                       id="email" aria-describedby="emailHelp" name="email"
                       placeholder="이메일을 입력하세요" required> </p>
            </div><br>
     	<div id="findId_login">
            <button type="submit" class="btn_findId">
                Find ID
            </button>
        <button type="submit" class="login_btn1" onclick="location.href='/login/findPw'" >비밀번호 찾기</button>
     
        </div>
        </form>
        <br>
     <div id="login_btn2">
            <button type="button" class="btn_login" onclick="location.href='/login/login'">로그인페이지</button>
           </div>
       <br>
        <div class="jumbotron">
            <h2>아이디는 :</h2>
            <br>
            <ul>
                <c:forEach items="${userList}" var="user" varStatus="status">
                    <li id='id_answer'>${user.user_id } </li><br>
                </c:forEach>
            </ul>
            <h2>입니다</h2> <br>
          
        </div>
         </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
