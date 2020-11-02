<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>코치리스트</h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          <div class="card text-center card-product">
        	<c:forEach var="vo" items="${list }">
            <div class="card-product__img">
              <img class="img-fluid" src="${vo.coach_poster }" alt="">
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">${vo.coach_name }</a></h4>
              <p class="card-product__price">${vo.coach_no }</p>
            </div>
            </c:forEach>
          </div>
         </div> 
           <section class="section-margin calc-60px"> 
           
           
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>함께 따라하는 <span class="section-intro__style">동작</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="https://${a }" alt="">
            </div>
            <div class="card-body">
              <h4 class="card-product__title">${c }</h4>
              <p class="card-product__price">${p}</p>
            </div>
          </div>
        
          </div>
        </div>
        </section>



         <div class="owl-nav">
         	 <button type="button" role="presentation" class="owl-prev"><i class="ti-arrow-left"></i></button>
         	 <button type="button" role="presentation" class="owl-next"><i class="ti-arrow-right"></i></button>
         </div>
		</div>
    </section>
</body>
</html>