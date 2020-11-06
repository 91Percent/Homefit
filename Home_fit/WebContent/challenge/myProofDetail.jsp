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
	<div class="row">
	<c:forEach var="vo" items="${myProofList }">
														<div class="col-md-4 col-lg-4 mb-4 mb-lg-0 seunggu">
															<div class="card card-blog">
																<div class="card-blog__img">
																	<img src="/Home_fit/challenge_poster/${vo.poster}" width=200 height=200>
																</div>
																<div class="card-body">
																	<ul class="card-blog__info">
																	</ul>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
</div>
</body>
</html>