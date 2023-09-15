<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 학습콘텐츠</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/subcontentList.css">
    <div style="display: none;">aaaa : ${successMessage }</div>   
     <script>
        window.onload = function() {
            const difficultyCells = document.querySelectorAll('.level');

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
		<div class = "location">
            <ul class = "clearFix">
                <li class = "home">
                    <a href = "#">
                        <img src="../resources/image/homeicon.png" alt=""> /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        구독 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        나의 학습콘텐츠
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>

		<div class = "name-content">
            <p>나의 학습 콘텐츠 &nbsp;</p>
            <hr>
        </div>
 
        <div class = "main-content-box">
            <table class = "table-fill">
                <tr class = "table_menu">
                    <th class = "check_box"></th>
                    <th class = "top_content">패키지명</th>
                    <th class = "top_people">학습가능인원</th>
                    <th class = "top_subPrice">구독료</th>
                    <th class = "top_level">수준</th>
                    <th class = "top_workContent">학습내용</th>
                    <th class="top_price">구독신청일</th>
                    <th class = "top_yn">결제상태</th>
                </tr>
                <c:forEach items="${subContentList }" var="li" varStatus="status">
	                <tr>
	                    <td class = "check_box"><input type="checkbox" name="content_id" id="checkbox" onclick='checkOnlyOne(this)' value="${li.content_id}"></td>
	                    <td class = "packageName buttonB btnPush btnColor" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
	                    <td class = "people">${li.learning_member } 명</td>
	                    <td class = "subPrice">${li.real_price }원</td>
	                    <td class="level">${li.learning_difficulty}</td>
	                    <td class="workContent" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">${li.learning_content }</td>
	                    <td class="price" >${li.subscription_date }</td>
	                    <td class = "yn"><input type="checkbox" name="paystatus" id="checkbox2" style="display: none;" value="${li.paystatus}">${li.paystatus }</td>
	                </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" id = "send_button" class = "buttonA btnPush btnColor">결제 취소</button>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
</form>

<script>



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