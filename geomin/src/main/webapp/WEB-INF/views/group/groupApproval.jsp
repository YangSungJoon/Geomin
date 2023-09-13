<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>그룹가입 승인</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
  <link rel="stylesheet" href="../resources/css/groupApproval.css">
    
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

            // check3, check4 클래스를 가진 요소들을 모두 가져옴
            const check3Elements = document.querySelectorAll('.check3');
            const check4Elements = document.querySelectorAll('.check4');
            const check5Elements = document.querySelectorAll('.check5');

            // 가져온 요소들에 대해 반복문 실행
            check1Elements.forEach(function(check1Element, index) {
                // check1 클래스를 가진 체크박스가 클릭되었을 때 실행되는 함수 등록
                check1Element.addEventListener('click', function() {
                    // 연관된 check2 클래스를 가진 체크박스를 찾아서 클릭 처리
                    const associatedCheck2 = this.parentElement.querySelector('.check2');
                    if (associatedCheck2) {
                        associatedCheck2.click(); // check2 체크박스 클릭
                    }

                    // 연관된 check3 클래스를 가진 체크박스를 찾아서 클릭 처리
                    const associatedCheck3 = check3Elements[index];
                    if (associatedCheck3) {
                        associatedCheck3.click(); // check3 체크박스 클릭
                    }

                    // 연관된 check4 클래스를 가진 체크박스를 찾아서 클릭 처리
                    const associatedCheck4 = check4Elements[index];
                    if (associatedCheck4) {
                        associatedCheck4.click(); // check4 체크박스 클릭
                    }
                    
                    // 연관된 check5 클래스를 가진 체크박스를 찾아서 클릭 처리
                    const associatedCheck5 = check5Elements[index];
                    if (associatedCheck5) {
                        associatedCheck5.click(); // check4 체크박스 클릭
                    }
                });
            });
            
        };
        
        
        
    </script>
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

<input type="hidden" name="user_id" id="form1" value="${userId}">

	<form action="/group/groupApproval" 
		method="get" name="groupApprovalGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

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
                <li class = "guide"><a href = "/homework_t/homework_add?user_id=${userId }&groupyn=Y" id = "guide-hover">숙제 전송</a></li>
                <li class = "guide"><a href = "/homework_t/homework_evaluation?user_id=${userId }" id = "guide-hover">숙제 평가</a></li>
            </ul>
        </div>
        
     <form action="groupApproval" method="get">
     <input type="hidden" name="user_id" value="${userId}">
	      <div class = "name-content">
	          <p>콘텐츠명 &nbsp;
	              <select id="search_name">
	                  <option value="">전체 ↓</option>
	               <c:forEach items="${option_content_id}" var="count">
	                  <option value="${count.content_name}" >${count.content_name }</option>
				   </c:forEach>	
	              </select>
	               <button type = "submit" id = "name_check" class = "buttonB btnPush btnColor">조회</button>
	          </p><hr>
	      </div>
	      
	      <input type="hidden" name="content_name" value="${content_name }">
	      
     </form>
        
<form action="Approval" id="form2" method="post">
	<input type="hidden" name="user_id" value="${userId}">
	        <div class = "main-content-box">
	            <table class = "table-fill">
	                <tr class = "table_menu">
	                    <th class = "check_box"></th>
	                    <th class = "top_content">콘텐츠명</th>
	                    <th class = "top_people">그룹명</th>
	                    <th class = "top_subPrice">학습자명</th>
	                    <th class="top_price">가입신청일자</th>
	                    <th class = "top_sale">총 인원</th>
	                    <th class = "top_sale">현재 인원</th>
	                    <th class = "top_yn">승인여부</th>
	                </tr>
	                 <c:forEach items="${groupApproval }" var="li" varStatus="status">
					    <tr>
					           <td class="check_box">
					        	<input type="checkbox" name="user_id_learner" class="check1" id="checkbox" onclick='checkOnlyOne(this)' value="${li.user_id_learner}">
					        	<input type="checkbox" name="content_id" class="check2" id="checkbox" style="display: none;" value="${li.content_id}" >
					        </td>
					        <td class="contentName button btnColor btnPush" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
					        <td class="people" >${li.group_name }</td>
					        <td class="subPrice" >${li.learner_name}</td>
					        <td class="price" >${li.group_appdate}</td>
					        <td class = "sale" ><input type="checkbox" name="total_personnel" class="check3" id="checkbox" style="display: none;" value="${li.total_personnel}" >${li.total_personnel}명</td>
					        <td class = "sale" ><input type="checkbox" name="current_personnel" class="check4" id="checkbox" style="display: none;" value="${li.current_personnel}" >${li.current_personnel}명</td>
					        <td class = "yn" ><input type="checkbox" name="groupyn" class="check5" id="checkbox" style="display: none;" value="${li.groupyn}" >${li.groupyn}</td>
					   </tr>
	                </c:forEach> 
	               
					        
	            </table>
	            <div class = "send_button_box">
	                <button type = "submit" id = "send_button">승인</button>
	            </div>
	        </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>
    </div>

<script>


    document.addEventListener("DOMContentLoaded", function() {
        var form2 = document.querySelector("#form2"); // form2 선택

        var sendButton = document.getElementById("send_button");
        
        sendButton.addEventListener("click", function(event) {
            event.preventDefault(); // 폼 제출을 일시 중지

            var checkbox1Elements = document.querySelectorAll('.check1');
            var checkbox2Elements = document.querySelectorAll('.check2');
            var checkbox3Elements = document.querySelectorAll('.check3');
            var checkbox4Elements = document.querySelectorAll('.check4');
            var checkbox5Elements = document.querySelectorAll('.check5');

            var errorMessage = "";
            var approval = true; // 승인 여부
            var content_id = ""; // content_id 변수 초기화
            
            checkbox1Elements.forEach(function(checkbox1Element, index) {
                if (checkbox1Element.checked) {
                    var total_personnel = parseInt(checkbox3Elements[index].value.trim());
                    var current_personnel = parseInt(checkbox4Elements[index].value.trim());
                    var groupyn = checkbox5Elements[index].value.trim();
                    content_id = checkbox2Elements[index].value.trim(); // content_id 값 설정

                    
                    if (groupyn === "Y") {
                        errorMessage = "이미 승인된 학습자가 포함되어 있습니다.";
                        approval = false;
                        return;
                    } else if (total_personnel <= current_personnel) {
                        errorMessage = "총 인원수를 초과했습니다.";
                        approval = false;
                        return;
                    }
                }
            });

            if (!content_id) {
                errorMessage = "학습자를 선택해주세요."; // content_id가 없는 경우
                approval = false;
            }
            
            if (approval) {
                alert("승인 되었습니다.");
                form2.submit(); // form2 제출
            } else {
                alert(errorMessage);
            }
        });
    });
</script>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>