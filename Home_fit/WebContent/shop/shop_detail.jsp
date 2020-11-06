<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// $(function(){
	
// 	$('.button primary-btn').click(function(){
// 		let shop_no=$(this).attr("data-value");
// 		let poster=$(this).attr("data-poster");
// 		let title=$(this).attr("data-title");
// 		let price=$(this).attr("data-price");
// 		$('#shop_no').val(shop_no);
// 		$.ajax({
// 			type:'post',
// 			url:'../shop/wishlist_list.do',
// 			data:{"shop_no":shop_no},
// 			data:{"poster":poster},
// 			data:{"title":title},
// 			data:{"price":price}
// 		})
// 	})
	
	
// });

</script>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>샵 디테일</h1>
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
  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="${vo.poster }" style="width:80%">
						</div>
						
							<c:forTokens var="p" items="${vo.content }" delims="|"  varStatus="status" > 
							<div class="single-prd-item">
	        				<img src="${p }" width="1000" height="500">
	        				</div>
							</c:forTokens>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${vo.title }</h3>
						<h2>${vo.price }</h2>
						<ul class="list">
							<li><a class="active" href="#"></a></li>
							<li><a href="#">배송비: ${vo.delivery_fee }</a></li>
						</ul>
						<p>${vo.subtitle }</p>
						<div class="product_count">
						<a class="button primary-btn" href="../shop/shop_detail_ok.do?shop_no=${vo.shop_no }" 
						data-value="${vo.shop_no }" data-poster="${vo.poster }" data-title="${vo.title}" data-price="${vo.price }">Add to Cart</a>
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="ti-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">제품 상세보기</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div id="home">			
        			<c:forTokens var="p" items="${vo.content }" delims="|"  varStatus="status" > 
        				<img src="${p }" style="width: 100%;">
					</c:forTokens>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->


</body>
</html>