<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="../resources/css/regist.css">
    <link rel="stylesheet" href="../resources/css/intro.css">
    <script src='../resources/js/regist.js'></script>
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
				<div class='regi_logo'>정보 입력</div>
				<div class='regi_box_id'>
				
                <div id="idbox">
                
                <h5 id="id1">아이디<span class="star">&nbsp*</span></h5>
               
                <div id="registMsg"></div>
                </div>
                <div class = "id_check_box">
                <input type="text" name="userId" id="userId" placeholder='공백없이 영문/숫자 6자' 
                autocomplete='off' style='text-align: center;' value="">
                    <button type = "button" id = "idCheck">중복확인</button>
                    
                </div>
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
				<div class='regi_box_name'>
					<h5>이름</h5>
					<input type="text" name="userName" id="userName" autocomplete='off'
						style='text-align: center;' value="">
				</div>
				<div class='regi_box_birth'>
					<div>
						<h5>생년월일</h5>
						<h5 class="star">&nbsp*</h5>
					</div>
					<input type="date" name="brithDate" id="birthDate"
						style='text-align: center;' value="">
				</div>
				<div class='regi_box_id'>
					<h5>이메일 주소</h5>
					<input type="email" name="userEmail" id="userEmail"
						placeholder='이메일 주소를 입력하세요' autocomplete='off'
						style='text-align: center;' value="">
				</div>

				<div class='regi_box_member'>
                <div><h5>회원구분</h5><h5 class = "star">&nbsp*</h5></div>
                &nbsp&nbsp&nbsp
            </div>
            <div class = "member_check">
                <select name="" id="userType">
                    <option value="1">학습지도자</option>
                    <option value="2">학습자</option>
                    <option value="3">운영자</option>
                </select>
            </div>
			<div class='gender_box'>
                <h5>성별</h5>
            <div class = "check">
                
	            <label for="male">
	            <input type="radio" name="gender" id="male" value="남자">남자</label>
				
				<label for="female">
	            <input type="radio" name="gender" id="female" value="여자"> 여자
        	</label>
                </div>
            </div>

				<div class='regi_box_phone'>
					<div>
						<h5>전화번호</h5>
						<h5 class="star">&nbsp*</h5>
					</div>
					<div>
						<input type="tel" name="userPhone" id="userPhone"
							placeholder='(-)없이 지역번호 포함 숫자' oninput='phoneNum()'
							maxlength='13' autocomplete='off' style='text-align: center;'>
					</div>
				</div>
				<!-- 중복확인 결과를 저장할 hidden input 요소 -->
    				<input type="hidden" name="idCheckRes" id="idCheckRes">
				<div class='regi_button'>
					<button id='button_register' type="submit">회원가입</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function phoneNum() {
	var inputElement = document.getElementById("userPhone");
	var inputValue = inputElement.value;

	// 숫자를 제외한 모든 문자 제거
    var numericValue = inputValue.replace(/\D/g, '');
	// 하이픈(-) 추가 로직
	var formattedValue = inputValue.replace(/(\d{3})(\d{4})(\d{4})/,
			"$1-$2-$3");

	// 가공된 전화번호로 입력 필드의 값을 업데이트
	inputElement.value = formattedValue;
};
</script>

<%@include file = "../common/footer.jsp" %>
</html>