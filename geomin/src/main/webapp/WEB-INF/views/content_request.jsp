<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
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
            <p>학습난이도 &nbsp;
                <select id="search_level">
                    <option value="level">전체 ↓</option>
                    <option value="level">초급</option>
                    <option value="level">중급</option>
                    <option value="level">고급</option>
                </select>
                <button type = "button" id = "level_check">조회</button>
            </p><hr>
        </div>

        <div class = "request-content">
            <table>
                <tr class = "table_menu">
                    <td class = "check_box"></td>
                    <td>패키지명</td>
                    <td>학습가능인원</td>
                    <td>정가</td>
                    <td>구독료</td>
                    <td>학습수준</td>
                    <td>학습내용</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "packageName">2</td>
                    <td class = "people">3</td>
                    <td class = "price">00000 원</td>
                    <td class = "subPrice">123456 원</td>
                    <td class = "stulevel">6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "packageName">2</td>
                    <td class = "people">3</td>
                    <td class = "price">00000 원</td>
                    <td class = "subPrice">123456 원</td>
                    <td class = "stulevel">6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "packageName">2</td>
                    <td class = "people">3</td>
                    <td class = "price">00000 원</td>
                    <td class = "subPrice">123456 원</td>
                    <td class = "stulevel">6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "packageName">2</td>
                    <td class = "people">3</td>
                    <td class = "price">00000 원</td>
                    <td class = "subPrice">123456 원</td>
                    <td class = "stulevel">6</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td class = "check_box"><input type="checkbox" name="" id="checkbox"></td>
                    <td class = "packageName">2</td>
                    <td class = "people">3</td>
                    <td class = "price">00000 원</td>
                    <td class = "subPrice">123456 원</td>
                    <td class = "stulevel">6</td>
                    <td>7</td>
                </tr>
            </table>
            <div class = "send_button_box">
                <button type = "button" id = "send_button">구독신청</button>
            </div>
        </div>
    </div>

</body>
<%@include file = "../common/footer.jsp" %>
</html>