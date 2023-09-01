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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                        학습 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        학습그룹 가입신청
                    </a>
                </li>
            </ul>
        </div>

        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습그룹 가입신청</a></li>
                <li class = "guide"><a href = "../html/guide.html" id = "guide-hover">숙제 제출</a></li>
            </ul>
        </div>
        
		      
        <form action ="/homework/study_group_join?user_id=${userId}" method = "post">
        <div class = "group-content-box">
            <h2 class = "join_info">가입 정보</h2> 
            <div class = "group_content">
                <strong style='font-size: 27px'>그룹명</strong>
                	
                <select id = "select" name = "select" onchange = "onChange(this)" style='margin-left: 1rem'>
                    <option value="그룹을 선택해주세요.">선택</option>
        			<c:forEach items = "${list}" var="i">
                    <option value="
                    	학습지도자 : ${i.user_id_leader}
                    	학습기간 : ${i.learning_start} ~ ${i.learning_end}
                    	가입현황 : - / ${i.group_personnel }명
                    ">
                    ${i.group_name}
                    </option>
                    </c:forEach>
                </select>
                	<p style = "float:right;">신청자 : ${user.user_name }</p>
                <br>
                <div id = "result"></div>
                <div class = "sub_content" id = "select_view">
                    <br>
                    <!--<c:forEach items = "${list }" var = "list">
                    <p>학습지도자 명 : ${list.user_id_leader } </p>
                    <p>학습기간 : ${list.learning_start } ~ ${list.learning_end }</p>
                    <p>가입현황 : -  / ${list.group_personnel }명</p>
                    </c:forEach>-->
                </div>
            </div>
        </div>
        

        <div class = "send_button_box">
            <button type = "submit" id = "send_button" onclick = "send();">가입 신청</button>
        </div>
	</form>
	
</div>

<script>
	function send(){
    	alert('가입 신청이 완료되었습니다.');
	}
</script>

</body>
<%@include file = "../common/footer.jsp" %>
</html>