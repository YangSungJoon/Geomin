<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/header.css">
    <script src="../js/main.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karla:wght@300&family=Work+Sans:wght@300&display=swap" rel="stylesheet">
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
        
                <li><a href = "#" id = "category-size">학습서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습 신청</a></li>
                        <li><a href="#" id = "subcategory-size">학습현황 등록</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">구독서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">패키지 및 구독신청</a></li>
                        <li><a href="#" id = "subcategory-size">학습자 등록</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습 현황 조회</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">관리마당</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습패키지 등록</a></li>
                        <li><a href="#" id = "subcategory-size">게시판</a></li>
                        <li><a href="#" id = "subcategory-size">Q&A</a></li>
                        <li><a href="#" id = "subcategory-size">매출관리</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

    </div>
</header>
<body>
    <div class = "home-box">
        <div id='banner'>
		    <div class="arrow" id="left">&lang;</div>
            <img src="../image/pic-1.jpeg" alt="">
		    <div class="arrow" id="right">&rang;</div>
		</div>

        <br>
        <hr>

        <div id = "recommand-box">
            <h2>인기 강의</h2>
            <div class = "recommand-image1">
                <img src="../image/a.png" alt="이미지">
                <p>강의 1</p>
                <p>200,000 원</p>
            </div>

            <div class = "recommand-image2">
                <img src="../image/a.png" alt="이미지">
                <p>강의 2</p>
                <p>50,000 원</p>
            </div>

            <div class = "recommand-image3">
                <img src="../image/a.png" alt="이미지">
                <p>강의 3</p>
                <p>100,000 원</p>
            </div>

        </div>

        <div id = "add-content" style='text-align: center;'>
            <h2>추가 내용</h2>
        </div>

    </div>
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