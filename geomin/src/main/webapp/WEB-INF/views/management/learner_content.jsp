<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">공지 등록</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
  
        <div class = "group_add_box">
		<form action="/management/insert_content" method="post">
        <div>
                    <button type = "submit" id = "add_button">등록</button>
                    <button type="button" class="pakage_select" onclick="location.href='/content/contentList'">조회</button>
                    
                </div>
            <div class = "left_content">
				<p>패키지명<span>*</span></p>
				<input type="text" name="group_name">
				<p>학습난이도<span>*</span></p>
      		    <div class = "member_check">
                <select name="" id="learning_difficulty">
                    <option value="1">초급</option>
                    <option value="2">중급</option>
                    <option value="3">고급</option>
                </select>
            </div>		   
            
                <p>학습가능인원<span>*</span></p>
                
			    <input type="number" class="class_maxcount" name="class_maxcount" id="class_maxcount" min="1">
			 
                <p>정가<span>*</span></p>
                <input type="text" id="price" name="price" value="">원
               <p>할인<span>*</span></p>
                <input type="text" id="discount" name="discount" value="">%
                <p>판매가<span>*</span></p>
                <input type="text" id="real_price" name="real_price">원
				 <p>패키지내용<span>*</span></p>
                <input type="text" id="pakage_content" name="pakage_content">
                

            </div>
    </form>
    <!-- 등록 성공 메시지 -->
<c:if test="${param.insertSuccess eq 'true'}">
    <p>등록되었습니다.</p>
</c:if>
        </div>

      
	

    </div>
    
    
</body>


<script>
document.addEventListener("DOMContentLoaded", function() {
    const priceInput = document.getElementById("price");
    const discountInput = document.getElementById("discount");
    const realPriceInput = document.getElementById("real_price");

    // 입력값이 변경될 때 판매가 계산
    priceInput.addEventListener("input", calculateRealPrice);
    discountInput.addEventListener("input", calculateRealPrice);

    function calculateRealPrice() {
        const price = parseFloat(priceInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출
        const discount = parseFloat(discountInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출

        if (!isNaN(price) && !isNaN(discount)) {
            const calculatedPrice = price - (price * (discount / 100));
            realPriceInput.value = calculatedPrice.toFixed(0);
        } else {
            realPriceInput.value = "";
        }
    }
});
</script>
<%@include file = "../common/footer.jsp" %>
</html>