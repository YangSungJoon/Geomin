<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항-Q&A</title>
  <link rel="stylesheet" href="../resources/css/qna.css"> <!-- 스타일 시트 연결 -->
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
                        관리 마당 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        자주하는 질문
                    </a>
                </li>
            </ul>
        </div>
	  <div class = "left-sideBar">
	            <ul>
	              <c:choose>
	                  	<c:when test="${userVo.user_type == 1}">
		                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
	                		<li class = "guide"><a href = "/management/qna" id = "qna">자주하는 질문</a></li>                
	                    </c:when>
	                    <c:when test="${userVo.user_type == 2}">
		                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
	                		<li class = "guide"><a href = "/management/qna" id = "qna">자주하는 질문</a></li>                
	                    </c:when>
	                    <c:when test="${empty userVo}">
		                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
	                		<li class = "guide"><a href = "/management/qna" id = "qna">자주하는 질문</a></li>                
	                    </c:when>
	                    <c:otherwise>
		                    <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
			                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
			                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
			                <li class = "guide"><a href = "/management/qna" id = "qna">자주하는 질문</a></li>
			                <li class = "guide"><a href = "/management/salestally" id = "guide-hover">매출집계 및 조회</a></li>
	                    </c:otherwise>
	               </c:choose>
	            </ul>
	        </div>
	    
	      <h2>자주하는 질문</h2>
	      <br>
	<!-- Type 1 Announcements -->
	<div class="notice">
	   
	    <table class="table1">
	        <tr>
	            <td class = "tableName">제목</td>
	            <td class = "tableDate">날짜</td>
	        </tr>
	        <c:forEach items="${type2List}" var="announceVo">
	            <tr>
	                <td class = "contentName">
	                    <a href="/management/announcementView?announcement_id=${announceVo.announcement_id}">
	                        ${announceVo.title}
	                    </a>
	                </td>
	                <td class = "contentDate">${announceVo.announcement_date}</td>
	            </tr>
	        </c:forEach>
	    </table>
</div>
</div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>
