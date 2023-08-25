window.onload = function (){

	
	document.getElementById('button_register').addEventListener('click', function(e) {
		  const idRegex = /^[a-zA-Z0-9]{6}$/; // 영문 대소문자와 숫자 6자
		  const pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,15}$/; // 영문 대소문자, 숫자, 특수문자 조합 8~15자
  
		  const userIdInput = document.getElementById('userId'); // 아이디 입력 요소 가져오기
		  const userPwInput = document.getElementById('userPw'); // 비밀번호 입력 요소 가져오기
		  
		  document.querySelectorAll('input[name="gender"]').forEach((radio) => {
		        radio.addEventListener('change', () => {
		            userGender = radio.value;
		        });
		    });
		  
	
		  // 이벤트 초기화
		  e.preventDefault();
		  
		  // 입력값 가져오기
		  const userId = document.getElementById('userId').value;
		  const userPw = document.getElementById('userPw').value;
		  const userPwCheck = document.getElementById('userPwCheck').value;
		  
		  // 유효성 검사 수행
		  
		  if (!idRegex.test(userId)) {
			  showAlert('아이디 형식을 확인하세요.');
			  return false;
		  }
		  
		  // 아이디 중복체크 확인
	      if (idCheckRes.value !== '1') {
	    	  registMsg.innerHTML = '아이디 중복체크를 해주세요';
	          return false;
	      }
		  
		  if (!pwRegex.test(userPw)) {
			  showAlert('비밀번호 형식을 확인하세요.');
			  return false;
		  }
		  
		  if (userPw !== userPwCheck) {
			  showAlert('비밀번호가 일치하지 않습니다.');
			  return false;
		  }
		  
		  register();
	  });
	
	function register() {

		let userId = document.getElementById('userId').value;
		let userPw = document.getElementById('userPw').value;
		let userPwCheck = document.getElementById('userPwCheck').value;
		let userName = document.getElementById('userName').value;
		let birthDate = document.getElementById('birthDate').value;
		let userEmail = document.getElementById('userEmail').value;
		let userType = document.getElementById('userType').value;
		let userPhone = document.getElementById('userPhone').value;

		let userGender = document.querySelector('input[name="gender"]:checked');
	    if (userGender) {
	        userGender = userGender.value;
	    } else {
	        showAlert('성별을 선택하세요.');
	        return false;
	    }
	    
	 // 입력값 검사
	      if (!userId || !userPw || !userName || !userName || !birthDate || !userEmail || !userType || !userPhone || !userGender) {
	    	  showAlert('모든 정보를 입력해주세요.');
	          return false;
	      }

	      // 아이디 중복체크 확인
	      if (idCheckRes.value !== '1') {
	    	  showAlert = '아이디 중복체크를 해주세요';
	          return false;
	      }
		
		// 비밀번호 확인 체크
		if (userPw !== userPwCheck) {
		    showAlert('비밀번호가 일치하지 않습니다.');
		    return;
		}

		
		let data = {
			user_id : userId,
			user_pw : userPw,
			user_name : userName,
			datebirth : birthDate,
			email : userEmail,
			user_type : userType,
			phonenumber : userPhone,
			gender : userGender
		}
		
		// 회원가입 요청
	      fetch('/login/regist', {
	          method: 'POST',
	          headers: {
	              'Content-Type': 'application/json'
	          },
	          body: JSON.stringify(data)
	      })
	      .then((response) => response.json())
	      .then((result) => {
	          if (result.result === 'success') {
	        	  // 회원가입이 성공한 경우 알림창 띄우기
	        	  showAlert('회원가입이 완료되었습니다.');
	              location.href = '/login/login';
	          } else {
	        	  showAlert(result.msg);
	          }
	      })
	      .catch((error) => {
	          console.error('Error : ', error);
	      });
	  };
	  
	  
		
	  
	//서버로부터 받은 메시지를 이용하여 알림창을 띄우는 함수
	  function showAlert(message) {
	    alert(message);
	  }	
		
		
	  // 중복확인 버튼 클릭 이벤트 리스너 등록
	  document.getElementById('idCheck').addEventListener('click', function() {
	    checkIdDuplicate();
	  });
	 
	  function checkIdDuplicate() {
		    // 입력한 아이디 값 가져오기
		    let userId = document.getElementById('userId').value;		   

		 // 아이디 유효성 검사
		    if (!isValidUserId(userId)) {
		        showAlert('아이디 형식을 확인하세요.');
		        return;
		    }
		    
		    // AJAX 요청을 보낼 데이터 준비
		    let data = { user_id : userId };

		    // AJAX 요청
		    fetch('/login/idCheck', {
		      method: 'POST',
		      headers: {
		        'Content-Type': 'application/json',
		      },
		      body: JSON.stringify(data),
		    })
		      .then((response) => response.json())
		      .then((result) => {
		        // 응답 데이터 처리
		        if (result.result) {
		          // 아이디 사용 가능한 경우
		        	document.getElementById('idCheckRes').value = '1';
		            registMsg.innerHTML = '사용 가능한 아이디입니다.';
		        } else {
		          // 아이디 사용 불가능한 경우
		        	document.getElementById('idCheckRes').value = '0';
		        	registMsg.innerHTML = '이미 사용 중인 아이디입니다.';
		        }
		      })
		      .catch((error) => {
		        console.error('Error:', error);
		      });
		  }
	  function isValidUserId(userId) {
		    const idRegex = /^[a-zA-Z0-9]{6}$/; // 영문 대소문자와 숫자 6자
		    return idRegex.test(userId);
		}

		

}