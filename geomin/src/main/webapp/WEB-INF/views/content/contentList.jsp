<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/content_request.css">
     

       
     <script>
        window.onload = function() {
            const difficultyCells = document.querySelectorAll('.subPrice-difficulty');

            difficultyCells.forEach(cell => {
                const difficultyValue = cell.textContent.trim();
                let difficultyText = '';

                switch (difficultyValue) {
                    case '1':
                        difficultyText = '초급';
                        break;
                    case '2':
                        difficultyText = '중급';
                        break;
                    case '3':
                        difficultyText = '고급';
                        break;
                    default:
                        difficultyText = '기타';
                }

                cell.textContent = difficultyText;
            });

          
            document.getElementById('search_level').addEventListener('change', function() {
            	
            	var selectedSearch_level = this.value;
            	
            	document.querySelector('input[name="learning_difficulty"]').value = selectedSearch_level;
            	
            });
            


        };

    </script>
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

	<form action="/content/contentList" 
			method="get" name="contentListGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

<div class = "intro-box">
 <form action="contentList" method="post">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습난이도 &nbsp;
                <select id="search_level">
                    <option value="" >전체 ↓</option>
				    <option value="1" <c:if test="${param.learning_difficulty == '1'}">selected="selected"</c:if>>초급</option>
				    <option value="2" <c:if test="${param.learning_difficulty == '2'}">selected="selected"</c:if>>중급</option>
				    <option value="3" <c:if test="${param.learning_difficulty == '3'}">selected="selected"</c:if>>고급</option>
					
                </select>
                <button type = "submit" id = "level_check">조회</button>

                 <input type="hidden" name="learning_difficulty" value="${learning_difficulty }">
            </p><hr>
        </div>
</form>


<form action="subContentListAction" method="post" name="myForm">

<input type="hidden" name="user_id" value="${userId}">
        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>패키지명</td>
                    <td>학습가능인원</td>
                    <td>정가</td>
                    <td>할일율</td>
                    <td>구독료</td>
                    <td>학습수준</td>
                    <td>학습내용</td>
                    <td>삭제유무</td>
                </tr>
                <c:forEach items="${contentList }" var="li" varStatus="status">
				    <tr>
				        <td class="check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.content_id}"></td>
				        <td class="packageName" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
				        <td class="people" >${li.learning_member} 명</td>
				        <td class="price" >${li.price}원</td>
				        <td>${li.sale }</td>
				        <td class="subPrice" >${li.real_price}원</td>
				        <td class="subPrice-difficulty" >${li.learning_difficulty}</td>
				        <td class="content" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.learning_content}</td>
				        <td>${li.is_deleted}</td>
				    </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button">구독신청</button>
            </div>
        </div>
</form>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
    </div>

<script>
// JavaScript 코드 추가
function showAlert(message) {
    alert(message);
}

// 구독 신청 폼 submit 이벤트 처리
document.querySelector("form[name='myForm']").addEventListener("submit", function (event) {
    event.preventDefault(); // 기본 동작 방지 (페이지 새로고침 방지)

    // 여기에서 AJAX 요청을 수행하고, 성공 또는 실패에 따라 showAlert 함수 호출
    fetch("subContentListAction", {
        method: "POST",
        body: new FormData(this), // 폼 데이터를 전송
    })
    .then(response => {
        if (response.ok) {
            showAlert("구독 성공!");
        } else {
            showAlert("구독 실패!");
        }
    })
    .catch(error => {
        console.error("오류 발생:", error);
        showAlert("구독 실패! 오류 발생");
    });
});
</script>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>