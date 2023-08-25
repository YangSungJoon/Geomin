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
            
            
            
            
            
        };
    </script>
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

메인 콘텐츠 목록
userId : ${userId}

<form action="subContentListAction" method="post">

<input name="user_id" value="${userId}">

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
                        구독 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습콘텐츠 검색 및 구독신청
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/group/groupAdd" id = "intro-hover">학습그룹 등록</a></li>
                <li class = "guide"><a href = "/group/groupApproval" id = "guide-hover">그룹가입 승인</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습난이도 &nbsp;
                <select id="search_level">
                    <option value="level">전체 ↓</option>
                    <option value="level">초급</option>
                    <option value="level">중급</option>
                    <option value="level">고급</option>
                </select>
                <button type = "button" id = "level_check">조회</button>
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>학습자명</td>
                    <td>가입신청일자</td>
                    <td>승인여부</td>
                </tr>
                <c:forEach items="${contentList }" var="li" varStatus="status">
				    <tr>
				        <td class="check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.content_id}"></td>
				        <td class="packageName">${li.content_name}</td>
				        <td class="people" >${li.learning_member} 명</td>
				        <td class="price" >${li.price}원</td>
				    </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button">구독신청</button>
            </div>
        </div>
    </div>
</form>


</body>
 <%@include file = "../common/footer.jsp" %> 
</html>