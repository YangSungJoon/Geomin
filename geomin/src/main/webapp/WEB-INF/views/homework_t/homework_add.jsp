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
    
   <script>
   
   window.onload = function() {
   
    // 그룹명 select 요소에 이벤트 리스너 추가
    document.getElementById('group_id').addEventListener('change', function() {
        // 선택된 값 가져오기
        var selectedGroupId = this.value;
        
        // user_id_leader input에 선택된 그룹명 값 넣기
        document.querySelector('input[name="group_id"]').value = selectedGroupId;
    });

    // 콘텐츠명 select 요소에 이벤트 리스너 추가
    document.getElementById('content_id').addEventListener('change', function() {
        // 선택된 값 가져오기
        var selectedContentId = this.value;
        
        // user_id_leader input에 선택된 콘텐츠명 값 넣기
        document.querySelector('input[name="content_id"]').value = selectedContentId;
    });
    
   };
</script>   
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

메인 콘텐츠 목록
userId : ${userId}	
<input name="user_id" value="${userId}">
<form action="homework_add" method="post">
<input name="user_id" value="${userId}">
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
                        구독 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습콘텐츠 검색 및 구독신청
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/group/groupAdd?user_id=${userId}" id = "intro-hover">학습그룹 등록</a></li>
                <li class = "guide"><a href = "/group/groupApproval?user_id=${userId}" id = "guide-hover">그룹가입 승인</a></li>
                <li class = "guide"><a href = "/group/myGroup?user_id=${userId}" id = "guide-hover">나의 그룹</a></li>
                <li class = "guide"><a href = "/homework_t/homework_add?user_id=${userId }" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "#" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>
        
 
	        <div class = "name-content">
		  	          	그룹명 &nbsp;
			              <select id="group_id">
			                  <option value="">전체 ↓</option>
			               <c:forEach items="${groupApproval}" var="li">
			                  <option value="${li.group_id}" >${li.group_name }</option>
						   </c:forEach>
			              </select>
		            
		  	          	콘텐츠명 &nbsp;
			              <select id="content_id">
			                  <option value="">전체 ↓</option>
			               <c:forEach items="${groupApproval}" var="li">
			                  <option value="${li.content_id}" >${li.content_name }</option>
						   </c:forEach>
			              </select>

	        </div>
	
		      
		              <button type = "submit" id = "name_check">조회</button>
 		      <input name="user_id_leader" value="${userId}">
		      <input name="group_id" value="${group_id }">
		      <input name="content_id" value="${content_id }">
		      
	      

  
        

	        <div class = "request-content">
	            <table>
	                <tr class = "table_menu">
	                    <td class = "check_box"></td>
	                    <td>콘텐츠명</td>
	                    <td>학습자명</td>
	                    
	                    
	                </tr>
	                 <c:forEach items="${groupApproval }" var="li" varStatus="status">
					    <tr>
					        <td class="check_box">
					        	<input type="checkbox" name="user_id_learner" class="check1" id="checkbox" value="${li.user_id_learner}">
					        </td>
					        <td >${li.content_name}</td>
					        <td >${li.learner_name}</td>
					    </tr>
	                </c:forEach> 
	               
				 	        
	            </table>


	            
	            
	            
	            
	            
	            <div>
	            	숙제내용
	            	<input type="text" name="homework_content_leader">
	            </div>
	            <div>
	            	제출기한
	            	<input type="date" name="homework_deadline">
	            </div>
	            
	            <div class = "send_button_box">
	                <button type = "submit" id = "send_button">숙제 전송</button>
	            </div>
	        </div>
    </div>
</form>


</body>
 <%@include file = "../common/footer.jsp" %> 
</html>