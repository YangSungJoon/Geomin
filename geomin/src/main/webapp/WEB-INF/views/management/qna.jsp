<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항-Q&A</title>
  <link rel="stylesheet" href="../resources/css/announcement.css"> <!-- 스타일 시트 연결 -->
</head>
  <%@include file = "../common/header.jsp" %>
<body>
  <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                <li class = "guide"><a href = "/management/qna" id = "qna">Q&A</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
    
      <h2>공지사항</h2>
      <br>
<!-- Type 1 Announcements -->
<div class="notice">
   
    
    <h3>자주문의하는 내용</h3>
    <br>
    <table border="1px" class="table2">
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>날짜</td>
        </tr>
        <c:forEach items="${type2List}" var="announceVo">
            <tr>
                <td class="announceContent">${announceVo.announcement_id}</td>
                <td class="announceTitle">
                    <a href="/management/announcementView?announcement_id=${announceVo.announcement_id}">
                        ${announceVo.title}
                    </a>
                </td>
                <td class="announceDate">${announceVo.announcement_date}</td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
<%@include file = "../common/footer.jsp" %>
</html>
