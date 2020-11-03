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
	
let cate;
$(function(){
	
		$('.pixel-radio').click(function(){
			
			let cate_no=$(this).attr("value");
			cate=cate_no;
			
// 			alert(cate);
			
			$.ajax({
				type:'post',
				url:'../shop/shop_list.do?cate_no='+cate,
	 			data:{"cate_no":cate_no},
				success:function(result)
				{
					$('#shop_list').html(result);
				} 
			})
		})
		
		$('.pixel-radio').eq(${cate_no-1}).trigger("click")
		
		

		
		
})
	
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
						<input class="pixel-radio" type="radio" name="cate_no" value="${vo.cate_no }" id="${vo.cate_no }"><label for="${vo.cate_no }">${vo.cate_name }<span></span></label>
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


	

   
</body>
</html>


