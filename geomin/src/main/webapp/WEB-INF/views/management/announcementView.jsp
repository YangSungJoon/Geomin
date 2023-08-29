<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항</title>
  <link rel="stylesheet" href="styles.css"> <!-- 스타일 시트 연결 -->
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
      
      <br>
<div class="notice">
    <table border="1px">
        <tr class="table_menu">
        	<th class="announceContent">${announceVo.title}</th>
            <td class="announceDate">${announceVo.announcement_date}</td>
            
        </tr>
        
            <tr>
             
                <td class="announceContent" colspan="2">${announceVo.announcement_content}</td>
            </tr>
        
    </table>
</div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>
