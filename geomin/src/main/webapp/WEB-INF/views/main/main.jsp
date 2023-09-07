<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/main.css">
    
    <script src="../resources/js/main.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karla:wght@300&family=Work+Sans:wght@300&display=swap" rel="stylesheet">
</head>
<%@include file = "../common/header.jsp" %>
<body>
    <div class = "home-box">
    
	    <div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "/login/login">
                        <img src="../resources/image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        홈
                    </a>
                </li>
            </ul>
        </div>
        
        <div id='banner'>
		    <div class="arrow" id="left">&lang;</div>
            <img src="../resources/image/pic-1.jpeg" alt="">
		    <div class="arrow" id="right">&rang;</div>
		</div>

        <br>
        <hr>

        <div id = "recommand-box">
            <h2>추천 강의</h2>
            <div class = "recommand-image1">
                <img src="../resources/image/a.png" alt="이미지">
                <p>강의 1</p>
                <p>200,000 원</p>
            </div>

            <div class = "recommand-image2">
                <img src="../resources/image/a.png" alt="이미지">
                <p>강의 2</p>
                <p>50,000 원</p>
            </div>

            <div class = "recommand-image3">
                <img src="../resources/image/a.png" alt="이미지">
                <p>강의 3</p>
                <p>100,000 원</p>
            </div>

        </div>

        <div id = "add-content" style='text-align: center;'>
            <h2>추가 내용</h2>
        </div>

    </div>
</body>
<%@include file = "../common/footer.jsp" %>
</html>