<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습콘텐츠 목록</title>
<link rel="stylesheet" href="../resources/css/learner_content.css">
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
                <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                <li class = "guide"><a href = "/management/qna" id = "qna">Q&A</a></li>
                <li class = "guide"><a href = "/management/salestally" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
  
        <div class = "group_add_box">
		<form action="/management/insert_content" method="post">
        <div id="addbtn">
                    <button type = "submit" id = "add_button">등록</button>
                    <button type="button" class="pakage_select" onclick="location.href='/content/contentList'">조회</button>
                    
                </div>
            <div class = "left_content">
				<p>패키지명<span>*</span></p>
				<input type="text" name="content_name" class="content_name" id="content_name"><br>
				<p>학습난이도<span>*</span></p>
      		    <div class = "member_check">
                <select name="learning_difficulty" id="learning_difficulty">
                    <option value="1">초급</option>
                    <option value="2">중급</option>
                    <option value="3">고급</option>
                </select>
            </div>		   
            
                <p>학습가능인원<span>*</span></p>
                
			    <input type="number" class="learning_member" name="learning_member" min="1">
			 
                <p>정가<span>*</span></p>
                <input type="text" id="price" name="price" value="">원
               <p>할인<span>*</span></p>
                <input type="text" id="sale" name="sale" value="">%
                <p>판매가<span>*</span></p>
                <input type="text" id="real_price" name="real_price">원
				 <p>패키지내용<span>*</span></p>
                <textarea cols="50" rows="5" id="learning_content" name="learning_content"></textarea>

            	</div>
    		</form>

        </div>

    </div>
    
    
</body>


<script>
document.addEventListener("DOMContentLoaded", function() {
    const priceInput = document.getElementById("price");
    const saleInput = document.getElementById("sale");
    const realPriceInput = document.getElementById("real_price");
    const contentNameInput = document.getElementById("content_name");
    const learningMemberInput = document.getElementById("learning_member");
    const learningContentInput = document.getElementById("learning_content");

    // 입력값이 변경될 때 판매가 계산
    priceInput.addEventListener("input", calculateRealPrice);
    saleInput.addEventListener("input", calculateRealPrice);

    function calculateRealPrice() {
        const price = parseFloat(priceInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출
        const sale = parseFloat(saleInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출

        if (!isNaN(price) && !isNaN(sale)) {
            const calculatedPrice = price - (price * (sale / 100));
            realPriceInput.value = calculatedPrice.toFixed(0);
        } else {
            realPriceInput.value = "";
        }
    }

    // 폼 제출 시 빈칸 여부 확인
    const form = document.querySelector("form");
    form.addEventListener("submit", function(event) {
        if (
            !contentNameInput.value.trim() ||
            !learningMemberInput.value.trim() ||
            !priceInput.value.trim() ||
            !saleInput.value.trim() ||
            !realPriceInput.value.trim() ||
            !learningContentInput.value.trim()
        ) {
            event.preventDefault(); // 폼 제출 중지
            showAlert('모든 정보를 입력해주세요.');
        }
    });

    // 서버로부터 받은 메시지를 이용하여 알림창을 띄우는 함수
    function showAlert(message) {
        alert(message);
    }

    // 서버로부터 메시지가 전달될 경우 showAlert 함수 호출
    const insertSuccess = "${param.insertSuccess}";
    if (insertSuccess === "true") {
        showAlert("등록되었습니다.");
    }
});

</script>
<%@include file = "../common/footer.jsp" %>
</html>