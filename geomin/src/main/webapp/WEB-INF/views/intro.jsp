<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/intro.css">
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
                        서비스 안내 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        사이트 소개
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">사이트 소개</a></li>
                <li class = "guide"><a href = "../html/guide.html" id = "guide-hover">이용 가이드</a></li>
            </ul>
        </div>
        <div class = "intro-content">
            <h1>사이트 소개 내용</h1>
        </div>
    </div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>