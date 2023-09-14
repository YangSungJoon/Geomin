<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 그룹</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/myGroup.css">
    
     <script>
        window.onload = function() {

            
            
            
        };
    </script> 
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>
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
		<div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "#">
                        <img src="../resources/image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        강사 마당 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        나의 그룹
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/group/groupAdd?user_id=${userId}" id = "intro-hover">학습그룹 등록</a></li>
                <li class = "guide"><a href = "/group/groupApproval?user_id=${userId}" id = "guide-hover">그룹가입 승인</a></li>
                <li class = "guide"><a href = "/group/myGroup?user_id=${userId}" id = "guide-hover">나의 그룹</a></li>
                <li class = "guide"><a href = "/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "/homework_t/homework_evaluation?user_id=${userId }" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>
        
        <div class = "name-content">
	          <p>학습그룹 가입승인&nbsp;
	          </p><hr>
	      </div>
        
<form action="delGroup" method="post">

<input type="hidden" name="user_id" value="${userId}">
        <div class = "request-content">
            <table class = "table-fill">
                <tr class = "table_menu">
                    <th class = "check_box"></th>
                    <th class = "top_content">콘텐츠명</th>
                    <th class = "top_people">그룹명</th>
                    <th class = "top_sale">총인원</th>
                    <th class = "top_sale">현재인원</th>
                </tr>
                <c:forEach items="${myGroup }" var="li" varStatus="status">
	                <tr>
	                    <td class = "check_box"><input type="checkbox" name="group_id" id="checkbox1" onclick='checkOnlyOne(this)' value="${li.group_id}">
	                    						<input type="checkbox" name="content_id" id="checkbox2" style="display: none;"  value="${li.content_id}"></td>
	                    
	                    <td class="contentName button btnColor btnPush" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
	                    <td class = "people" >${li.group_name }</td>
	                    <td class = "sale"  >${li.total_personnel }</td>
	                    <td class = "sale"  >${li.current_personnel}</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button" class = "buttonA btnPush btnColor">그룹 삭제</button>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>
    </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var checkbox1Elements = document.querySelectorAll('input[name="group_id"]');
    var checkbox2Elements = document.querySelectorAll('input[name="content_id"]');

    for (var i = 0; i < checkbox1Elements.length; i++) {
        checkbox1Elements[i].addEventListener("change", function() {
            var index = Array.from(checkbox1Elements).indexOf(this);
            checkbox2Elements[index].checked = this.checked;
        });
    }
});


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