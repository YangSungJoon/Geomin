	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/css/footer.css">
	    <link rel="stylesheet" href="../resources/css/header.css">
	    <link rel="stylesheet" href="../resources/css/content_request.css">
	    <style>
	    .homeworkContent {
	        width: 90%; /* 원하는 너비로 조절하세요 */
	        height: 150px;
	        padding: 10px; /* 입력란 내부 여백 설정 */
	        box-sizing: border-box; /* 내부 여백을 포함한 크기 계산 */
	    }
	    
	    .deadline {
	        width: 20%; /* 원하는 너비로 조절하세요 */
	        height: 30px;
	        padding: 10px; /* 내부 여백 설정 */
	        box-sizing: border-box; /* 내부 여백을 포함한 크기 계산 */
	        margin: 0 auto; /* 가운데 정렬 */
	        display: block;
	        text-align: center;
	    }
	    
	    .deadlineBox {
	        text-align: center; /* 가운데 정렬 */
	    }
	
	</style>
	   <script>
	   
	   window.onload = function() {
	   
	
	    // 콘텐츠명 select 요소에 이벤트 리스너 추가
	    document.getElementById('content_id').addEventListener('change', function() {
	        // 선택된 값 가져오기
	        var selectedContentId = this.value;
	        
	        // user_id_leader input에 선택된 콘텐츠명 값 넣기
	        document.querySelector('input[name="content_id"]').value = selectedContentId;
	    });
	    
	    // 콘텐츠명 select 요소에 이벤트 리스너 추가
	    document.getElementById('content_id').addEventListener('change', function() {
	        // 선택된 값 가져오기
	        var selectedContentName = this.value;
	        
	        // user_id_leader input에 선택된 콘텐츠명 값 넣기
	        document.querySelector('input[name="content_name"]').value = selectedContentName;
	    });
	    
	    
	        const check1s = document.querySelectorAll(".check1");
	        const check2s = document.querySelectorAll(".check2");
	        const check3s = document.querySelectorAll(".check3");
	
	        check1s.forEach(function (check1, index) {
	            check1.addEventListener("change", function () {
	                check2s[index].checked = this.checked;
	                check3s[index].checked = this.checked;
	            });
	        });
	    
	        
	        
	     // 숙제 전송 버튼 클릭 시 유효성 검사
	        document.getElementById('send_button').addEventListener('click', function (e) {
	            // group_id 선택 여부 확인
	            var groupIds = document.querySelectorAll('input[name="group_id"]');
	            var isGroupSelected = false;
	            groupIds.forEach(function (groupId) {
	                if (groupId.checked) {
	                    isGroupSelected = true;
	                }
	            });

	            if (!isGroupSelected) {
	                alert('학습자를 선택해주세요.');
	                e.preventDefault(); // 폼 전송 방지
	                return;
	            }

	            // homework_content_leader 입력 여부 확인
	            var homeworkContent = document.querySelector('input[name="homework_content_leader"]').value.trim();
	            if (homeworkContent === '') {
	                alert('내용을 입력해주세요.');
	                e.preventDefault(); // 폼 전송 방지
	                return;
	            }

	            // homework_deadline 입력 여부 확인
	            var homeworkDeadline = document.querySelector('input[name="homework_deadline"]').value;
	            if (homeworkDeadline === '') {
	                alert('마감기한을 설정해주세요.');
	                e.preventDefault(); // 폼 전송 방지
	                return;
	            }

	            // 성공적으로 숙제가 전송되었을 때
	            alert('숙제가 전송되었습니다.');
	        });
	
	   };
	</script>   
	    
	</head>
	 <%@include file = "../common/header.jsp" %> 
	<body>
<%-- 	userId : ${userId} <br>
	pageDto : ${pageDto } <br>
	totalCnt : ${totalCnt } <br>
	 --%>
		<form action="homework_add" 
			method="get" name="homework_addGO" autocomplete="off" >
	
		<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
		<input type="hidden" name="total" value="${pageDto.total }">
		<input type="hidden" name="user_id" value="${userId}">
		<input type="hidden" name="groupyn" value="Y">
				
		<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
		</form>
	
	<div class = "intro-box">
	        <div class = "left-sideBar">
	            <ul>
	                <li class = "site-intro"><a href = "/group/groupAdd?user_id=${userId}" id = "intro-hover">학습그룹 등록</a></li>
	                <li class = "guide"><a href = "/group/groupApproval?user_id=${userId}" id = "guide-hover">그룹가입 승인</a></li>
	                <li class = "guide"><a href = "/group/myGroup?user_id=${userId}" id = "guide-hover">나의 그룹</a></li>
	                <li class = "guide"><a href = "/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "guide-hover">숙제 전송</a></li>
	                <li class = "guide"><a href = "/homework_t/homework_evaluation?user_id=${userId }" id = "guide-hover">숙제 평가</a></li>
	            </ul>
	        </div>
	        
	 
	 <form action="homework_sel" method="post">
	 
		        <div class = "name-content">
	
			  	          	콘텐츠명 &nbsp;
				              <select id="content_id">
				                  <option value="">전체 ↓</option>
				               <c:forEach items="${homework_option}" var="li">
				                  <option value="${li.content_name}" ${li.content_name == content_name ? 'selected' : '' } >${li.content_name }</option>
							   </c:forEach>
				              </select>
	<%-- ${pageDto.cri.exercise_name ==  ex.exercise_name ? 'selected' : '' } --%>
		        </div>
		
			      
			              <button type = "submit" id = "name_check">조회</button>
			      <input type="hidden" name="groupyn" value="Y">
			      <input type="hidden" name="content_name" class="content_name" value="${content_name }">
			      <input type="hidden" name="user_id"  value="${userId}">
			      
	</form>
		      
	<form action="homework_add" method="post">
	<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="user_id_leader" value="${userId}">
	<input type="hidden" name="groupyn" value="Y">
	  	
	        
	
		        <div class = "request-content">
		            <table>
		                <tr class = "table_menu">
		                    <td class = "check_box"></td>
		                    <td>그룹명</td>
		                    <td>콘텐츠명</td>
		                    <td>학습자명</td>
		                    
		                    
		                </tr>
		                 <c:forEach items="${groupApproval }" var="li" varStatus="status">
						    <tr>
						        <td class="check_box">
						        	<input type="checkbox" name="user_id_learner" class="check1" id="checkbox" onclick='checkOnlyOne(this)' value="${li.user_id_learner}">
						        	<input type="checkbox" name="group_id" class="check2" id="checkbox" style="display: none;" value="${li.group_id }" >
						        	<input type="checkbox" name="content_id" class="check3" id="checkbox"  style="display: none;" value="${li.content_id}" >
						        </td>
						        <td>${li.group_name }</td>
						        <td >${li.content_name}</td>
						        <td >${li.learner_name}</td>
						        <%-- <td> ${li.groupyn }</td> --%>
						    </tr>
		                </c:forEach> 
		            </table>
	
		            
		            
		            
		            <div>
		            	숙제내용
		            	<br>
		            	<input type="text" class="homeworkContent" name="homework_content_leader">
		            </div>
		        	<br>
		            <div class="deadlineBox">
		            	제출기한
		            	<input type="date" class="deadline" name="homework_deadline">
		            </div>
				
	
		            <div class = "send_button_box">
		                <button type = "submit" id = "send_button" >숙제 전송</button>
		            </div>
		        </div>
	</form>
	
	<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
	    </div>
	
	<script >
	//check 중복 체크 방지
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("user_id_learner");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  
		  const checkboxes2 
	      = document.getElementsByName("group_id");
	  
		  	  checkboxes2.forEach((cb) => {
		    cb.checked = false;
		  })
		  const checkboxes3 
	      = document.getElementsByName("content_id");
	  
		  	  checkboxes3.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  
		  element.checked = true;
		  
		  
		}
	</script>
	
	</body>
	 <%@include file = "../common/footer.jsp" %> 
	</html>