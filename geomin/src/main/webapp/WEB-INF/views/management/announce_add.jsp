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
<div class='regi_area'>
		<div class="intro-box">
			<div class="location">
				<ul class="clearFix">
					<li class="home"><a href="#"> 
						<img src="../resources/image/homeicon.png" alt=""> 
					</a></li>
					<li><a href="#"> / 관리마당  </a></li>
					<li><a href="#"> / 공지 등록  </a></li>
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
        
<form action="announceInsert" method="post">

		<div id ="wrap_container">
			<div class = "h2_container_box">
				<h2>공지등록</h2>
			</div>
                <select name="announcement_type" id="type">
                    <option value="1">공지사항</option>
                    <option value="2">자주하는 질문</option>
                </select>
		<br>
		    <div class="form_group">
		      <label for="title">제목:</label>
		      <input type="text" id="title" name="title" required>
		    </div>
		     <div class="form_group">
		      <label for="content">내용:</label>
		      <textarea id="content" name="announcement_content" required></textarea>
		     </div> <br>
		     
		     <div class = "button__box">
		      <input type="submit" class ="buttonA btnPush btnColor" value="등록">
		     </div>
		</div>
  </form>
</div>
  </div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>
