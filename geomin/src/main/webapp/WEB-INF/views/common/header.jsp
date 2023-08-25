<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/header.css">
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
                    <li class='header_login'><a href="/login/regist" id ="regist">회원가입</a></li>
                    <li class='header_login'><a href="/login/login">로그인</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class = "menu">
        <nav>
            <ul class = 'categoryMenu'>
                <li><a href = "#" id = "category-size">서비스 안내</a>
                    <ul class = 'submenu'>
                        <li><a href="/main/intro" id = "subcategory-size">사이트 소개</a></li>
                        <li><a href="/main/guide" id = "subcategory-size">이용가이드</a></li>
                    </ul>
                </li>
        
                <li><a href = "#" id = "category-size">구독서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="/content/contentList" id = "subcategory-size">학습콘텐츠 검색</a></li>
                        <li><a href="#" id = "subcategory-size">콘텐츠 구매</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/content/group" id = "subcategory-size">학습그룹 등록</a></li>
                        <li><a href="#" id = "subcategory-size">학습그룹 가입승인</a></li>
                        <li><a href="#" id = "subcategory-size">숙제 전송</a></li>
                        <li><a href="#" id = "subcategory-size">숙제 평가</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">학습서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="#" id = "subcategory-size">학습그룹 가입신청</a></li>
                        <li><a href="#" id = "subcategory-size">숙제 제출</a></li>
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
</html>