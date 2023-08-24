<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	정보 입력
	${GroupVO }
	<form action="group" method="post" >
	
	<br>
	   <select name="content_id">
		<c:forEach items="${contentList }" var="li" varStatus="status">
		   	<option  value="${li.content_id }">${li.content_name }</option>
	    </c:forEach>
	   </select>
	<br>
	<input type="text" name="user_id_leader" value="ID1"><br>
	
	그룹명 <input type="text" name="group_name"> <br>
	그룹인원 <input type="text" name="group_personnel"> <br>
	학습기간  <input type="date" name="learning_start"> ~ <input type="date" name="learning_end">
	
	<br>
	<button type="submit">학습그룹 등록</button>
	
	</form>
</body>

</html>