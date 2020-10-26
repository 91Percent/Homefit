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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* 	function page(v){
	   location.href="../shop/shop.do?cate_no="+v;   
	} */
$(function(){
	
		$('.filter-list').click(function(){
			var cate_no=$(this).attr("data-value");
			$.ajax({
				type:'post',
				url:'../shop/shop_list.do?cate_no='+cate_no,
	 			data:{"cate_no":cate_no},
				success:function(result)
				{
					$('#shop_list').html(result);
				} 
			})
		});
		
		$('.filter-list').click(function(){
			var cate_no=$(this).attr("data-value");
			$.ajax({
				type:'post',
				url:'../shop/shop_list.do?cate_no='+cate_no,
	 			data:{"cate_no":cate_no},
				success:function(result)
				{
					$('#shop_list').html(result);
				} 
			})
		});
		
		/* $.ajax({
			 type:'post',
			 url:'../shop/shop_radio.do',
			 success:function(result)
			 {
				 $('#shop_radio_info').html(result);
			 }
		 });
		 */
		$.ajax({
			 type:'post',
			 url:'../shop/shop_list.do',
			 success:function(result)
			 {
				 $('#shop_list').html(result);
			 }
		 });
		
		
		
});
	
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
                <form>
                  <ul>
                  	<c:forEach var="vo" items="${clist }" varStatus="status">	
						<li class="filter-list" data-value="${vo.cate_no }">
						<input class="pixel-radio" type="radio" name="cate_no" value="${vo.cate_no }" ><label for="cate1">${vo.cate_name }<span> (3600)</span></label>
						</li>
					</c:forEach>                                 
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
            <div id="shop_list"></div>            
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
			</ul>
		</nav>


   
</body>
</html>


