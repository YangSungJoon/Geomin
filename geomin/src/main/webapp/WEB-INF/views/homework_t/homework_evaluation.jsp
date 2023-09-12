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
	
function updateEvaluationInput(selectElement) {
    // 선택한 옵션의 값을 가져옵니다.
    var selectedValue = selectElement.value;

    // input 요소를 찾습니다.
    var inputElement = document.getElementById('evaluation-input');

    // 현재 input 요소의 값 가져오기
    var currentValue = inputElement.value;

    // 선택한 옵션 값과 현재 값 사이에 콤마를 추가하고 다시 설정합니다.
    if (currentValue !== '') {
        currentValue += ', ';
    }
    inputElement.value = currentValue + selectedValue;
};
		

</script>

</head>

 <%@include file = "../common/header.jsp" %> 
<body>
<%-- userId : ${userId} <br>
pageDto : ${pageDto } <br>
totalCnt : ${totalCnt } <br> --%>

	<form action="homework_evaluation" 
		method="get" name="homework_evaluationGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">

			
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
        

		      

	      
<form action="updateEvaluation" method="post" onsubmit="return validateForm();">
<input type="hidden" name="user_id" value="${userId}">
	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">  
	
		              <button type = "submit" id = "send_button" >저장</button>
        

	        <div class = "request-content">
	            <table>
	                <tr class = "table_menu">
	                    <td class = "check_box"></td>
	                    <td>그룹명</td>
	                    <td>학습자명</td>
	                    <td>숙제제출기한</td>
	                    <td>제출일자</td>
	                    <td>학습내용</td>
	                    <td>평가</td>
	                    <td>점수</td>
	                    
	                    
	                </tr>
	                 <c:forEach items="${homeworkEval }" var="li" varStatus="status">
					    <tr>
					        <td class="check_box">
					        	<input type="checkbox" name="homework_no" class="check1" id="checkbox" value="${li.homework_no}">
					        </td>
					        <td>${li.group_name }</td>
					        <td>${li.user_name}</td>
					        <td >${li.homework_deadline}</td>
					        <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.homework_subdate}</td>
					        <td> ${li.homework_content_learner }</td>
					        <td>
						      <select class="evaluation-select" onchange="updateEvaluationInput(this)">
				                  <option value="">선택</option>
				                  <option value="우수">우수</option>
				                  <option value="보통">보통</option>
				                  <option value="미흡">미흡</option>
				              </select>
					        </td>
					        <td>${li.evaluation }</td>
					    </tr>
	                </c:forEach> 
	            </table>
			<input type="text" name="evaluation" class="evaluation-input"  id="evaluation-input">
	            
	        </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>


    </div>

<script>
// 저장 버튼 클릭 시 유효성 검사
function validateForm() {
    // homework_no 선택 여부 확인
    var homeworkNoElements = document.querySelectorAll('input[name="homework_no"]');
    var isHomeworkNoSelected = false;
    homeworkNoElements.forEach(function (homeworkNoElement) {
        if (homeworkNoElement.checked) {
            isHomeworkNoSelected = true;
        }
    });

    // evaluation 입력 여부 확인
    var evaluationValue = document.getElementById('evaluation-input').value.trim();
    if (!isHomeworkNoSelected) {
        alert('학습자를 선택해주세요.');
        return false; // 폼 전송 방지
    } else if (evaluationValue === '') {
        alert('평가점수를 선택해주세요.');
        return false; // 폼 전송 방지
    }

    // 성공적으로 등록되었을 때
    alert('점수가 등록되었습니다.');
    return true; // 폼 전송 허용
}
</script>


</body>
 <%@include file = "../common/footer.jsp" %> 
</html>