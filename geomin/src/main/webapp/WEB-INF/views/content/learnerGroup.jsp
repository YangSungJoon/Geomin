<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/content_request.css">
</head>
<%@include file = "../../common/header.jsp" %>
<body>

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
            <p>학습콘텐츠 &nbsp;
                <select id="search_level">
                    <option value="level">전체</option>
            <c:forEach items="${subContentList }" var="si" varStatus="status">
                    <option value="${li.content_id }">${si.content_name }</option>
            </c:forEach>
                </select>&nbsp;&nbsp;&nbsp;
			                그룹명 : $___ &nbsp;&nbsp;&nbsp;
			                가입인원 : -명 / -명 &nbsp;&nbsp;&nbsp;
                <button type = "button" id = "">조회</button>
                <button type = "button" id = "">승인</button>
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
            <c:forEach items="${learnerGroup }" var="li" varStatus="status">
                <tr>
                    <td class = "check_box"><input type="checkbox" name="content_id" id="checkbox" value="${li.user_id_learner}"></td>
                    <td class = "name" >${li.learner_name }</td>
                    <td class = "date">${li.group_appdate}</td>
                    <td class = "yn">${li.groupyn }</td>
                </tr>
			</c:forEach>               
            </table>
        </div>
    </div>

</body>
<%@include file = "../../common/footer.jsp" %>
</html>