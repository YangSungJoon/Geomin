<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/homework_send.css">
<script src="../resources/js/homework_send.js"></script>
<script type="text/javascript">
		function requestAction(url, bno){
			// 폼이름을 확인!
			searchForm.action = url;
			searchForm.bno.value = bno;
			searchForm.submit();
		}
	</script>
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
                <li class = "group_add"><a href = "#" id = "group_add">학습그룹 가입신청</a></li>
                <li class = "work_send"><a href = "#" id = "work_send">숙제 제출</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습자 : ${learner.user_name }
                <button type = "button" id = "check">조회</button>
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>학습 콘텐츠</td>
                    <td>학습지도자</td>
                    <td>숙제 내용</td>
                    <td>제출기한</td>
                    <td>학습내용</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="checkbox" id="checkbox"></td>
                    <td class = "contentName">창의인성</td>
                    <td class = "readerName">이세돌</td>
                    <td class = "workContent">'축'이란 무엇인가'</td>
                    <td class = "sendDate">123456 원</td>
                    <td class = "studyContent">축이란 바둑의 수를 계속 두어도 결국 잡히게 되는 상황을 말한다</td>
                </tr>
                
                <c:forEach items = "${list}" var="worklist">
                <tr>
                	<a onclick="requestAction('/board/view', ${vo.bno })" href="#">
                    <td class = "check_box"><input type="checkbox" name="checkbox" id="checkbox" onclick = 'checkOne(this)'></td>
                    <td class = "contentName"><c:out value="${content.content_name }"/></td>
                    <td class = "readerName"><c:out value="${leader.user_name }"/></td>
                    <td class = "workContent"><c:out value="${worklist.homework_content_leader }"/></td>
                    <td class = "sendDate"><c:out value="${worklist.homework_deadline }"/></td>
                    <td class = "studyContent"><c:out value="${worklist.homework_content_learner }"/></td>
                    </a>
                </tr>
                </c:forEach>
            </table>
            <div class = "send_button_box">
                <button type = "button" id = "send_button">숙제 제출</button>
            </div>
        </div>
    </div>

</body>
<%@include file = "/common/footer.jsp" %>
</html>