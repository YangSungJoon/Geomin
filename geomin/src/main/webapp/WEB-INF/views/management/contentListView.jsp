<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학습콘텐츠 목록</title>
    <link rel="stylesheet" href="../resources/css/learner_content.css">
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
            <li class="site-intro"><a href="/management/learner_content" id="intro-hover">학습콘텐츠 등록</a></li>
            <li class="guide"><a href="/management/announce_add" id="insert_announce">공지 등록</a></li>
            <li class="guide"><a href="/management/announcement" id="announcement">공지사항</a></li>
            <li class="guide"><a href="/management/qna" id="qna">Q&A</a></li>
            <li class="guide"><a href="/management/salestally" id="guide-hover">매출집계 및 조회</a></li>
        </ul>
    </div>

    <div class="group_add_box">
        <div class="left_content">
        <form action="/management/contentUpdate" method="post">
        <input type="hidden" name="content_id" value="${param.content_id}">
   
            <table border="1">
            	<tr>
            		<th>패키지명</th>
            		<td colspan="4">${contentVo.content_name}</td>
            	</tr>
            	<tr>
            		<th>학습 난이도</th>
            		<td class="learning_difficulty">${contentVo.learning_difficulty}</td>
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
            		<th>학습 내용</th>
            		<td>${contentVo.learning_content}</td>
            	</tr>
            </table>
    			<div id="addbtn">
                   <button type="button" onclick="location.href='/management/contentUpdate?content_id=${contentVo.content_id}'">수정</button>

					 <button type="button" class="contentDelete" onclick="deleteContent('${contentVo.content_id}')">삭제</button>
                    
                </div>
            </form>
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
</script>


<%@ include file="../common/footer.jsp" %>
</html>
