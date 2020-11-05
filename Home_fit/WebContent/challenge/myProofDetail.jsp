<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
<body>

<div  class="col-md-6" style="float:left;">
<h3 id="myproofdate"></h3>
<c:forEach var="vo" items="${myProofList }">
			<table>
				<tr>
					<td><img src="/Home_fit/challenge_poster/${Certifiedvo.poster}"></td>
				</tr>
			</table>
	
</c:forEach>
</div>
</body>
</html>