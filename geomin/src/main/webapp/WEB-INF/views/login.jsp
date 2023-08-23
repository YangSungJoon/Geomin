<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/intro.css">
    <link rel="stylesheet" href="../resources/css/login.css">
</head>
<header>
    <div class = "header">
        <div class = "header_top">
            <div id = "logo">로고</div>
            <div id = "name">게임으로 배우는 바둑 교실</div>
            <div id = "login_menu">
                <ul class = "login">
                    <li class='header_login'><a href="http://127.0.0.1:5500/regist.html" id ="regist">회원가입</a></li>
                    <li class='header_login'><a href="http://127.0.0.1:5500/login.html">로그인</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class = "menu">
        <nav>
            <ul class = 'categoryMenu'>
                <li><a href = "#" id = "category-size">서비스 안내</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">사이트 소개</a></li>
                        <li><a href="#" id = "subcategory-size">이용가이드</a></li>
                    </ul>
                </li>
        
                <li><a href = "#" id = "category-size">구독서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습 신청</a></li>
                        <li><a href="#" id = "subcategory-size">학습현황 등록</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">패키지 및 구독신청</a></li>
                        <li><a href="#" id = "subcategory-size">학습자 등록</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">학습서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습 현황 조회</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">관리마당</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습콘텐츠 등록</a></li>
                        <li><a href="#" id = "subcategory-size">공지 등록</a></li>
                        <li><a href="#" id = "subcategory-size">매출집계 및 조회</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

    </div>
</header>
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
            <input type="text" name="userId" id="userId" placeholder='' autocomplete='off'>
        </div>
        <div class='login_box_pw'>
            <h5>비밀번호</h5>
            <input type="password" name="userPw" id="userPw" autocomplete='off'>
        </div>
    </div>
        <div class='login_button'>
            <button type="submit" id="button_login">로그인</button> 
        </div>
        <br><br>
        <hr>

        <div class='login_bottom'>
            <div><a href="#">아이디 찾기</a></div>
            <div><a href="#">비밀번호 찾기</a></div>
            <div><a href="/regist">회원가입</a></div>
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
<footer>
    <div class="footerMain">
        <div class="foot_bottom">
            <div class="team_intro">
                <h3>거민시스템 C조</h3>
                <span>양성준</span>
                <span>이은철</span>
                <span>이동현</span>
            </div>
        </div>
        <div class="foot_bottom_bottom">
            <a href="#" class = "footer_bottom">회사소개</a>
            <a href="#" class = "footer_bottom">이용가이드</a>
            <a href="#" class = "footer_bottom">개인정보보호정책</a>
            <a href="#">이용약관</a>
        </div>
    </div>

</footer>
</html>