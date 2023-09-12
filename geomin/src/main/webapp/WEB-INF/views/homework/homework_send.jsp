<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/homework_send.css">
<link rel="stylesheet" href="../resources/css/modal.css">
<script src="../resources/js/homework_send.js"></script>
<script src="../resources/js/modal.js"></script>

</head>
<%@include file = "../common/header.jsp" %>
<body>
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
                        학습 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        숙제 제출
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/homework/study_group_join?user_id=${userId}" id = "group_add">학습그룹 가입신청</a></li>
                <li class = "guide"><a href = "/homework/homework_send?user_id=${userId}" id = "work_send">숙제 제출</a></li>
                <li class="guide"><a
					href="/homework/study_group_info?user_id=${userId}" id="guide-hover">나의 그룹</a></li>
            </ul>
        </div>
        
        <div class = "name-content">
            <p>학습자 : ${user.user_name}
            </p><hr>
        </div>

        
            <table class = "table-fill">
                <tr class = "table_menu">
                    <th class = "top_content">학습 콘텐츠</th>
                    <th class = "top_leader">학습지도자</th>
                    <th class = "top_content_info">숙제 내용</th>
                    <th class = "top_deadline">제출기한</th>
                    <th class = "top_content_send">학습내용</th>
                </tr>
                
                <c:forEach items = "${list}" var="worklist">
                <tr>
                    <td class = "contentName button btnColor btnPush"><a href ="/management/contentListView?content_id=${worklist.content_id}">
                    <strong><c:out value="${worklist.content_name }"/></strong></a></td>
                    <td class = "readerName"><c:out value="${worklist.user_id_leader }"/></td>
                    <td class = "workContent"><c:out value="${worklist.homework_content_leader }"/></td>
                    <td class = "sendDate" style = "color: red; font-weight: bold;" ><c:out value="${worklist.homework_deadline }"/></td>
                    <td class = "studyContent">
                    <c:choose>
                    <c:when test="${not empty worklist.homework_content_learner }">
                   		<c:out value="${worklist.homework_content_learner }"/>
                    </c:when>
                    <c:otherwise>
                    <form action="/homework/homework_sendAction" method="post">
                    <div class = "bottom-button_box">
                    	<input type="hidden" name="user_id" value="${userId}">
                    	<input type="text" name="homework_content_learner" id="content_send_box" placeholder = '학습 내용을 입력해주세요.'>
                    	<input type="hidden" name="user_id_learner" value="${worklist.user_id_learner }">
                    	<button type ="submit" onclick = "send()" class = "buttonS buttonPush buttonColor">제출</button>
                    	</div>
                    </form>
                    </c:otherwise>
                    </c:choose>
                    </td>
                    <!-- <td class = "studyContent"><c:out value="${worklist.homework_content_learner }"/></td> -->
                </tr>
                </c:forEach>
            </table>
            
        </div>

<script>
	function send(){
    	alert('학습 내용 등록이 완료되었습니다.');
	}
</script>

</body>
<%@include file = "../common/footer.jsp" %>
</html>