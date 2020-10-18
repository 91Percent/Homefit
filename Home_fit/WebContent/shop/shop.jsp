<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.ShopModel"/>
<%
    model.shopListData(request);
%>
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
					<h1>샵카테고리</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">G반</a></li>
              <li class="breadcrumb-item active" aria-current="page">김한비</li>
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
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="men" name="brand"><label for="men">식단<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="women" name="brand"><label for="women">건강간식<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="accessories" name="brand"><label for="accessories">식사대용<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="footwear" name="brand"><label for="footwear">단백질보충<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="bayItem" name="brand"><label for="bayItem">체지방관리<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="electronics" name="brand"><label for="electronics">헬스케어<span> (3600)</span></label></li>
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
            
            <!-- <div class="row">
				   	<c:forEach var="vo" items="${list }">
						<div class="col-md-3">
							<div class="thumbnail">		    
								<a href="../shop/shop_detail.do?title=${vo.title }" class="btn btn-lg">
						    		<img src="${vo.poster }" alt="Lights" style="width:25%">
						    	</a>		        
						    	<div class="caption">
						    		<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }" class="btn btn-lg">${vo.title }</a>
						    	</div>		        
						    </div>
						</div>
					</c:forEach>
				  </div> 
			-->
            
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <a href="../shop/shop_detail.do?shop_no=${vo.shop_no }" class="btn btn-lg">
						<img src="${vo.poster }" alt="Lights" style="width:70%">
					</a>
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <a href="../shop/shop_detail.do?shop_no=${vo.shop_no }" class="btn btn-lg">${vo.title }</a>
                    <p class="card-product__price">${vo.price }</p>
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
					<a href="../shop/shop.do?page=${startPage-1 }" class="page-link" aria-label="Previous">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==curpage }">
					<li class="active">
						<a href="../shop/shop.do?page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
				<c:if test="${i!=curpage }">
					<li class="page-item">
						<a href="../shop/shop.do?page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="page-item">
					<a href="../shop/shop.do?page=${endPage+1 }" class="page-link" aria-label="Next">&gt;</a>
				</li>
			</c:if>
		</nav>




<!--  
  <div class="row">
    <div class="text-center">
       <ul class="pagination">
          <c:if test="${curpage>BLOCK }">
           <li><a href="../movie/total.do?page=${startPage-1 }">&lt;</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i==curpage }">
              <li class="active"><a href="../movie/total.do?page=${i }">${i }</a></li>
            </c:if>
            <c:if test="${i!=curpage }">
              <li><a href="../movie/total.do?page=${i }">${i }</a></li>
            </c:if>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
		    <li><a href="../movie/total.do?page=${endPage+1 }">&gt;</a></li>
		  </c:if>
		</ul>
    </div>
  </div>
-->
  
<!-- 
  <div class="row">
    <div class="text-right">
      <a href="#" class="btn btn-lg btn-primary">예매하기</a>
      <a href="#" class="btn btn-lg btn-danger">찜하기</a>
      <a href="../shop/shop.do" class="btn btn-lg btn-warning">목록</a>
    </div>
  </div>
 -->
 
   
</body>
</html>


