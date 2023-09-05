<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 -->  
<style type="text/css">
.pagination.justify-content-center {
    margin: 0; /* 기존 마진을 제거하고 */
    width: 100%; /* 전체 너비를 100%로 설정합니다 */
    display: flex;
    justify-content: center;
    align-items: center;
}

/* 페이지 네비게이션 스타일링 */
.pagination {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.pagination .page-link {
    border: 1px solid #ddd;
    color: #333;
    padding: 8px 12px;
    text-decoration: none;
    transition: background-color 0.3s, border-color 0.3s, color 0.3s;
}

.pagination .page-link:hover {
    background-color: #ddd;
    border-color: #ddd;
    color: #333;
}

.pagination .page-link.active {
    background-color: #999;
    border-color: #999;
    color: #fff;
}

.pagination .page-item.disabled .page-link {
    pointer-events: none;
    background-color: #eee;
    border-color: #eee;
    color: #999;
}
/* <li> 요소의 마진을 0으로 설정 */
.pagination .page-item {
    margin: 0;
}
</style>

  
<script type="text/javascript">
 	function go(page){
  	  console.log("go테스트");
 		
 		let contentListGO = document.contentListGO;
 		let subContentListGO = document.subContentListGO;

 		let groupApprovalGO = document.groupApprovalGO;
 		let myGroupGO = document.myGroupGO;
 		
 		let homework_evaluationGO = document.homework_evaluationGO;
 		let homework_addGO = document.homework_addGO;
 		
 		if(contentListGO){
		document.contentListGO.pageNo.value = page;
		document.contentListGO.submit();
 			
	 		} else if(subContentListGO){
	 			document.subContentListGO.pageNo.value = page;
	 			document.subContentListGO.submit();
	 			
		 		} else if(groupApprovalGO){
			 		
		 			document.groupApprovalGO.pageNo.value = page;
		 			document.groupApprovalGO.submit(); 			
			 			
			 		} else if(myGroupGO){
			 			document.myGroupGO.pageNo.value = page;
			 			document.myGroupGO.submit(); 			
			 			
				 		} else if(homework_evaluationGO){
				 			document.homework_evaluationGO.pageNo.value = page;
				 			document.homework_evaluationGO.submit(); 			
				 			
					 		} else if(homework_addGO){
					 			document.homework_addGO.pageNo.value = page;
					 			document.homework_addGO.submit(); 			
					 			
					 		} 
		 		
		
	}

    
</script>
</head>
<body>
	
	<div class="container d-flex justify-content-center">
	
	<!-- 페이지 블럭 생성 -->
	<nav aria-label="Page navigation example ">
	
	
	  <ul class="pagination justify-content-center">
	    <li class="page-item ${pageDto.prev?'':'disabled' }">
	      <a class="page-link"
	      		<c:if test="${pageDto.prev}">
	      		onclick="go(${pageDto.startNo-1 })"
	      		</c:if>
	      		href="#">이전</a>
	    </li>
	    
	    <c:forEach begin="${pageDto.startNo }" 
	    			end="${pageDto.endNo }" 
	    			var="i">
	    
		    <li class="page-item">
		    	<a class="page-link  ${pageDto.cri.pageNo==i ? 'active':'' }" 
		    		onclick="go(${i})"
		    		href="#">${i }</a>
		    </li>
	    
	    </c:forEach>
	    
	    <li class="page-item ${pageDto.next?'':'disabled' }">
	      <a class="page-link"
	      		onclick="go(${pageDto.endNo + 1 })" 
	      		href="#">다음</a>
	    </li>
	  </ul>
	</nav>
</div>




</body>
</html>
