<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function getDifficultyText(difficulty) {
    switch (difficulty) {
        case "1":
            return "초급";
        case "2":
            return "중급";
        case "3":
            return "고급";
        default:
            return "미정";
    }
}

function setDifficultyText() {
    var difficultyElements = document.querySelectorAll(".difficulty-text");
    
    difficultyElements.forEach(function(element) {
        var difficultyValue = element.getAttribute("data-difficulty");
        var difficultyText = getDifficultyText(difficultyValue);
        element.textContent = difficultyText;
    });
}

// 문서가 로드되면 setDifficultyText 함수를 호출하여 학습 난이도 표시
window.onload = setDifficultyText;

</script>

</head>
<body>


<form action="SubscriptionAction">

<div class="main">

<table border="1">
    <tr>
    	<th></th>
        <th>패키지명</th>
        <th>학습가능인원</th>
        <th>정가</th>
        <th>구독료</th>
        <th>학습수준</th>
        <th>학습내용</th>
    </tr>
    <c:forEach items="${contentList }" var="li" varStatus="status">
    <tr>
    	<td><input type="checkbox" name="content_id" value="${li.content_id}" /></td>
        <td>${li.content_name }</td>
        <td>${li.learning_member } 명</td>
        <td>${li.price }원</td>
        <td>${li.real_price }원</td>
         <td class="difficulty-text" data-difficulty="${li.learning_difficulty}"></td>
        <td>${li.learning_content }</td>
    </tr>
        </c:forEach>
</table>
</div>

	<button type="submit" >구독신청</button>

</form>

	
	
	

</body>
</html>