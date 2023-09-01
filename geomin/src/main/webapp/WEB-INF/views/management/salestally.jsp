<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습콘텐츠 목록</title>
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
                        <img src="../image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        강사 마당 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습그룹 등록
                    </a>
                </li>
            </ul>
        </div>
        
        
        
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/management/learner_content" id = "intro-hover">학습콘텐츠 등록</a></li>
                <li class = "guide"><a href = "/management/announce_add" id = "insert_announce">공지 등록</a></li>
                <li class = "guide"><a href = "/management/announcement" id = "announcement">공지사항</a></li>
                <li class = "guide"><a href = "/management/qna" id = "qna">Q&A</a></li>
                <li class = "guide"><a href = "/management/salestally" id = "guide-hover">매출집계 및 조회</a></li>
            </ul>
        </div>
  
        <div class = "group_sales">
		<div id="select">
	        <label><input type="radio" name="report_type" value="yearly" > 년도별 조회</label>
	        <select id="yearSelect">
	        	<option value="2021">2021</option>
	        	<option value="2022">2022</option>
	        	<option value="2023">2023</option>
	        	<option value="2024">2024</option>
	        	<option value="2025">2025</option>
	        </select>
	        
	        <label><input type="radio" name="report_type" value="monthly"> 월별 조회</label>
	        <select id="contentSelect">
	        	<option value="콘텐츠명1">콘텐츠명1</option>
	        	<option value="콘텐츠명2">콘텐츠명2</option>
	        	<option value="콘텐츠명3">콘텐츠명3</option>
	        	<option value="콘텐츠명4">콘텐츠명4</option>
	        	<option value="콘텐츠명5">콘텐츠명5</option>
	        </select>
        <button id="queryButton">조회</button>
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
        </div>
	
    </div>

    
</body>

<%@include file = "../common/footer.jsp" %>
</html>