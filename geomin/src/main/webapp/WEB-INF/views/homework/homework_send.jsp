<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/homework_send.css">
<link rel="stylesheet" href="../resources/css/modal.css">
<script src="../resources/js/homework_send.js"></script>
<script src="../resources/js/modal.js"></script>

</head>
<%@include file = "../common/header.jsp" %>
<body>
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
                        학습 서비스 /
                    </a>
                </li>
                <li>
                    <a href = "#">
                        숙제 제출
                    </a>
                </li>
            </ul>
        </div>
        <div class = "left-sideBar">
            <ul>
                <li class = "group_add"><a href = "#" id = "group_add">학습그룹 가입신청</a></li>
                <li class = "work_send"><a href = "#" id = "work_send">숙제 제출</a></li>
            </ul>
        </div>
        
        <div class = "name-content">
            <p>학습자 : ${user.user_name}
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>학습 콘텐츠</td>
                    <td>학습지도자</td>
                    <td>숙제 내용</td>
                    <td>제출기한</td>
                    <td>학습내용</td>
                </tr>
                
                <c:forEach items = "${list}" var="worklist">
                <tr>
                    <td class = "check_box"><input type="checkbox" name="checkbox" id="checkbox" onclick = 'checkOne(this)'></td>
                    <td class = "contentName"><c:out value=""/></td>
                    <td class = "readerName"><c:out value="${worklist.user_id_leader }"/></td>
                    <td class = "workContent"><c:out value="${worklist.homework_content_leader }"/></td>
                    <td class = "sendDate" style = "color: red; font-weight: bold;"><c:out value="${worklist.homework_deadline }"/></td>
                    <td class = "studyContent">
                    
                    	<button id = "open">작성 하기</button>
<form action="/homework/homework_create" method="post">
                    	<div id = "modal-box">
                    		<div id = "modal-contents">
                    			<button id = "close">&times;</button>
                    			<h2 id ="title">학습 내용 작성</h2>
                    			<div id = "profile">
                    				<div id = "desc">
                    				<div id = "content-box1">
                    					<p class = "user">학습자 : </p>
                    					<p class = "user">학습지도자 : </p>
                    					<p class = "user">숙제 내용 : </p>
                    					<p class = "user">제출기한 : </p>
                    				</div>
                    				<div id = "content-box2">
                    					<strong>학습내용</strong> <input type="text" name="" id="studytext">
                    				</div>
                    					<div class = "sendbtn-box">
								                <button type = "submit" id = "send_button">숙제 제출</button>
                    					</div>	
                    				</div>
                    				
                    			</div>
                    		</div>
                    	</div>
                    	
                    </td>
                    <!-- <td class = "studyContent"><c:out value="${worklist.homework_content_learner }"/></td> -->
                    </a>
                </tr>
                </c:forEach>
            </table>
            
        </div>
</form>
    </div>
    
    <script type = "text/javascript">
    window.addEventListener('load', function(){
        let open = document.getElementById('open');
        let close = document.getElementById('close');
        let modal = document.getElementById('modal-box');

        
        
        open.addEventListener('click', function(){
    		let startDate = document.querySelector('#subStartDate').value;
    		let endDate = document.querySelector('#subEndDate').value;
    		let modalprice = document.querySelector('.text-price').textContent;
    		
    		document.querySelector('#text-date').innerText = '대여 기간 : '+startDate+' ~ '+endDate;
    		
    		document.querySelector('.text-price').textContent = '가격 : '+modalprice;
    		document.querySelector('#totalmodalprice').innerText = '최종가격 : '+modalprice*parseInt(diff/currDay);
    		
            modal.classList.add('active');
        });

        close.addEventListener('click', function(){
            modal.classList.remove('active');
        });
    })
    
    document.getElementById("product-sellReserve").onclick = function(){
    	alert("대여 예약 되었습니다.");
    };
    
    
    </script>

</body>
<%@include file = "../common/footer.jsp" %>
</html>