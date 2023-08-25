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



<form action="subContentListAction" method="post">

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
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "../html/guide.html" id = "guide-hover">콘텐츠 구매</a></li>
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
                    <td>패키지명</td>
                    <td>학습가능인원</td>
                    <td>정가</td>
                    <td>구독료</td>
                    <td>학습수준</td>
                    <td>학습내용</td>
                </tr>
                <c:forEach items="${contentList }" var="li" varStatus="status">
				    <tr>
				        <td class="check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.content_id}"></td>
				        <td class="packageName"><input type="hidden" name="content_name" value="${li.content_name}"> ${li.content_name}</td>
				        <td class="people" ><input type="hidden" name="learning_member" value="${li.learning_member}">${li.learning_member} 명</td>
				        <td class="price" ><input type="hidden" name="price" value="${li.price}">${li.price}원</td>
				        <td class="subPrice" ><input type="hidden" name="real_price" value="${li.real_price}">${li.real_price}원</td>
				        <td class="subPrice-difficulty" ><input type="hidden" name="learning_difficulty" value="${li.learning_difficulty}">${li.learning_difficulty}</td>
				        <td><input type="hidden" name="learning_content" value="${li.learning_content}">${li.learning_content}</td>
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