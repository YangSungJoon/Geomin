<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출집계 및 조회</title>
<link rel="stylesheet" href="../resources/css/salestally.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="../resources/js/salestally.js"></script>
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
                        매출집계 및 조회
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
  
        <div class = "group_sales">
        <h2>매출 집계 및 조회</h2>
		<div id="select">
	        <label><input type="radio" name="report_type" value="yearly" > 년도별 조회</label>
	        <select id="yearSelect">
	        	<option value="2020">2020</option>
	        	<option value="2021">2021</option>
	        	<option value="2022">2022</option>
	        	<option value="2023">2023</option>
	        	
	        </select>
	        <br>
	        <label><input type="radio" name="report_type" value="monthly"> 월별 조회</label>
	        
	       <select id="contentSelect">
			    <c:forEach items="${contentNameList}" var="content">
			        <option value="${content.content_id}">${content.content_name}</option>
			    </c:forEach>
			</select>


        <button id="queryButton" class = "buttonB btnPush btnColor">조회</button>
	    </div><br>
	    <div id="salesList">
	    	<table border="1px" id="resultTable">
	    		<tr>
	    			<th>기간</th>	    			
	    			<th>매출액</th>
	    			<th>건수</th>
	    		</tr>
	    	

	    	</table>
	    
	    </div><br>
	<div style="width: 80%; margin: auto;" id="chart">
    <canvas id="salesChart"></canvas>
  </div>
  
  <!-- 꺽은선 그래프 -->
  <div style="width: 80%; margin: auto;" id="chart">
    <canvas id="salesChart2"></canvas>
  </div>
  
        </div>
	
    </div>

    
</body>

<%@include file = "../common/footer.jsp" %>
</html>