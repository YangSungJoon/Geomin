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
            const difficultyCells = document.querySelectorAll('.subPrice-difficulty');

            difficultyCells.forEach(cell => {
                const difficultyValue = cell.textContent.trim();
                let difficultyText = '';

                switch (difficultyValue) {
                    case '1':
                        difficultyText = '초급';
                        break;
                    case '2':
                        difficultyText = '중급';
                        break;
                    case '3':
                        difficultyText = '고급';
                        break;
                    default:
                        difficultyText = '기타';
                }

                cell.textContent = difficultyText;
            });
            
        };
        
        
        window.onload = function() {
            const searchNameSelect = document.getElementById('search_name');
            const contentNameInput = document.querySelector('input[name="content_name"]');
            
            // 이전에 선택된 값 복구
            const selectedValue = "${content_name}";
            if (selectedValue) {
                const optionToSelect = [...searchNameSelect.options].find(option => option.value === selectedValue);
                if (optionToSelect) {
                    optionToSelect.selected = true;
                }
            }
            
            // 조회 버튼 클릭 시 선택된 값을 input에 설정
            const levelCheckButton = document.getElementById('name_check');
            levelCheckButton.addEventListener('click', function() {
                const selectedOption = searchNameSelect.options[searchNameSelect.selectedIndex];
                const selectedValue = selectedOption.value;
                contentNameInput.value = selectedValue;
            });
        

            
            // check1 클래스를 가진 요소들을 모두 가져옴
            const check1Elements = document.querySelectorAll('.check1');
            
            // 가져온 요소들에 대해 반복문 실행
            check1Elements.forEach(function(check1Element) {
              // check1 클래스를 가진 체크박스가 클릭되었을 때 실행되는 함수 등록
              check1Element.addEventListener('click', function() {
                // 연관된 check2 클래스를 가진 체크박스를 찾아서 클릭 처리
                const associatedCheck2 = this.parentElement.querySelector('.check2');
                if (associatedCheck2) {
                  associatedCheck2.click(); // check2 체크박스 클릭
                }
              });
            });
            
        };
        
        
        
    </script>
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

메인 콘텐츠 목록
userId : ${userId}	
<input name="user_id" value="${userId}">

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
        
     <form action="groupApproval" method="get">
     <input name="user_id" value="${userId}">
	      <div class = "name-content">
	          <p>콘텐츠명 &nbsp;
	              <select id="search_name">
	                  <option value="">전체 ↓</option>
	               <c:forEach items="${option_content_id}" var="count">
	                  <option value="${count.content_name}" >${count.content_name }</option>
				   </c:forEach>
	              </select>
	              <button type = "submit" id = "name_check">조회</button>
	          </p><hr>
	      </div>
	      
	      <input name="content_name" value="${content_name }">
	      
     </form>
        
<form action="Approval" method="post">
	<input name="user_id" value="${userId}">
	        <div class = "request-content">
	            <table>
	                <tr class = "table_menu">
	                    <td class = "check_box"></td>
	                    <td>콘텐츠명</td>
	                    <td>학습자명</td>
	                    <td>가입신청일자</td>
	                    <td>총 인원</td>
	                    <td>현재 인원</td>
	                    <td>승인여부</td>
	                </tr>
	                 <c:forEach items="${groupApproval }" var="li" varStatus="status">
					    <tr>
					        <td class="check_box">
					        	<input type="checkbox" name="user_id_learner" class="check1" id="checkbox" value="${li.user_id_learner}">
					        	<input type="checkbox" name="content_id" class="check2" id="checkbox" style="display: none;" value="${li.content_id}" >
					        </td>
					        <td >${li.content_name}</td>
					        <td >${li.learner_name}</td>
					        <td >${li.group_appdate}</td>
					        <td >${li.total_personnel}명</td>
					        <td >${li.current_personnel}명</td>
					        <td >${li.groupyn}</td>
					    </tr>
	                </c:forEach> 
	               
					        
	            </table>
	            <div class = "send_button_box">
	                <button type = "submit" id = "send_button">승인</button>
	            </div>
	        </div>
</form>
    </div>


</body>
 <%@include file = "../common/footer.jsp" %> 
</html>