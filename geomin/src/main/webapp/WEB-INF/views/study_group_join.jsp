<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/study_group_join.css">
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
                        학습 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습그룹 가입신청
                    </a>
                </li>
            </ul>
        </div>

        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습그룹 가입신청</a></li>
                <li class = "guide"><a href = "../html/guide.html" id = "guide-hover">숙제 제출</a></li>
            </ul>
        </div>
        
        <div class = "group-content-box">
            <h2 class = "join_info">가입 정보</h2>
            <div class = "group_content">
                <strong style='font-size: 27px'>그룹명</strong>
                <select id = "select" style='margin-left: 1rem'>
                    <option value="">선택</option>
                    <option value="">그룹1</option>
                    <option value="">그룹2</option>
                    <option value="">그룹3</option>
                </select>
                <br>
                <div class = "sub_content">
                    <br>
                    <p>학습지도자 명 : $__________</p>
                    <p>학습기간 : $__________</p>
                    <p>가입현황 : $__________</p>
                </div>
            </div>
        </div>

        <div class = "send_button_box">
            <button type = "button" id = "send_button">승인 신청</button>
        </div>

    </div>
</body>
<%@include file = "../common/footer.jsp" %>
</html>