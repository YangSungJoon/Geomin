<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학습콘텐츠 목록</title>
    <style>
    	

#addbtn{
	border : 1px solid black;
	
}

.group_add_box h1{
    margin-top: 1.5rem;
    margin-left: 1.5rem;
}

.left_content{
    height: 35rem;
    font-size: 20px;
    font-weight: bold;
    margin-top: 1.5rem;
    margin-left: 1rem;
    line-height: 2rem;
    
    
}


.baduk_image img{
	width: 300px;
	height: 200px;
	border: 1px solid black;
	float: left;
}
    
    	#pakage{
    		width:200px;
    	}
    	
.table_box{
	border: 1px solid black;
	width:600px;
	height: 700px;
	float: left;
}    	
    	
    	
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<%@ include file="../common/header.jsp" %>
<body>
<div class="intro-box">
    <div class="location">
        <ul class="clearFix">
            <li class="home">
                <a href="#">
                    <img src="../resources/image/homeicon.png" alt=""/> /
                </a>
            </li>
            <li>
                <a href="#">
                    강사 마당 /
                </a>
            </li>
            <li>
                <a href="#">
                    학습그룹 등록
                </a>
            </li>
        </ul>
    </div>

    <div class="left-sideBar">
        <ul>
              
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
            
   </div>

    <div class="group_add_box">
    	<div class="baduk_image">
    		<c:choose>
                  <c:when test="${contentVo.learning_difficulty_str == '초급'}">
    				  <img src="../resources/image/baduk1.jpg" alt="초급"/>                 
	              </c:when>
	              <c:when test="${contentVo.learning_difficulty_str == '중급'}">
    				  <img src="../resources/image/baduk2.jpg" alt="중급"/>                 
	              </c:when>
                  <c:when test="${contentVo.learning_difficulty_str == '고급'}">
    				  <img src="../resources/image/baduk3.jpg" alt="고급"/>                 
	              </c:when>
            </c:choose>  
   		</div>
    		<form action="/management/contentUpdate" method="post">
        <input type="hidden" name="content_id" value="${param.content_id}">
   		<div class ="table_box">
            <table border="1">
            	<tr>
            		<th id="pakage">패키지명</th>
            		<td id="pakage2" colspan="4">${contentVo.content_name}</td>
            		
            	</tr>
            	<tr>
				    <th>학습 난이도</th>
				    <td class="learning_difficulty">${contentVo.learning_difficulty_str}</td>
				</tr>

            	<tr>
            		<th>학습 가능 인원</th>
            		<td>${contentVo.learning_member}명</td>
            	</tr>
            	<tr>
            		<th id="price">정가</th>
            		<td>${contentVo.price}원</td>
            	</tr>
            	<tr>
            		<th id="sale">할인</th>
            		<td>${contentVo.sale}%</td>
            	</tr>
            	<tr>
            		<th id="real_price">판매가</th>
            		<td>${contentVo.real_price}원</td>
            	</tr>
            	<tr>
            		<th colspan="2">학습 내용</th>
            	</tr>
            	<tr>
            		<td colspan="2">${contentVo.learning_content}</td>
            	</tr>
            </table>
            </div>
            </form>
    	</div>
        <div class="left_content">
        	<!-- 운영자 계정에서만 보이는 버튼 -->
    			<div id="addbtn">
    			<c:choose>
                  <c:when test="${userVo.user_type == 3}">
	                   <button type="button" onclick="location.href='/management/contentUpdate?content_id=${contentVo.content_id}'">수정</button>
					   <button type="button" class="contentDelete" onclick="deleteContent('${contentVo.content_id}')">삭제</button>
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
                </c:choose>  
                </div>
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
        const price = parseFloat(priceInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출
        const sale = parseFloat(saleInput.value.replace(/[^0-9.-]+/g,"")); // 숫자만 추출

        if (!isNaN(price) && !isNaN(sale)) {
            const calculatedPrice = price - (price * (sale / 100));
            realPriceInput.value = calculatedPrice.toFixed(0);
        } else {
            realPriceInput.value = "";
        }
    }
    
    
});
    function deleteContent(contentId) {
        // 서버로 AJAX 요청을 보냅니다.
        $.ajax({
            type: "POST",
            url: "/management/contentDelete", // 실제 컨트롤러 URL로 수정
            data: { content_id: contentId },
            success: function(response) {
            	console.log(response.success);
            	if (response.success === "true") {
                    // 삭제 성공 시 리다이렉트
                    alert("삭제가 완료되었습니다.");
                    // 페이지 리로드 또는 리다이렉션을 수행
                    window.location.href = "/content/contentList"; // contentList 페이지 URL로 변경
                    } else {
                    alert("삭제 중 오류가 발생했습니다.");
                }
            },
            error: function() {
                alert("서버 요청 중 오류가 발생했습니다.");
            }
        });
    }
    
    function convertDifficulty(difficulty) {
        switch (difficulty) {
            case '1':
                return '초급';
            case '2':
                return '중급';
            case '3':
                return '고급';
            default:
                return '알 수 없음';
        }
    }
</script>


<%@ include file="../common/footer.jsp" %>
</html>
