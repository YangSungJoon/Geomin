<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>콘텐츠 리스트</title>
    <link rel="stylesheet" href="../resources/css/content_request.css">
    

       
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



	<form action="/content/contentList" 
			method="get" name="contentListGO" autocomplete="off" >

	<input type="hidden" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	<input type="hidden" name="total" value="${pageDto.total }">
	<input type="hidden" name="user_id" value="${userId}">
			
	<button type="submit" class="btnSearch" style="display: none;" onclick="go(1)"></button>
	</form>


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
                        학습콘텐츠 검색 및 구독신청
                    </a>
                </li>
            </ul>
        </div>
 <form action="contentList" method="post">
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "/content/contentList" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "/content/subContentList?user_id=${userId}" id = "guide-hover">나의 학습콘텐츠</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습난이도 &nbsp;
                <select id="search_level">
                    <option value="" >전체 ↓</option>
				    <option value="1" <c:if test="${param.learning_difficulty == '1'}">selected="selected"</c:if>>초급</option>
				    <option value="2" <c:if test="${param.learning_difficulty == '2'}">selected="selected"</c:if>>중급</option>
				    <option value="3" <c:if test="${param.learning_difficulty == '3'}">selected="selected"</c:if>>고급</option>
					
                </select>
                <button type = "submit" class ="buttonB btnPush btnColor" id = "level_check">조회</button>

                 <input type="hidden" name="learning_difficulty" value="${learning_difficulty }">
            </p><hr>
        </div>
</form>


<form action="subContentListAction" method="post" name="myForm">

<input type="hidden" name="user_id" value="${userId}">
        <div class = "main-content-box">
	            <table class = "table-fill">
	                <tr class = "table_menu">
	                    <th class = "check_box"></th>
	                    <th class = "top_content">패키지명</th>
	                    <th class = "top_people">학습가능인원</th>
	                    <th class="top_price">정가</th>
	                    <th class = "top_sale">할인율</th>
	                    <th class = "top_subPrice">구독료</th>
	                    <th class = "top_level">수준</th>
	                    <th class = "top_workContent">학습내용</th>
	                    <th class = "top_yn">삭제유무</th>
	                </tr>
                <c:forEach items="${contentList }" var="li" varStatus="status">
				    <tr>
				        <td class="check_box"><input type="checkbox" name="content_id" id="checkbox1"  onclick='checkOnlyOne(this)' value="${li.content_id}"></td>
				         <td class="contentName button btnColor btnPush"><a href ="/management/contentListView?content_id=${li.content_id}">${li.content_name}</a></td>
				        <td class="people" >${li.learning_member} 명</td>
				        <td class="price" >${li.price}원</td>
				        <td class = "sale">${li.sale }</td>
				        <td class="subPrice" >${li.real_price}원</td>
				        <td class="level" >${li.learning_difficulty}</td>
				        <td class="workContent">${li.learning_content}</td>
				        <td class = "yn"><input type="checkbox" name="is_deleted" id="checkbox2"  value="${li.is_deleted}"> ${li.is_deleted}</td>
				    </tr>
                </c:forEach>
               
            </table>
            <div class = "send_button_box">
                <button type = "submit" class = "buttonA btnPush btnColor" id = "send_button" >구독신청</button>
            </div>
        </div>
</form>
<jsp:include page="/WEB-INF/views/common/pageNavi.jsp" />
    </div>
<script>



//삭제유무가 Y면 불가 처리
document.addEventListener("DOMContentLoaded", function() {
    var checkbox1Elements = document.querySelectorAll('input[name="content_id"]');
    var checkbox2Elements = document.querySelectorAll('input[name="is_deleted"]');

    for (var i = 0; i < checkbox1Elements.length; i++) {
        checkbox1Elements[i].addEventListener("change", function() {
            var index = Array.from(checkbox1Elements).indexOf(this);
            checkbox2Elements[index].checked = this.checked;
        });
    }
});

document.addEventListener("DOMContentLoaded", function() {
    var checkbox1Elements = document.querySelectorAll('input[name="content_id"]');
    var checkbox2Elements = document.querySelectorAll('input[name="is_deleted"]');
    
    var sendButton = document.getElementById("send_button");
    
    sendButton.addEventListener("click", function() {
        var checkedCheckbox = null;
        var message = "공백";
        var hasDeletedPackage = false; // 'Y'가 하나라도 있으면 true로 설정
        
        for (var i = 0; i < checkbox1Elements.length; i++) {
            if (checkbox1Elements[i].checked) {
                checkedCheckbox = checkbox1Elements[i];
                var isDeletedCheckbox = checkbox2Elements[i]; // 현재 체크된 체크박스의 is_deleted
                
                if (isDeletedCheckbox.value === 'Y') {
                    hasDeletedPackage = true;
                    break; // 'Y'를 찾았으므로 반복문 종료
                }
            }
        }
        
        if (hasDeletedPackage) {
            message = "삭제된 패키지가 있습니다. 다시 신청해주세요.";
        } else if (checkedCheckbox) {
            message = "구독신청이 완료 되었습니다.";
        } else {
            message = "선택된 패키지가 없습니다. 다시 확인해주세요.";
        }
        
        alert(message);
    });
});
</script>

</body>
 <%@include file = "../common/footer.jsp" %> 
</html>