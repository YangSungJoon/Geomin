<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/study_group_join.css">
<script src="../resources/js/study_group_join.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<%@include file="../common/header.jsp"%>
<body>
	<div class="intro-box">

		<div class="location">
			<ul class="clearFix">
				<li class="home"><a href="#"> <img
						src="../resources/image/homeicon.png" alt=""> /
				</a></li>
				<li><a href="#"> 학습 서비스 / </a></li>
				<li><a href="#"> 학습그룹 가입신청 </a></li>
			</ul>
		</div>

		<div class="left-sideBar">
			<ul>
				<li class="site-intro"><a
					href="/homework/study_group_join?user_id=${userId}"
					id="intro-hover">학습그룹 가입신청</a></li>
				<li class="guide"><a
					href="/homework/homework_send?user_id=${userId}" id="guide-hover">숙제
						제출</a></li>
			</ul>
		</div>


		<form action="/homework/study_group_join?user_id=${userId}"
			method="post" onsubmit="submitForm()">
			<div class="group-content-box">
				<h2 class="join_info">가입 정보</h2>
				<div class="group_content">


					<div class="right_info">
						<strong style='font-size: 27px'>신청 그룹 선택</strong> 
						<select id="select" name="group_id" style='margin-left: 1rem' onchange="onChange(this)">
							<option value="그룹을 선택해주세요.">선택</option>
							<c:forEach items="${list}" var="list">
								<option value="${list.group_id}" 
									data-all-data="
									학습 지도자 : ${list.user_id_leader}<br>
                    				학습 기간 : ${list.learning_start} ~ 
                    							${list.learning_end}<br>
        							가입현황 : ${list.group_personnel}<br>">${list.group_name }</option>
							</c:forEach>
						</select> <br>
						<p style="float: right; margin-top: 1rem;">
							<strong>신청자 : </strong>${user.user_name }</p>
					</div>
					<br>

					<div id="result"></div>
				</div>
			</div>


			<div class="send_button_box">
				<button type="submit" class = "button btnColor btnPush" id="send_button" onclick="send();">가입
					신청</button>
			</div>
		</form>

	</div>

	<script>
		function onChange(selectElement) {
			const selectedOption = selectElement.options[selectElement.selectedIndex];
			const allData = selectedOption.getAttribute('data-all-data');
			const resultDiv = document.getElementById('result');
			resultDiv.innerHTML = allData;
		}

		function send() {
			alert('가입 신청이 완료되었습니다.');
		}

	</script>

</body>
<%@include file="../common/footer.jsp"%>
</html>