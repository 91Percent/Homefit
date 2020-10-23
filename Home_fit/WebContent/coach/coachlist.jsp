<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.CoachModel"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>코치정보</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">G반</a></li>
              <li class="breadcrumb-item active" aria-current="page">안치훈</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">전체 카테고리</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="PT" name="brand" submit="cate_no=71"><label for="PT">P.T<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="YOGA" name="brand" submit="cate_no=72"><label for="YOGA">YOGA<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="Pilates" name="brand"><label for="Pilates">Pilates<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="G.X" name="brand"><label for="G.X">G.X<span> (3600)</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>

        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
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
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  


    
    <!-- 페이지 바 -->
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
		</nav>


   
</body>
</html>


