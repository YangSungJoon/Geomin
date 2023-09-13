<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
 <link rel='stylesheet' href='../resources/css/findPw.css'>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class='regi_area'>
		<div class="intro-box">
			<div class="location">
				<ul class="clearFix">
					<li class="home"><a href="#"> 
						<img src="../resources/image/homeicon.png" alt=""> 
					</a></li>
					<li><a href="#"> / 비밀번호 찾기  </a></li>
				</ul>
			</div>
			<div class="left-sideBar">
				<ul>
                <li class = "site-intro"><a href = "/login/findId" id = "intro-hover">비밀번호 찾기</a></li>
            </ul>
			</div>        
        <div id="wrap_container">
        <form id="findPwTest">
                <div class="findPw_title">
                    <h2><span class="glyphicon glyphicon-lock"></span> 비밀번호 찾기</h2>
                </div>
                <div class="findPw_subject" >
                    	<h4 style="font-size : 20px">※ 입력된 정보로 임시 비밀번호가 전송됩니다.</h4>
                </div>
                  
                    	<div class="form-group">
                            <label for="userId"><span class="glyphicon glyphicon-id" style="font-size : 20px"></span></label>
                            <input type="text" class="userId" id="userId" 
                            placeholder="아이디를 입력하세요.">
                        </div>
                        <div class="form-group">
                            <label for="userEmail"><span class="glyphicon glyphicon-user" style="font-size : 20px"></span></label>
                            <input type="text" class="userEmail" id="userEmail" 
                            placeholder="가입시 등록한 이메일을 입력하세요." >
                        </div>
                        <div class="form-group">
                            <label for="userName"><span class="glyphicon glyphicon-eye-open" style="font-size : 20px"></span></label>
                            <input type="text" class="userName" id="userName" 
                            placeholder="이름을 입력하세요.">
                        </div>
                        <div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
                        
                        <br>
                <div class="findPw_submit">
                    <button type="button" class="buttonA btnPush btnColor" id="checkEmail">보내기 </button>&nbsp;
                    <button type="button" class="buttonA btnPush btnColor" id="returnlogin"
                    onclick = "location.href='/login/login'">취소</button>
                   </div>
				</form>
        </div>
       </div>
</div> 
      
<script>
$(document).ready(function () {

    $("#checkEmail").click(function () {
        let userId = $("#userId").val();
        let userEmail = $("#userEmail").val();
        let userName = $("#userName").val();
        let obj = {
            "user_id": userId,
            "email": userEmail,
            "user_name": userName
        };
        $.ajax({
            contentType: 'application/json',
            type: "POST",
            url: "/findPwAction",
            data: JSON.stringify(obj),
            success: function (res) {
                console.log("res : ", res);
                if (res.check) {
                    alert("임시 비밀번호가 발송되었습니다.");
                    // 로그인 페이지로 이동
                    location.href = "/login/login";
                } else {
                    $("#checkMsg").text("입력한 정보가 일치하지 않습니다.");
                }
            }
        });
    });
});
</script>

<%@ include file="../common/footer.jsp" %>
 
</body>
</html>
