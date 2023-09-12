<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.geomin.vo.UserVO" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Karla:wght@300&family=Work+Sans:wght@300&display=swap" rel="stylesheet">


<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
    // gray1 클래스를 가진 모든 요소를 선택합니다.
    var gray1Elements = document.querySelectorAll('.gray1');
    
    // gray1 클래스를 가진 각 요소에 클릭 이벤트 핸들러를 추가합니다.
    gray1Elements.forEach(function(element) {
        element.addEventListener("click", function(event) {
            event.preventDefault();
            alert("로그인한 후 이용해주세요.");
        });
    });

    // gray2 클래스를 가진 모든 요소를 선택합니다.
    var gray2Elements = document.querySelectorAll('.gray2');
    
    // gray2 클래스를 가진 각 요소에 클릭 이벤트 핸들러를 추가합니다.
    gray2Elements.forEach(function(element) {
        element.addEventListener("click", function(event) {
            event.preventDefault();
            alert("학습관리자는 이용할 수 없습니다.");
        });
    });

    // gray3 클래스를 가진 모든 요소를 선택합니다.
    var gray3Elements = document.querySelectorAll('.gray3');
    
    // gray3 클래스를 가진 각 요소에 클릭 이벤트 핸들러를 추가합니다.
    gray3Elements.forEach(function(element) {
        element.addEventListener("click", function(event) {
            event.preventDefault();
            alert("학습자는 이용할 수 없습니다.");
        });
    });
});

</script>



</head>
<header>
    <div class = "header">
        <div class = "header_top">
            <div id = "logo"><a href="/main/main" id ="regist"><img src="../resources/image/logo.png"></a></div>
            <div id = "name"><a href="/main/main" id ="regist">게임으로 배우는 바둑 교실</a></div>
            <div id = "login_menu">
                <ul class = "login">
                  <c:choose>
                  	<c:when test="${empty userVo }">
                    <li class='header_user buttonH btnPushH btnColorH'><a href="/login/regist" id ="regist">회원가입</a></li>
                    <li class='header_login buttonH btnPushH btnColorH'><a href="/login/login">로그인</a></li>
                    </c:when>
                    <c:otherwise>
                    <li class='header_user buttonH btnColorH btnPushH'><a href="/login/profile"><strong>My Page</strong></a><strong></strong></li>
                    <li class='header_login buttonH btnColorH btnPushH'><a href="/logout"><strong>로그아웃</strong></a></li>
                    </c:otherwise>
                 </c:choose>
                </ul>
            </div>
        </div>
    </div>
    
    <div class = "menu">
        <nav>
            <ul class = 'categoryMenu'>
              
         <c:choose>
            <c:when test="${empty userVo}">
                <!-- 로그인하지 않은 사용자 -->
                <li class = "frame"><a href = "#" class = "custom-btn btntopmenu">서비스 안내</a>
                	<ul class = 'submenu'>
                        <li><a href="/main/intro" id = "subcategory-11">사이트 소개</a></li>
                        <li><a href="/main/guide" id = "subcategory-12">이용가이드</a></li>
                    </ul>
                </li>
                
                
                <li><a href="#" style="color: gray;"  class = "custom-btn btntopmenu">구독서비스</a></li>
                <li><a href="#" style="color: gray;"  class = "custom-btn btntopmenu">강사마당</a></li>
                <li><a href="#" style="color: gray;"  class = "custom-btn btntopmenu">학습서비스</a></li>
                <li><a href = "#" id = "category-size-admin" class = "custom-btn btntopmenu">관리마당</a>
                	<ul class = 'submenu'>
                		<li><a href="/management/announcement" id = "subcategory-52">공지사항</a></li>
                	</ul>
                </li>
            </c:when>
            
            <c:otherwise>
                <!-- 로그인한 사용자 -->
                <c:choose>
                    <c:when test="${userVo.user_type == 1}">
                        <!-- 사용자 유형이 1 (학습자)인 경우 -->
                        <li><a href = "#" id = "category-size-service" class = "custom-btn btntopmenu">서비스 안내</a>
                    <ul class = 'submenu'>
                        <li><a href="/main/intro" id = "subcategory-11">사이트 소개</a></li>
                        <li><a href="/main/guide" id = "subcategory-12">이용가이드</a></li>
                    </ul>
                </li>
        
                <li><a href = "#" id = "category-size-subscription" class = "custom-btn btntopmenu">구독서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="/content/contentList" id = "subcategory-21">학습콘텐츠 구독</a></li>
                        <li><a href="/content/subContentList?user_id=${userId}" id = "subcategory-22">나의 학습콘텐츠</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size-instructor" class = "custom-btn btntopmenu">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/group/groupAdd?user_id=${userId}"  id = "subcategory-31">학습그룹 등록</a></li>
                        <li><a href="/group/groupApproval?user_id=${userId}" id = "subcategory-32">학습그룹 가입승인</a></li>
                        <li><a href = "/group/myGroup?user_id=${userId}" id = "subcategory-33">나의 그룹</a></li>
                        <li><a href="/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "subcategory-34">숙제 전송</a></li>
                        <li><a href="/homework_t/homework_evaluation?user_id=${userId }" id = "subcategory-35">숙제 평가</a></li>
                    </ul>
                </li>

               <li><a href="#" style="color: gray;" class="gray2" class = "custom-btn btntopmenu">학습서비스</a></li>

                <li><a href = "#" id = "category-size-admin" class = "custom-btn btntopmenu">관리마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/management/announcement" id = "subcategory-52">공지사항</a></li>
                    </ul>
                </li>
                    </c:when>
                    <c:when test="${userVo.user_type == 2}">
                        <!-- 사용자 유형이 2(학습자)인 경우 -->
                <li><a href = "#" id = "category-size-service" class = "custom-btn btntopmenu">서비스 안내</a>
                    <ul class = 'submenu'>
                        <li><a href="/main/intro" id = "subcategory-11">사이트 소개</a></li>
                        <li><a href="/main/guide" id = "subcategory-12">이용가이드</a></li>
                    </ul>
                </li>
                        <li><a href="#" style="color: gray;" class="gray3" class = "custom-btn btntopmenu">구독서비스</a></li>
                        <li><a href="#" style="color: gray;" class="gray3" class = "custom-btn btntopmenu">강사마당</a></li>
                <li><a href = "#" id = "category-size-study" class = "custom-btn btntopmenu">학습서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="/homework/study_group_join?user_id=${userId}" id = "subcategory-41">학습그룹 가입신청</a></li>
                        <li><a href="/homework/homework_send?user_id=${userId}" id = "subcategory-42">숙제 제출</a></li>
                        <li><a href="/homework/study_group_info?user_id=${userId}" id = "subcategory-43">나의 그룹</a></li>
                    </ul>
                </li>
                        <li><a href = "#" id = "category-size-admin" class = "custom-btn btntopmenu">관리마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/management/announcement" id = "subcategory-52">공지사항</a></li>
                    </ul>
                </li>
                    </c:when>
                    
                    <c:otherwise>
                    	 <!-- 사용자 유형이 3(운영자)인 경우 -->
                <li><a href = "#" id = "category-size-service" class = "custom-btn btntopmenu">서비스 안내</a>
                    <ul class = 'submenu'>
                        <li><a href="/main/intro" id = "subcategory-11">사이트 소개</a></li>
                        <li><a href="/main/guide" id = "subcategory-12">이용가이드</a></li>
                    </ul>
                </li>
        
                <li><a href = "#" id = "category-size-subscription" class = "custom-btn btntopmenu">구독서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="/content/contentList" id = "subcategory-21">학습콘텐츠 구독</a></li>
                        <li><a href="/content/subContentList?user_id=${userId}" id = "subcategory-22">나의 학습콘텐츠</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size-instructor" class = "custom-btn btntopmenu">강사마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/group/groupAdd?user_id=${userId}"  id = "subcategory-31">학습그룹 등록</a></li>
                        <li><a href="/group/groupApproval?user_id=${userId}" id = "subcategory-32">학습그룹 가입승인</a></li>
                        <li><a href = "/group/myGroup?user_id=${userId}" id = "subcategory-33">나의 그룹</a></li>
                        <li><a href="/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "subcategory-34">숙제 전송</a></li>
                        <li><a href="/homework_t/homework_evaluation?user_id=${userId }" id = "subcategory-35">숙제 평가</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size-study" class = "custom-btn btntopmenu">학습서비스</a>
                    <ul class = 'submenu'>
                        <li><a href="/homework/study_group_join?user_id=${userId}" id = "subcategory-41">학습그룹 가입신청</a></li>
                        <li><a href="/homework/homework_send?user_id=${userId}" id = "subcategory-42">숙제 제출</a></li>
                    </ul>
                </li>

                <li><a href = "#" id = "category-size-admin" class = "custom-btn btntopmenu">관리마당</a>
                    <ul class = 'submenu'>
                        <li><a href="/management/learner_content" id = "subcategory-51">학습콘텐츠 등록</a></li>
                        <li><a href="/management/announcement" id = "subcategory-52">공지사항</a></li>
                        <li><a href="/management/salestally" id = "subcategory-53">매출집계 및 조회</a></li>
                    </ul>
                </li>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
            
        </c:choose>
        
        
            </ul>
        </nav>

    </div>
</header>
</html>