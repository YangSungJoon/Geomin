<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 그룹</title>
<link rel="stylesheet" href="../resources/css/study_group_info.css">
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
				<li><a href="#"> 나의 그룹 </a></li>
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
				<li class="guide"><a
					href="/homework/study_group_info?user_id=${userId}" id="guide-hover">나의 그룹</a></li>
			</ul>
		</div>

			<div class="group-content-box">
				<h2 class="join_info">나의 그룹</h2>
				<div class="group_content">


					<div class="right_info">
						<strong style='font-size: 27px'>가입된 그룹 정보</strong> 
						<select id="select" name="group_id" style='margin-left: 1rem' onchange="onChange(this)">
							<option value="그룹을 선택해주세요.">선택</option>
							<c:forEach items="${list}" var="list">
								<option value="${list.group_id}" 
									data-all-data="
									학습 지도자 : ${list.user_id_leader}<br>
									학습 기간 : ${list.learning_start} ~ 
                    							${list.learning_end}<br>">${list.group_name }</option>
							</c:forEach>
						</select> <br>
						<p style="float: right; margin-top: 1rem;">
						
						<div class = "group_select_view">
							<strong style='font-size: 26px'><span class = "group_name_color">승인 대기중인 그룹</span></strong>
							<select id = "select" name = "group_id" style='margin-left: 1rem' onchange="onChange(this)">
								<c:forEach items="${list2}" var="list2">
									<option value = "${list2.group_id }"
										data-all-data="
										학습 지도자 : ${list2.user_id_leader}<br>
										학습 기간 : ${list2.learning_start} ~ 
                    							${list2.learning_end}<br>">${list2.group_name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<br>

					<div id="result"></div>
				</div>
			</div>
	</div>

	<script>
		function onChange(selectElement) {
			const selectedOption = selectElement.options[selectElement.selectedIndex];
			const allData = selectedOption.getAttribute('data-all-data');
			const resultDiv = document.getElementById('result');
			resultDiv.innerHTML = allData;
		}
	</script>

</body>
<%@include file="../common/footer.jsp"%>
</html>