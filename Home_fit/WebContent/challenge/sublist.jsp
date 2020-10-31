<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list-btn{
	margin-right: 1px;
	float: right;
}
.card-footer {
    padding: 0.50rem 0.50rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125);
}

</style>
</head>
<body>
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">
						<img class="card-img-top"
						src="<c:url value='/challenge_poster/${vo.poster }'/>" width=300px,
						height=150px> <%-- <a href="../challenge_room/detail.do"><img class="card-img-top" src="/Home_fit2/challenge_poster/${vo.poster }" width=300px, height=150px> --%>
					</a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">${vo.title } (${vo.challenge_no })
							<br/>
								<c:if test="${today==vo.regdate}">
									<font color=red><sup>new</sup></font>
								</c:if> 
							</a>
						</h4>
						<h5 class="challenge_room_count"> ${vo.participantCount }명/${vo.limit }명 (${vo.participantionCheck })</h5>
						<p class="card-text">
							<fmt:formatDate value="${vo.start_day }" pattern="yyyy.MM.dd" />
							~
							<fmt:formatDate value="${vo.end_day }" pattern="yyyy.MM.dd" />
							(${vo.period }일)
						</p>
					</div>
					<div class="card-footer">
						<small class="text-muted">리더: ${vo.id_leader }</small> 
						
						<c:if test="${sessionScope.id ==null }">
							<button type="button" class="btn btn-outline-dark btn-sm list-btn" 
							onclick="location.href='../member/login.do?'">참가하기</button>
						</c:if>
						<c:if test="${sessionScope.id !=null }">
						
							<!--  참여중이라면? count(*) = 1 -->		
							<c:if test="${vo.participantionCheck!=0 }">				
								<button type="button" class="btn btn-outline-dark btn-sm list-btn" 
								onclick="location.href='../challenge/Certified.do?'">인증하기</button>
							</c:if>
							<c:if test="${vo.participantionCheck==0 }">
							<!--  참여중이 아니라면? count(*) = 0 -->	
								<button type="button" class="btn btn-outline-dark btn-sm list-btn" 
								onclick="location.href='../challenge/participation.do'">참가하기</button>
							</c:if>
						</c:if>
						<!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
					</div>
					<!-- <div style="padding:5px 0px"> -->
					<!-- </div> -->
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>