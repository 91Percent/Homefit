<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.page-item').click(function(){
		console.log(cate);
		var page_cate=cate;
		var page=$(this).attr("page");
		
		$.ajax({			
			type:'post',
			url:'../shop/shop_list.do?page='+page+'&cate_no='+page_cate,
			success:function(result){
				$('#shop_list').html(result);
			}
		})
	})
	
	
});

</script>
</head>
<body> 
	<div class=row>
		<c:forEach var="vo" items="${list }">
	              <div class="col-md-6 col-lg-4">
	                <div class="card text-center card-product">
	                	<div class="shoplist">
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
		                    ${vo.cate_no }
		                    <p class="card-product__price">${vo.price }</p>
		                  </div>
	                  	</div>
	                </div>
	              </div>
	    </c:forEach> 
	</div>
	
	
	
	
	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${curpage>BLOCK }">
				<li class="page-item" page="${starPage-1} }">
					<a class="page-link" aria-label="Previous">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==curpage }">
					<li class="page-item active" page="${i }">
						<a class="page-link">${i }</a>
					</li>
				</c:if>
				<c:if test="${i!=curpage }">
					<li class="page-item" page="${i }">
						<a class="page-link">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="page-item" page="${endPage+1 }">
					<a class="page-link" aria-label="Next">&gt;</a>
				</li>
			</c:if>
			</ul>
		</nav>
	

</body>
</html>