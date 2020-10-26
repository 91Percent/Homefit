<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="vo" items="${list }">
	          <div class="col-lg-4 col-md-6 mb-4">
			  	<div class="card h-100">
			  																			<!-- 승구야 여기 poster경로 바꿔~! -->
					<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }"><img class="card-img-top" src="/Home_fit/challenge_poster/${vo.poster }" width=300px, height=150px>
					<%-- <a href="../challenge_room/detail.do"><img class="card-img-top" src="/Home_fit2/challenge_poster/${vo.poster }" width=300px, height=150px> --%>
					</a>
					  <div class="card-body">
					     <h4 class="card-title">
					      	<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">${vo.title }</a>
					     </h4>
					     <h5 class="challenge_room_count">${vo.challenge_no }명/${vo.limit }명</h5>
					     <p class="card-text"><fmt:formatDate value="${vo.start_day }" pattern="yyyy.MM.dd"/>  ~ <fmt:formatDate value="${vo.end_day }" pattern="yyyy.MM.dd"/></p>
					  </div>
					  <div class="card-footer">
					  	<small class="text-muted">리더: ${vo.id_leader }</small>
					  	<a href="..challenge_room/group_in/.jsp" class="btn btn-sm btn-danger">참여하기</a>
					    <!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
					  </div>
					  <!-- <div style="padding:5px 0px"> -->
	        		  <!-- </div> -->      		
			  	</div>
			  </div>
	</c:forEach>
</body>
</html>