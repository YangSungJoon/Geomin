<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  
    <link rel="stylesheet" href="../resources/css/intro.css">
    <link rel="stylesheet" href="../resources/css/login.css">
</head>
<%@include file = "../common/header.jsp" %>
<body>

    <div class = "intro-box">
        <div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "/login/login">
                        <img src="../resources/image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        로그인
                    </a>
                </li>
            </ul>
        </div>
    
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/login/login" id = "intro-hover">로그인</a></li>
            </ul>
        </div>

        <div class="container">
          <div class="sign-in-container">
          <form action='/loginAction' method='post'>
              <h1>Login</h1>
              <div class="social-links">
                <div>
                  <a href="#"><i aria-hidden="true"><img src="../resources/image/kakao.png"></i></a>
                </div>
                <div>
                  <a href="#"><i aria-hidden="true"><img src="../resources/image/naver.png"></i></a>
                </div>
                <div>
                  <a href="#"><i aria-hidden="true"><img src="../resources/image/facebook.png"></i></a>
                </div>
              </div>
              <input type="text" name="userId" placeholder="Id">
              <input type="password" name = "userPw" placeholder="Password">
          
              <button type = "submit" class="form_btn">로그인</button>
          </form>
          </div>
          
          
          <div class="overlay-right">
            <button id="signUp" class = "buttonA btnPush btnColor" onclick="location.href='/login/regist'">회원가입</button><br>
            <button id="signUp" class="buttonA btnPush btnColor" onclick="location.href='/login/findId'">아이디 찾기</button><br>
            <button id="signUp" class="buttonA btnPush btnColor" onclick="location.href='/login/findPw'">비밀번호 찾기</button>
          </div>
        </div>
        
</div>

      <script>
        <%-- 로그인 실패 시 메시지가 있는 경우에만 alert 창을 띄웁니다. --%>
        
        <% if (request.getAttribute("errorMSG") != null) { %>
            var errorMessage = "${errorMSG}";
            alert(errorMessage);
        <% } %>
    </script>
</body>
<%@include file = "../common/footer.jsp" %>
</html>