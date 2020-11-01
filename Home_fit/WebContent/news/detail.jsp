<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.img-fluid {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
</style>
</head>
<body>

	<section class="blog_area single-post-area py-80px section-margin--small">
			<div class="container">
					<div class="row">
					<div class="col-lg-12">
						<div class="feature-img">
						<img class="img-fluid" src="${vo.poster }" alt="" width=800 height=100>
							</div>
								</div>
									<div class="col-lg-12">
							     		<h2>${vo.title }</h2>
									<p class="excert">
									${vo.content }
								</p>
								<p>${vo.author }<p><p>기사 작성일 :${vo.news_date }<p>
							</div>
					</div>
			</div>
	</section>
	
</body>
</html>