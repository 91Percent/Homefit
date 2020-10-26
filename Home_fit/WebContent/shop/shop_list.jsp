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
//cate_no,shop_no,title,poster,subtitle,price,content,delivery_fee,hit,num
// $(function(){
	
// 	$.ajax({
// 		 type:'post',
// 		 url:'../shop/shop_list.do',
// 		 success:function(result)
// 		 {
// 			 $('#list').html(result);
// 		 }
// 	 });
// });

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

</body>
</html>