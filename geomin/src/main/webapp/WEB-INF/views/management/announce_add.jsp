<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지등록</title>
  <link rel="stylesheet" href="../resources/css/announce_add.css"> <!-- 스타일 시트 연결 -->
</head>
  <%@include file = "../common/header.jsp" %>
<body>
  <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                <li class = "guide"><a href = "/management/qna" id = "qna">Q&A</a></li>
                <li class = "guide"><a href = "/management/salestally" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
    
      <h2>공지등록</h2>
      <br>
<form action="announceInsert" method="post">

	<div class = "notice_type">
                <select name="announcement_type" id="type">
                    <option value="1">안내문 공지</option>
                    <option value="2">자주문의하는 내용</option>
                </select>
      </div>	
		<br>
    <div class="notice_title">
      <label for="title">제목:</label>
      <input type="text" id="title" name="title" required>
    </div>
      <br>
     <div class="notice_content">
      <label for="content">내용:</label>
      <textarea id="content" name="announcement_content" required></textarea>
     </div> <br>
     
      <input type="submit" value="등록">
  </form>
 
  

</body>
<%@include file = "../common/footer.jsp" %>
</html>
