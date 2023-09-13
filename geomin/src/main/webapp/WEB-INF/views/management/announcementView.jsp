<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지내용</title>
  <link rel="stylesheet" href="../resources/css/announcementView.css">
</head>
  <%@include file = "../common/header.jsp" %>
<body>
	<div class = "notice_box">
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
                        공지사항
                    </a>
                </li>
            </ul>
        </div>
			<div class = "left-sideBar">
            <ul>
              <c:choose>
                  	<c:when test="${userVo.user_type == 1}">
	                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                		<li class = "guide"><a href = "/management/faq" id = "faq">자주하는질문</a></li>                
                    </c:when>
                    <c:when test="${userVo.user_type == 2}">
	                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                		<li class = "guide"><a href = "/management/faq" id = "faq">자주하는질문</a></li>                
                    </c:when>
                    <c:when test="${empty userVo}">
	                    <li class = "site-intro"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                		<li class = "guide"><a href = "/management/faq" id = "faq">자주하는질문</a></li>                
                    </c:when>
                    <c:otherwise>
	                    <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
		                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
		                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
		                <li class = "guide"><a href = "/management/faq" id = "faq">자주하는질문</a></li>
		                <li class = "guide"><a href = "/management/salestally" id = "guide-hover">매출집계 및 조회</a></li>
                    </c:otherwise>
               </c:choose>
            </ul>
        </div>
    
      <h2>공지사항</h2>
      <br>
      
      <br>
		<div class="notice">
		    <table id = "tableBox" width="800px">
		        <tr class="table_menu">
		        	<th class="announceContent">${announceVo.title}</th>
		            <th class="announceDate" height="60px">${announceVo.announcement_date}</th>
		        </tr>
		        
	            <tr>	             
	                <td class="announceContent" colspan="2" width="600px" height="600px">${announceVo.announcement_content}</td>
	            </tr>
		        
		    </table>
		    <div class = "list_btn_box">
		    	<button type = "button" class = "buttonA btnPush btnColor" onclick="location.href='/management/announcement'">목록</button>
		    </div>
		</div>
		
</div>
</body>
<%@include file = "../common/footer.jsp" %>
</html>
