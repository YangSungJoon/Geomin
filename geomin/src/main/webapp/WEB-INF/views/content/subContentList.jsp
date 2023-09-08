<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/content_request.css">
    aaaa : ${successMessage }   
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
            
            document.getElementById('search_level').addEventListener('change', function() {
            	
            	var selectedSearch_level = this.value;
            	
            	document.querySelector('input[name="learning_difficulty"]').value = selectedSearch_level;
            	
            });
            
            
            
            
        };
    </script> 
    
</head>
 <%@include file = "../common/header.jsp" %> 
<body>

구독 콘텐츠 목록 <br>
<c:if test="${not empty successMessage}">
    <script>alert('${successMessage}');</script>
</c:if>

<%-- 
pageDto : ${pageDto }<br>
subTotalCnt :  ${subTotalCnt }<br> --%>

	<form action="/content/subContentList" 
		method="get" name="subContentListGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>

<form action="payStatus" method="post">

<input type="hidden" name="user_id" value="${userId}">

<div class = "intro-box">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>패키지명</td>
                    <td>학습가능인원</td>
                    <td>구독료</td>
                    <td>학습수준</td>
                    <td>학습내용</td>
                    <td>구독신청일</td>
                    <td>결제상태</td>
                </tr>
                <c:forEach items="${subContentList }" var="li" varStatus="status">
	                <tr>
	                    <td class = "check_box"><input type="checkbox" name="content_id" id="checkbox" onclick='checkOnlyOne(this)' value="${li.content_id}"></td>
	                    <td class = "packageName" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
	                    <td class = "people">${li.learning_member } 명</td>
	                    <td class = "subPrice">${li.real_price }원</td>
	                    <td class="subPrice-difficulty">${li.learning_difficulty}</td>
	                    <td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.learning_content }</td>
	                    <td>${li.subscription_date }</td>
	                    <td><input type="checkbox" name="paystatus" id="checkbox2" style="display: none;" value="${li.paystatus}">${li.paystatus }</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button" >결제 취소</button>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>

<script>

//check 중복 체크 방지
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("content_id");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  
	  const checkboxes2 
      = document.getElementsByName("paystatus");
  
	  	  checkboxes2.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  
	  element.checked = true;
	  
	  
	}

//삭제유무가 Y면 불가 처리
document.addEventListener("DOMContentLoaded", function() {
    var checkbox1Elements = document.querySelectorAll('input[name="content_id"]');
    var checkbox2Elements = document.querySelectorAll('input[name="paystatus"]');

    for (var i = 0; i < checkbox1Elements.length; i++) {
        checkbox1Elements[i].addEventListener("change", function() {
            var index = Array.from(checkbox1Elements).indexOf(this);
            checkbox2Elements[index].checked = this.checked;
        });
    }
});

document.addEventListener("DOMContentLoaded", function() {
    var checkbox1Elements = document.querySelectorAll('input[name="content_id"]');
    var checkbox2Elements = document.querySelectorAll('input[name="paystatus"]');
    
    var sendButton = document.getElementById("send_button");
    
    sendButton.addEventListener("click", function() {
        var checkedCheckbox = null;
        var message = "공백";
        
        for (var i = 0; i < checkbox1Elements.length; i++) {
            if (checkbox1Elements[i].checked) {
                checkedCheckbox = checkbox1Elements[i];
                break;
            }
        }
        
        if (checkedCheckbox) {
            var index = Array.from(checkbox1Elements).indexOf(checkedCheckbox);
            var isDeletedCheckbox = checkbox2Elements[index];
            
            if (isDeletedCheckbox.value === 'Y') {
                message = "결제가 취소 되었습니다.";
            } else if (isDeletedCheckbox.value === 'C') {
                message = "이미 결제취소된 컨텐츠입니다.";
            } 
        } else {
            message = "체크된 콘텐츠가 없습니다. 다시 확인해주세요.";
        }
        
        alert(message);
    });
});
</script>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>