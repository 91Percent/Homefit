<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#calendar{
	border: 1px solid gray;
	border-collapse: collapse;
}

#calendar th{
	width: 80px;
	border: 1px solid gray;
	
}

#calendar td{
	width: 80px;
	height: 80px;
	border: 1px solid gray;
	text-align:left;
	vertical-align: top;
	positon: relative;
}
</style>
</head>
<body>
	<table id="calendar">
		<caption>
			<a href="./calendar.do?year=${year-1 }&month=${month}">&laquo;</a>
			<a href="./calendar.do?year=${year }&month=${month-1}">&lt;</a>
				<span class="y">${year }</span>년도
				<span class="m">${month}</span>월
			<a href="./calendar.do?year=${year }&month=${month+1}">&gt;</a>
			<a href="./calendar.do?year=${year+1 }&month=${month}">&raquo;</a>
			
			<tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>
				<c:if test="${dayOfWeek!=0}">
					<c:forEach var="i" begin="1" end="${dayOfWeek }">
						<td>&nbsp;</td>
					</c:forEach>
				</c:if>
				<c:forEach var="i" begin="1" end="${lastDay }" step="1" varStatus="status">
					<td>${status.count }</td>
					<c:if test="${(dayOfWeek+status.count)%7==0 }">
						</tr></tr>
					</c:if>
				</c:forEach>
					<c:forEach var="i" begin="1" end="${7-(dayOfWeek+lastDay)%7 }">
						<td>&nbsp;</td>
					</c:forEach>
		</caption>	
	</table>
</body>
</html>