<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/study_content_add.css">
</head>
<%@include file = "./common/header.jsp" %>
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
                        숙제 제출
                    </a>
                </li>
            </ul>
        </div>

        <div class = "left-sideBar">
            <ul>
                <li class = "work_send"><a href = "#" id = "group_add">학습콘텐츠 등록</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">게시판</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">- 공지사항</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">- Q&A</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">매출 관리</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">- 매출 집계</a></li>
                <li class = "group_add"><a href = "#" id = "work_send">- 매출 조회</a></li>
            </ul>
        </div>

        <div>
            패키지명<input type="text" name="packageName" id="packageName" placeholder='공백없이 영 정가 문/숫자 6자'><br><br>
            학습난이도
            <select id="search_level">
                <option value="level">전체 ↓</option>
                <option value="level">초급</option>
                <option value="level">중급</option>
                <option value="level">고급</option>
            </select><br><br>
        </div>

        <div>
            학습가능인원<input type="number" name="" id=""><br><br>
        </div>

        <div>
            정가<input type="text" name="" id=""><br><br>
        </div>
        
        <div>
            할인율<input type="text" name="" id=""><br><br>
        </div>

        <div>
            판매가<input type="text" name="" id=""><br><br>
        </div>

        <div>
            패키지 내용<input type="text" name="" id="">
        </div>

        <button type = "button">등록</button>
        <button type = "button">조회</button>
    </div>
</body>
<%@include file = "./common/footer.jsp" %>
</html>