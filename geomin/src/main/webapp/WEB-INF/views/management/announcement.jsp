<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>어린이 바둑 교육 사이트 - 공지사항</title>
  <link rel="stylesheet" href="styles.css"> <!-- 스타일 시트 연결 -->
</head>
  <%@include file = "../common/header.jsp" %>
<body>
  <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "site-intro"><a href = "/management/announcement" id = "insert_announce">공지 등록</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
    <section class="notice">
      <h2>공지사항</h2>
      <div class="notice-item">
        <h3>중요한 안내사항</h3>
        <p>안녕하세요, 어린이 바둑 교육 사이트 운영자입니다. 중요한 안내사항이 있습니다...</p>
        <span class="date">2023-08-28</span>
      </div>
      
      <div class="notice-item">
        <h3>이달의 이벤트</h3>
        <p>이달에는 특별한 이벤트가 준비되어 있습니다. 바둑을 배우고 재미있는 상품을 받아보세요!</p>
        <span class="date">2023-08-15</span>
      </div>
      
      <!-- 더 많은 공지사항 아이템 추가 -->
    </section>
 
  

</body>
<%@include file = "../common/footer.jsp" %>
</html>
