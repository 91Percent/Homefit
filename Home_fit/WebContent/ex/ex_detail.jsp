<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>${vo.subject }</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">HomeTraining</a></li>
              <li class="breadcrumb-item active" aria-current="page">1조와 함께하는 홈트레이닝 </li>
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
							<img class="img-fluid" src="${vo.poster }" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h2>${vo.subject}</h2>
						<h4>${vo.home_level}</h4> 
						<h5>사용 근육 : ${vo.muscle }</h5>
						<h5>초점 : ${vo.focus }</h5>
						<h5>필요한 도구 : ${vo.equipment }</h5>
						<p>팁 : ${vo.tip }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->
<section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>함께 따라해보는 <span class="section-intro__style">자세</span></h2>
          <c:forTokens var="step" items="${vo.step_no }" delims="|">
          ${step}
		</c:forTokens>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="img/blog/blog1.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                </ul>
                <h4 class="card-blog__title">The Richland Center Shooping News and weekly shooper</h4>
                <p>Let one fifth i bring fly to divided face for bearing divide unto seed. Winged divided light Forth.</p>
              </div>
            </div>
          </div>
          </div>
         </div>
    </section>
</body>
</html>