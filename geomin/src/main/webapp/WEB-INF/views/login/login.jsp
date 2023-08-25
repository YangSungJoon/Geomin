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
<form action='/loginAction' method='post'>
    <div class = "intro-box">
        <div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "#">
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
                <li class = "site-intro"><a href = "" id = "intro-hover">로그인</a></li>
            </ul>
        </div>

    <div class='login_box'>
        <div class='login_center slide-in'>
            <div class='login_logo'>
                회원 로그인
            </div>
        </div>
    </div>
    
    <div class = "login_content_box">
    <div class = "login_menu">
        <div class='login_box_id'>
            <h5>아이디</h5>
            <input type="text" name="userId" id="userId" placeholder='' autocomplete='off' value="aaa111">
        </div>
        <div class='login_box_pw'>
            <h5>비밀번호</h5>
            <input type="password" name="userPw" id="userPw" autocomplete='off' value="aaaa1111!!!!">
        </div>
    </div>
        <div class='login_button'>
            <button type="submit" id="button_login">로그인</button> 
        </div>
        <br><br>
        <hr>

        <div class='login_bottom'>
            <div><a href="/login/findId">아이디 찾기</a></div>
            <div><a href="/login/findPw">비밀번호 찾기</a></div>
            <div><a href="/login/regist">회원가입</a></div>
        </div>
    </div>

</div>
</form>
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