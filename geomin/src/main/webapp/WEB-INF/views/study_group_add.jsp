<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/study_group_add.css">
</head>
<%@include file = "../common/header.jsp" %>
<body>
<div class = "intro-box">
        <div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "#">
                        <img src="../image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        강사 마당 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습그룹 등록
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습그룹 등록</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">그룹가입 승인</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>
        
        <div class = "group_add_box">

            <div><h1>정보 입력</h1></div>
            <hr>
            <div class = "left_content">
                <p>그룹명<span>*</span></p>
                <input type="text" name="" id="">
                <p>그룹인원<span>*</span></p>
                <input type="text" name="" id="">
                <p>학습기간<span>*</span></p>
                <input type="date" name="" id=""> - 
                <input type="date" name="" id="">

                <div>
                    <button type = "button" id = "add_button">학습그룹 등록</button>
                </div>

            </div>
        </div>

        <div class = "right_box">
            <div class = "content_name">학습 콘텐츠명 : $_____</div>
            <div class = "poss_people">학습가능인원 : $__명</div>
            <div class = "add_people">그룹등록인원: $__명</div>
        </div>

    </div>
</body>
<%@include file = "../common/footer.jsp" %>
</html>