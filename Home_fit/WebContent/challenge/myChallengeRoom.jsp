<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${id==null }">
		<table>
			<center>로그인 정보가 없습니다.</center>
		</table>
	</c:if>


	<c:if test="${id!=null }">

		<table class="table">
			<thead>
				<tr>
					<th scope="col" class="mychallengeno1">NO</th>
					<th scope="col" class="mychallengeno2">CATEGORY</th>
					<th scope="col">POSTER</th>
					<th scope="col">ROOM</th>
					<th scope="col">PERIOD</th>
					
				</tr>
			</thead>
			<c:forEach var="vo" items="${myRoomfList }" varStatus="status">
				<tbody>
					<tr>
						<!-- NO -->
						<td>${status.count }</td>
						<!-- CATEGORY -->
						<td>
							<div class="media">
								<div class="d-flex">
									${vo.cate }
								</div>
							</div>
						</td>
						<!-- POSTER -->
						<td>
							<h5><img src="/Home_fit/challenge_poster/${vo.poster}"></h5>
						</td>
						<!-- ROOM -->
						<td>
							<div class="product_count">
								<h5>
									${vo.title }
								</h5>
							</div>
						</td>
						<!-- PERIOD -->
						<td>
							<h5>총 ${vo.period}일</h5>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>

	</c:if>
</body>
</html>