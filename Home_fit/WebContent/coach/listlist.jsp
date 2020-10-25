x`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="row">
	  <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <a href="../coach/info.do?coach_no=${vo.coach_no }" class="btn btn-lg">
						<img src="${vo.poster }" alt="Lights" style="width:70%">
					</a>
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <a href="../coach/info.do?coach_no=${vo.coach_no }" class="btn btn-lg">${vo.coach_name }</a>
                    <p class="card-product__price">${vo.subject}</p>
                  </div>
                </div>
              </div>
            </c:forEach>  
            </div>
            	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${curpage>BLOCK }">
				<li class="page-item">
					<a href="../coach/coachlist.do?cate_no=${cate_no }&page=${startPage-1 }" class="page-link" aria-label="Previous">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==curpage }">
					<li class="active">
						<a href="../coach/coachlist.do?cate_no=${cate_no }&page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
				<c:if test="${i!=curpage }">
					<li class="page-item">
						<a href="../coach/coach.do?cate_no=${cate_no }&page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="page-item">
					<a href="../coach/coach.do?cate_no=${cate_no }&page=${endPage+1 }" class="page-link" aria-label="Next">&gt;</a>
				</li>
			</c:if>
			</ul>
		</nav>
</body>
</html>