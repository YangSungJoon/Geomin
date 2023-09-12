<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임으로 배우는 바둑교실</title>
    <link rel="stylesheet" href="../resources/css/main.css">
    
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
        
        <div id='banner' class = "banner">
       		<div class = "arrow" id = "left">&lang;</div>
       		<div class = "arrow" id = "right">&rang;</div>
		</div>

        <br>

        <div id = "recommand-box">
            <h2>추천 강의</h2>
            
        	<div class = "box-fixed">
	            <div class = "recommand-image1">
	                <img src="../resources/image/baduk1.jpg" alt="이미지">
	                <div class = "pac_content">
		                <a href = "#"><p class = "pacName">패키지 명 1 <span id = "pac_select">👈</span></p></a>
		                <p class= "con_price">100,000 원</p>
	                </div>
	            </div>
	
	            <div class = "recommand-image2">
	                <img src="../resources/image/baduk2.jpg" alt="이미지">
	                <div class = "pac_content">
		                <a href = "#"><p class = "pacName">패키지 명 2 <span id = "pac_select">👈</span><p></a>
		                <p class= "con_price">50,000 원</p>
	                </div>
	            </div>
	
	            <div class = "recommand-image3">
	                <img src="../resources/image/baduk3.jpg" alt="이미지">
	                <div class = "pac_content">
		                <a href = "#"><p class = "pacName">패키지 명 3 <span id = "pac_select">👈</span></p></a>
		                <p class= "con_price">75,000 원</p>
	                </div>
	            </div>
			</div>
        </div>

    </div>
    
    <script src="../resources/js/main.js"></script>
</body>
<%@include file = "../common/footer.jsp" %>
</html>