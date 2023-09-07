<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/guide.css">
</head>
<%@include file = "../common/header.jsp" %>
<body>
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
                        서비스 안내 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        이용 가이드
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/main/intro" id = "intro-hover">사이트 소개</a></li>
                <li class = "guide"><a href = "/main/guide" id = "guide-hover">이용 가이드</a></li>
            </ul>
        </div>
        <div class = "intro-content">
            <h1>바둑 교실 이용 가이드</h1>
            <br><br>
            <img id="guide_image" src="../resources/image/guide.png" alt="이미지"><br><br>
            <p>안녕하세요. 저희  어린이 바둑교육 사이트 한기원에 오신걸 환영합니다. </p>
            <p>저희 바둑교실은 먼저 운영자님이 학습콘텐츠를 등록합니다.</p>
          <p>  그리고 학습지도자(선생님)께서 학습콘텐츠를 구독하고 학습그룹을 만듭니다.</p>
     <p> 학습자(학생)들이 학습그룹에 가입신청, 학습지도자 승인을 한 후에 교육에 참여하게 됩니다.</p>
    <p>학습교육과 숙제를 수행하면서 학습을 관리하는 시스템입니다.</p>
    <p>감사합니다. </p>
        </div>
    </div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>