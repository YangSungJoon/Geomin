<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

구독 콘텐츠 목록 <br>
<%-- 
pageDto : ${pageDto }<br>
subTotalCnt :  ${subTotalCnt }<br> --%>

	<form action="/content/subContentList" 
		method="get" name="subContentListGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

<form action="payStatus" method="post">

<input type="hidden" name="user_id" value="${userId}">

<div class = "intro-box">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>패키지명</td>
                    <td>학습가능인원</td>
                    <td>구독료</td>
                    <td>학습수준</td>
                    <td>학습내용</td>
                    <td>구독신청일</td>
                    <td>결제상태</td>
                </tr>
                <c:forEach items="${subContentList }" var="li" varStatus="status">
	                <tr>
	                    <td class = "check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.content_id}"></td>
	                    <td class = "packageName" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.content_name }</td>
	                    <td class = "people">${li.learning_member } 명</td>
	                    <td class = "subPrice">${li.real_price }원</td>
	                    <td class="subPrice-difficulty">${li.learning_difficulty}</td>
	                    <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.learning_content }</td>
	                    <td>${li.subscription_date }</td>
	                    <td>${li.paystatus }</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button" onclick="alert('결제가 취소되었 습니다.')">결제 취소</button>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>


</body>
 <%@include file = "../common/footer.jsp" %> 
</html>