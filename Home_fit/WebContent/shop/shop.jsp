<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.ShopModel"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function page(v){
	location.href="../shop/shop.do?cate_no="+v;	
}
</script>
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
                <form action="../shop/shop.do" name="frm" method="post">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate1" name="cate_no" value="1" onclick="javascript:page('1')"><label for="cate1">식단<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate2" name="cate_no" value="2" onclick="javascript:page('2')"><label for="cate2">건강간식<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate3" name="cate_no" value="3" onclick="javascript:page('3')"><label for="cate3">식사대용<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate4" name="cate_no" value="4" onclick="javascript:page('4')"><label for="cate4">단백질보충<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate5" name="cate_no" value="5" onclick="javascript:page('5')"><label for="cate5">체지방관리<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="cate6" name="cate_no" value="6" onclick="javascript:page('6')"><label for="cate6">헬스케어<span> (3600)</span></label></li>
                  	<button onclick="value_check()">체크된 객체 value 가져오기</button>
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
					<a href="../shop/shop.do?cate_no=${cate_no }&page=${startPage-1 }" class="page-link" aria-label="Previous">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==curpage }">
					<li class="active">
						<a href="../shop/shop.do?cate_no=${cate_no }&page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
				<c:if test="${i!=curpage }">
					<li class="page-item">
						<a href="../shop/shop.do?cate_no=${cate_no }&page=${i} " class="page-link">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="page-item">
					<a href="../shop/shop.do?cate_no=${cate_no }&page=${endPage+1 }" class="page-link" aria-label="Next">&gt;</a>
				</li>
			</c:if>
		</nav>


   
</body>
</html>


