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
		<form action="/management/contentUpdate" method="post">
        	<input type="hidden" name="content_id" value="${param.content_id}">
        
            <div class = "left_content">
           
				 
				<p>패키지명<span>*</span></p>
				<input type="text" name="content_name" class="content_name" id="content_name" value="${contentVo.content_name}"><br>
				<p>학습난이도<span>*</span></p>
      		    <div class = "member_check">
                <select name="learning_difficulty" id="learning_difficulty" value="${contentVo.learning_difficulty}">
                    <option value="초급">초급</option>
                    <option value="중급">중급</option>
                    <option value="고급">고급</option>
                </select>
            </div>		   
            
                <p>학습가능인원<span>*</span></p>
                
			    <input type="number" class="learning_member" name="learning_member" min="1" value="${contentVo.learning_member}">
			 
                <p>정가<span>*</span></p>
                <input type="text" id="price" name="price" value="${contentVo.price}">원
               <p>할인<span>*</span></p>
                <input type="text" id="sale" name="sale" value="${contentVo.sale}">%
                <p>판매가<span>*</span></p>
                <input type="text" id="real_price" name="real_price" value="${contentVo.real_price}">원
				 <p>패키지내용<span>*</span></p>
                <textarea cols="50" rows="5" id="learning_content" name="learning_content" ></textarea>
				
            	</div>
	<div id="addbtn">
                    <button type = "submit" id = "contentUpdate" >수정하기</button>
                    
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

    // 입력값이 변경될 때 판매가 계산
    priceInput.addEventListener("input", calculateRealPrice);
    saleInput.addEventListener("input", calculateRealPrice);

    function calculateRealPrice() {
        const price = parseFloat(priceInput.value.replace(/[^0-9.-]+/g,"")); // 정가에서 숫자만 추출
        const sale = parseFloat(saleInput.value.replace(/[^0-9.-]+/g,"")); // 할인에서 숫자만 추출

        if (!isNaN(price) && !isNaN(sale)) {
            const calculatedPrice = price - (price * (sale / 100)); // 판매가 계산
            realPriceInput.value = calculatedPrice.toFixed(0) ; 
        } else {
            realPriceInput.value = ""; // 정가 또는 할인에 숫자가 아닌 값이 입력된 경우 초기화
        }
    }

    // 페이지 로드시 초기 계산 수행
    calculateRealPrice();
    
    
 // 패키지내용 값을 설정하려면 해당 값을 변수로 설정합니다.
    const desiredContent = "${contentVo.learning_content}";

    // <textarea> 요소를 찾습니다.
    const learningContentTextarea = document.getElementById('learning_content');

    // 원하는 패키지내용을 설정합니다.
    learningContentTextarea.value = desiredContent;

    
    
});
</script>
<%@include file = "../common/footer.jsp" %>
</html>