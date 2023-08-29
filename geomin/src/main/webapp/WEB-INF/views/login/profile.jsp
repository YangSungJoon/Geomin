<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보</title>
    
    <link rel="stylesheet" href="../resources/css/profile.css">
    <link rel="stylesheet" href="../resources/css/intro.css">
</head>
<%@include file = "../common/header.jsp" %>
<body>


	<div class='regi_area'>
		<div class="intro-box">
			<div class="location">
				<ul class="clearFix">
					<li class="home"><a href="#"> 
						<img src="../resources/image/homeicon.png" alt=""> 
					</a></li>
					<li><a href="#"> 회원가입 / </a></li>
					<li><a href="#"> 회원등록 </a></li>
				</ul>
			</div>
			<div class="left-sideBar">
				<ul>
					
					<li class="guide"><a href="#" id="guide-hover">회원 정보</a></li>
				</ul>
			</div>
			<div class='regi_center slide-in'>
				<div class='regi_logo'>회원 정보</div>
				
				<div class='regi_box_id'>
                <div>
                <h5>아이디</h5>
                	&nbsp&nbsp
               		<span id="userId">${userVo.user_id}</span>                         
               	</div> 	
            </div><br>
				
				<div class='regi_box_name'>
					<div>
					<h5>이름</h5>
					&nbsp&nbsp&nbsp&nbsp
						${userVo.user_name}
					</div>
				</div>
				<div class='regi_box_birth'>
					
						<h5>생년월일</h5>
						${userVo.datebirth}
				</div>
				

			<div class='regi_box_member' >
			    <h5>회원구분</h5>
			    <c:choose>
			        <c:when test="${userVo.user_type == '1'}">
			            학습지도자
			        </c:when>
			        <c:when test="${userVo.user_type == '2'}">
			            학습자
			        </c:when>
			        <c:when test="${userVo.user_type == '3'}">
			            운영자
			        </c:when>
			        <c:otherwise>
			            기타
			        </c:otherwise>
			    </c:choose>
			</div>
            
			<div class='gender_box'>
                <h5>성별</h5>
			    <c:choose>
			        <c:when test="${userVo.gender == '남자'}">
			            남자
			        </c:when>
			        <c:when test="${userVo.gender == '여자'}">
			            여자
			        </c:when>
			        <c:otherwise>
			            기타
			        </c:otherwise>
			    </c:choose>
            </div>
            
            <div class='regi_box_id'>
            	<div>
					<h5>이메일 주소</h5>
					<h5 class="star">&nbsp*</h5>
				</div><br>
						${userVo.email}
					<input type="button" class="emailEdit" value="수정하기">
				</div>

				<div class='regi_box_phone'>
				<div>
					<h5>전화번호</h5>
					<h5 class="star">&nbsp*</h5>
				</div><br>
					${userVo.phonenumber }	
					<input type="button" class="phoneEdit" value="수정하기">
				</div>
					<div class='regi_box_pw'>
					<div>
						<h5>비밀번호</h5>
						<h5 class="star">&nbsp*</h5>
					</div>
					<input type="password" name="userPw" id="userPw"
						placeholder='공백없이 영문(대/소문자) 숫자 및 특수문자 조합 8-15자' maxlength='15'
						autocomplete='off' style='text-align: center;' value="">
				</div>
				<div class='regi_box_pw_check'>
					<div>
						<h5>비밀번호 확인</h5>
						<h5 class="star">&nbsp*</h5>
					</div>
					<input type="password" name="userPwCheck" id="userPwCheck"
						placeholder='비밀번호를 한번 더 입력하세요' maxlength='15' autocomplete='off'
						style='text-align: center;' value="">
				</div>		
				<input type="button" class="passwordEdit" value="수정하기" onclick="passwordEditAction()">
							
			</div>
		</div>
	</div>
</body>
<script>
function passwordEditAction() {
    var userPw = document.getElementById("userPw").value;
    var userPwCheck = document.getElementById("userPwCheck").value;

    // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (userPw !== userPwCheck) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }
    
    var user_id = document.getElementById("userId").textContent;

    var data = {
        user_id: user_id, // 사용자 아이디
        user_pw: userPw // 새로운 비밀번호
    };

    fetch("/passwordEditAction", {
    	method : "POST",
    	headers : {
    		"Content-Type" : "application/json"
    	},
    	body : JSON.stringify(data)
    })
    .then(response =>response.json())
    .then(result => {
    	if(result.check){
    		alert("비밀번호가 성공적으로 변경되었습니다.");
    		location.reload();
    	}else {
    		alert("비밀번호 변경에 실패하였습니다.");
    	}
    })
    .catch(error => {
    	console.error("Error", error);
    	alert("서버와의 통신 쪽에 오류가 발생하였습니다.");
    });
}
</script>


<%@include file = "../common/footer.jsp" %>
</html>