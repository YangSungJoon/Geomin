<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/content_request.css">
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
        <div class = "left-sideBar">
            <ul>
                <li class = "site-intro"><a href = "#" id = "intro-hover">학습콘텐츠 검색 및 구독신청</a></li>
                <li class = "guide"><a href = "../html/guide.html" id = "guide-hover">콘텐츠 구매</a></li>
            </ul>
        </div>
        <div class = "name-content">
            <p>학습콘텐츠 &nbsp;
                <select id="search_level">
                    <option value="level">전체</option>
                    <option value="level">창의인성</option>
                    <option value="level">콘텐츠2</option>
                    <option value="level">콘텐츠3</option>
                </select>&nbsp;&nbsp;&nbsp;
                그룹명 : $___ &nbsp;&nbsp;&nbsp;
                가입인원 : -명 / -명 &nbsp;&nbsp;&nbsp;
                <button type = "button" id = "">조회</button>
                <button type = "button" id = "">승인</button>
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>학습자명</td>
                    <td>가입신청일자</td>
                    <td>승인여부</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "name">2</td>
                    <td class = "date">3</td>
                    <td class = "yn">00000 원</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "name">2</td>
                    <td class = "date">3</td>
                    <td class = "yn">00000 원</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "name">2</td>
                    <td class = "date">3</td>
                    <td class = "yn">00000 원</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "name">2</td>
                    <td class = "date">3</td>
                    <td class = "yn">00000 원</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "name">2</td>
                    <td class = "date">3</td>
                    <td class = "yn">00000 원</td>
                </tr>
            </table>
        </div>
    </div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>