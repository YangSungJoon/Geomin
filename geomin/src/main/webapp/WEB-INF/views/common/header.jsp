<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  <c:choose>
                  	<c:when test="${empty userVo }">
                    <li class='header_user'><a href="/login/regist" id ="regist">회원가입</a></li>
                    <li class='header_login'><a href="/login/login">로그인</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class='header_user'><a href="/login/profile">${userVo.user_name }</a>님 환영합니다.</li>
                    <li class='header_login'><a href="/logout">로그아웃</a></li>
                    </c:otherwise>
                 </c:choose>
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
                        <li><a href="/content/contentList" id = "subcategory-size">학습콘텐츠 구독</a></li>
                        <li><a href="/content/subContentList?user_id=${userId}" id = "subcategory-size">나의 학습콘텐츠</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/group/groupAdd?user_id=${userId}"  id = "subcategory-size">학습그룹 등록</a></li>
                        <li><a href="/group/groupApproval?user_id=${userId}" id = "subcategory-size">학습그룹 가입승인</a></li>
                        <li class = "guide"><a href = "/group/myGroup?user_id=${userId}" id = "subcategory-size">나의 그룹</a></li>
                        <li><a href="/homework_t/homework_add?user_id=${userId }" id = "subcategory-size">숙제 전송</a></li>
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
                        <li><a href="/management/learner_content" id = "subcategory-size">학습콘텐츠 등록</a></li>
                        <li><a href="/management/announcement" id = "subcategory-size">공지사항</a></li>
                        <li><a href="/management/salestally" id = "subcategory-size">매출집계 및 조회</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

    </div>
</header>
</html>