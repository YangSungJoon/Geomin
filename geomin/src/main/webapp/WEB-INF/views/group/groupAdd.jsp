<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습그룹 등록</title>
<link rel="stylesheet" href="../resources/css/groupadd.css">
</head>
<%@include file = "../common/header.jsp" %>
<body>
<%-- userId : ${userId} <br>
pageDto : ${pageDto } <br>
totalCnt : ${totalCnt } <br> --%>
	<input type="hidden" name="user_id" value="${userId}">

<div class="intro-box">
			<div class="location">
				<ul class="clearFix">
					<li class="home"><a href="#"> 
						<img src="../resources/image/homeicon.png" alt=""> 
					</a></li>
					<li><a href="#"> / 강사마당  </a></li>
					<li><a href="#"> / 학습그룹 등록  </a></li>
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
        
   <form action="groupAdd" method="post" >

        <div id = "wrap_container">

            <div class ="h2_container_box">
            	<h2>정보 입력</h2>
            </div>
            
            <div class = "left_content">
				<p>콘텐츠 명<span class = "star">*</span></p>
				
      		   <select name="content_id" id = "type">
				<c:forEach items="${option_content_id }" var="li" varStatus="status">
				   	<option  value="${li.content_id }" data-total-personnel="${li.total_personnel}">${li.content_name }</option>
			    </c:forEach>
			   </select>
			   

            	<div class="form_group">
                	<p>그룹명<span class = "star">*</span></p>
                	<input type="text" name="group_name">
                </div>
                
                <div class="form_group">
	                <p>그룹인원<span class = "star">*</span></p>
	                <input type="text" name="group_personnel" >
                </div>
                <div class="form_group">
	                <p>학습기간<span class = "star">*</span></p>
	                 <input type="date" name="learning_start"> ~ <input type="date" name="learning_end">
				</div>
				
                <div class = "button__box">
                    <button type = "submit" id = "add_button"  class ="buttonA btnPush btnColor">학습그룹 등록</button>
                </div>

            </div>
        </div>




	<input type="hidden" name="user_id_leader" value="${userId}"><br>
	<input type="hidden" name="learning_member" value="${learning_member}"><br>
	<input type="hidden" name="user_id" value="${userId}"><br>

    </form>
    </div>
<script>



document.addEventListener("DOMContentLoaded", function() {
    var contentSelect = document.querySelector('select[name="content_id"]');
    var groupPersonnelInput = document.querySelector('input[name="group_personnel"]');

    // 초기 선택값 설정
    updateGroupPersonnel(contentSelect, groupPersonnelInput);

    contentSelect.addEventListener("change", function() {
        updateGroupPersonnel(contentSelect, groupPersonnelInput);
    });
});

function updateGroupPersonnel(contentSelect, groupPersonnelInput) {
    var selectedOption = contentSelect.options[contentSelect.selectedIndex];
    var totalPersonnel = selectedOption.getAttribute("data-total-personnel");
    groupPersonnelInput.value = totalPersonnel;
}


    document.addEventListener("DOMContentLoaded", function() {
        var form = document.querySelector("form");

        form.addEventListener("submit", function(event) {
            event.preventDefault(); // 폼 제출을 일시 중지

            var groupName = document.querySelector('input[name="group_name"]').value.trim();
            var groupPersonnel = document.querySelector('input[name="group_personnel"]').value.trim();
            var learningStart = document.querySelector('input[name="learning_start"]').value.trim();
            var learningEnd = document.querySelector('input[name="learning_end"]').value.trim();

            var errorMessage = "";

            if (groupName === "" || groupPersonnel === "" || learningStart === "" || learningEnd === "") {
                alert("내용을 전부 입력해주세요.");
            } else {
                alert("그룹이 생성되었습니다.");
                form.submit(); // 폼 제출
            }
        });
    });
</script>
    
</body>
<%@include file = "../common/footer.jsp" %>
</html>