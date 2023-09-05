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

            
            
            
        };
    </script> 
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

구독 콘텐츠 목록
userId : ${userId} <br>
pageDto : ${pageDto } <br>
totalCnt : ${totalCnt } <br>

	<form action="/group/myGroup" 
		method="get" name="myGroupGO" autocomplete="off" >

	<input type="text" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="text" name="total" value="${pageDto.total }">
	<input name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

<div class = "intro-box">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/group/groupAdd?user_id=${userId}" id = "intro-hover">학습그룹 등록</a></li>
                <li class = "guide"><a href = "/group/groupApproval?user_id=${userId}" id = "guide-hover">그룹가입 승인</a></li>
                <li class = "guide"><a href = "/group/myGroup?user_id=${userId}" id = "guide-hover">나의 그룹</a></li>
                <li class = "guide"><a href = "/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "/homework_t/homework_evaluation?user_id=${userId }" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>

<form action="delGroup" method="post">

<input name="user_id" value="${userId}">
        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>그룹명</td>
                    <td>콘텐츠명</td>
                    <td>총인원</td>
                    <td>현재인원</td>
                </tr>
                <c:forEach items="${myGroup }" var="li" varStatus="status">
	                <tr>
	                    <td class = "check_box"><input type="checkbox" name="group_id" id="checkbox" value="${li.group_id}"></td>
	                    <td >${li.group_name }</td>
	                    <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.content_name }</td>
	                    <td >${li.total_personnel }</td>
	                    <td >${li.current_personnel}</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button">그룹 삭제</button>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>
    </div>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>