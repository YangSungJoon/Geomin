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
<%-- userId : ${userId} <br>
pageDto : ${pageDto } <br>
totalCnt : ${totalCnt } <br> --%>

	<form action="/group/myGroup" 
		method="get" name="myGroupGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
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

<input type="hidden" name="user_id" value="${userId}">
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
	                    <td class = "check_box"><input type="checkbox" name="group_id" id="checkbox" onclick='checkOnlyOne(this)' value="${li.group_id}"></td>
	                    <td >${li.group_name }</td>
	                    <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
	                    <td >${li.total_personnel }</td>
	                    <td >${li.current_personnel}</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button" >그룹 삭제</button>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>
    </div>

<script>

//check 중복 체크 방지
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("group_id");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	  
	  
	}


    document.addEventListener('DOMContentLoaded', function() {
        const sendButton = document.getElementById('send_button');
        sendButton.addEventListener('click', function() {
            const checkboxes = document.querySelectorAll('input[type="checkbox"]');
            let isChecked = false;

            checkboxes.forEach(function(checkbox) {
                if (checkbox.checked) {
                    isChecked = true;
                }
            });

            if (isChecked) {
                // 그룹이 선택된 경우
                alert('그룹이 삭제되었습니다.');
            } else {
                // 그룹이 선택되지 않은 경우
                alert('삭제할 그룹을 선택해주세요.');
            }
        });
    });
</script>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>