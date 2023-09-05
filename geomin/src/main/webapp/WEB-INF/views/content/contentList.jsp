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

            
            
            const search_levelSelect = document.getElementById('search_level');
            const learning_difficultyInput = document.querySelector('input[name="learning_difficulty"]');
            
            // 이전에 선택된 값 복구
            const selectedValue = "${learning_difficulty}";
            if (selectedValue) {
                const optionToSelect = [...search_levelSelect.options].find(option => option.value === selectedValue);
                if (optionToSelect) {
                    optionToSelect.selected = true;
                }
            }
            
            // 조회 버튼 클릭 시 선택된 값을 input에 설정
            const levelCheckButton = document.getElementById('level_check');
            levelCheckButton.addEventListener('click', function() {
                const selectedOption = search_levelSelect.options[search_levelSelect.selectedIndex];
                const selectedValue = selectedOption.value;
                learning_difficultyInput.value = selectedValue;
            });
        };
        

        

    </script>
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

메인 콘텐츠 목록 <br>
userId : ${userId} <br>
pageDto : ${pageDto } <br>
totalCnt : ${totalCnt } <br>
	

	<form action="/content/contentList" 
			method="get" name="contentListGO" autocomplete="off" >

	<input type="text" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="text" name="total" value="${pageDto.total }">
	<input name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

<div class = "intro-box">
 <form action="contentList" method="get">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습난이도 &nbsp;
                <select id="search_level">
                    <option value="">전체 ↓</option>
                    <option value="1">초급</option>
                    <option value="2">중급</option>
                    <option value="3">고급</option>
					
                </select>
<%--                 <input name="learning_difficulty" value="${learning_difficulty }"> --%>
                <button type = "submit" id = "level_check">조회</button>
            </p><hr>
        </div>
</form>

<form action="subContentListAction" method="post">

<input name="user_id" value="${userId}">
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
                </tr>
                <c:forEach items="${contentList }" var="li" varStatus="status">
				    <tr>
				        <td class="check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.content_id}"></td>
				        <td class="packageName">${li.content_name}</td>
				        <td class="people" >${li.learning_member} 명</td>
				        <td class="price" >${li.price}원</td>
				        <td>${li.sale }</td>
				        <td class="subPrice" >${li.real_price}원</td>
				        <td class="subPrice-difficulty" >${li.learning_difficulty}</td>
				        <td>${li.learning_content}</td>
				    </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button">구독신청</button>
            </div>
        </div>
</form>
    </div>

<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</body>
 <%@include file = "../common/footer.jsp" %> 
</html>