<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈핏</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<style type="text/css">
.main_title {
	font-size: 30px;
	text-align: center;
	margin-bottom: 22px;
	font-weight: 300;
}
.main_subtit {
	margin-top: 10px;
	font-size: 18px;
}
.main_bg {
	background-image: url(../img/bg1.jpg);
	background-repeat: no-repeat;
	width: 100%;
	height: 650px;
	background-position: center;
	background-size: cover;
}
.main_content {
	float: left;
    margin-top: 266px;
    margin-left: 157px;
}
.main_box {
	margin-left: 40px;
}
.banner_tit {
	font-size: 28px;
    margin-left: 2px;
}
.card-product__title {
	font-weight: 200;
    font-size: 18px;
}
#shop_tit {
	margin-bottom: 0px;
}
.blog {
	margin-top: 91px;
	margin-bottom: 70px;
}
</style>
</head>
<body>
	<!--  메인 이미지   -->
	 <div class="main_bg">
		<div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0 main_content">
			<div class="hero-banner__content main_box">
				<a class="button button-hero" href="../challenge/list.do">Browse Now</a>
			</div>
		</div>
	</div>

	<c:if test="${sessionScope.id !=null }">
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<h2 class="main_title">${sessionScope.name }님이 최근 본 상품</h2>
				</div>

				<div class="owl-carousel owl-theme" id="bestSellerCarousel">
					<c:forEach var="vo" items="${cList }" varStatus="s">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }"> <img
									class="img-fluid" src="${vo.poster }" alt="">
								</a>
							</div>
							<div class="card-body">
								<h4 class="card-product__title">${vo.title }</a>
								</h4>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>

	<!-- 나의 운동 레벨별 출력  -->
	<section class="section-margin calc-60px">
		<div class="container">
			<div class="section-intro pb-60px">
				<c:if test="${sessionScope.id !=null }">
					<h2 class="main_title">내가 관심있는 운동 추천</h2>
				</c:if>
				<c:if test="${sessionScope.id ==null }">
					<h4 align="left">
						홈트샵-<span class="section-intro__style">[${shoptext}] 카테고리</span>
					</h4>
				</c:if>
			</div>
			<div class="row">
				<c:if test="${sessionScope.id !=null }">
					<c:forEach items="${list2 }" var="vo" begin="0" end="3">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<a href="../ex/ex_detail.do?home_no=${vo.evo.home_no }"> <img
										class="card-img" src="${vo.evo.poster }" alt="">
									</a>

								</div>
								<div class="card-body">
									<h4 class="card-product__title main_subtit">
										<a href="../ex/ex_detail.do?home_no=${vo.evo.home_no }">${vo.evo.subject }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${sessionScope.id==null }">
					<c:forEach items="${list2}" var="vo" begin="0" end="3">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }"> <img
										class="card-img" src="${vo.poster }" alt="">
									</a>

								</div>
								<div class="card-body">
									<h4 class="card-product__title main_subtit">
										<a href="../shop/shop_detail.do?shop_no=${vo.shop_no }">${vo.title}</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>

	<!-- 나의 운동 카테고리 출력  -->
	<section class="section-margin calc-60px">
		<div class="container">
			<div class="section-intro pb-60px">
				<c:if test="${sessionScope.id !=null }">
					<h2 class="main_title">나의 레벨에 맞는 운동 추천</h2>
				</c:if>
				<c:if test="${sessionScope.id ==null }">
					<h4 align="left">
						홈트-<span class="section-intro__style">[${extext}] 카테고리</span>
					</h4>
				</c:if>
			</div>
			<div class="row">
				<c:if test="${sessionScope.id !=null }">
					<c:forEach items="${list1 }" var="vo" begin="0" end="3">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<a href="../ex/ex_detail.do?home_no=${vo.evo.home_no }"> <img
										class="card-img" src="${vo.evo.poster }" alt="">
									</a>

								</div>
								<div class="card-body">
									<h4 class="card-product__title main_subtit">
										<a href="single-product.html">${vo.evo.subject }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${sessionScope.id ==null }">
					<c:forEach items="${list1}" var="vo" begin="0" end="3">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<a href="../ex_detail.do?home_no=${vo.home_no }"> <img
										class="card-img" src="${vo.poster }" alt="">
									</a>

								</div>
								<div class="card-body">
									<h4 class="card-product__title main_subtit">
										<a href="single-product.html">${vo.subject }</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>

			</div>
		</div>
	</section>

	<c:if test="${sessionScope.id ==null }">
		<!-- 로그인 안됐을 때 / 코치  -->
		<section class="section-margin calc-60px">
			<div class="container">
				<div class="section-intro pb-60px">
					<h4 align="left">
						코치-<span class="section-intro__style">[${coachtext }] 카테고리</span>
					</h4>
				</div>
				<div class="row">

					<c:forEach items="${list3}" var="vo" begin="0" end="3">
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="card text-center card-product">
								<div class="card-product__img">
									<a href="../coach/info.do?coach_no=${vo.coach_no }"> <img
										class="card-img" src="${vo.poster }" alt="">
									</a>
								</div>
								<div class="card-body">
									<h4 class="card-product__title main_subtit">
										<a href="single-product.html">${vo.coach_name}</a>
									</h4>
								</div>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</section>
	</c:if>


	<!-- ================ offer section start ================= -->
	<section class="offer" id="parallax-1" data-anchor-target="#parallax-1"
		data-300-top="background-position: 20px 30px"
		data-top-bottom="background-position: 0 20px">
		<div class="container">
			<div class="row">
				<div class="col-xl-5">
					<div class="offer__content text-center">
						<h3 id="shop_tit">Shop Sale</h3>
						<a class="button button--active mt-3 mt-xl-4" href="../shop/shop.do?cate_no=2">Shop
							Now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ offer section end ================= -->

	<!-- ================ Blog section start ================= -->
	<section class="blog">
		<div class="container">
			<div class="section-intro pb-60px">
				<h2>
					<span class="section-intro__style">Latest News</span>
				</h2>
			</div>

			<div class="row">
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="card card-blog">
						<div class="card-blog__img">
							<img class="card-img rounded-0" src="../img/news1.jpg"
								alt="" style="height: 170px;">
						</div>
						<div class="card-body">
							<h4 class="card-blog__title">
								<a href="../news/detail.do?no=3">먹거리 트렌드 갖춘 ‘마카다미아’</a>
							</h4>
							<a class="card-blog__link" href="../news/detail.do?no=3">Read More <i
								class="ti-arrow-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="card card-blog">
						<div class="card-blog__img">
							<img class="card-img rounded-0" src="../img/news2.jpg"
								alt="">
						</div>
						<div class="card-body">
							<h4 class="card-blog__title">
								<a href="../news/detail.do?no=4">홈트 열풍에 주목받는 단백질 식품 ‘아몬드’</a>
							</h4>
							<a class="card-blog__link" href="../news/detail.do?no=4">Read More <i
								class="ti-arrow-right"></i></a>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
					<div class="card card-blog">
						<div class="card-blog__img">
							<img class="card-img rounded-0" src="../img/news3.jpg"
								alt="" style="height: 170px;">
						</div>
						<div class="card-body">
							<h4 class="card-blog__title">
								<a href="../news/detail.do?no=6">커피 한잔의 놀라운 효과 - 와인 3배 , 홍차 9배 항산화 폴리페놀 함유</a>
							</h4>
							<a class="card-blog__link" href="../news/detail.do?no=6">Read More <i
								class="ti-arrow-right"></i></a>
						</div>
					</div>
				</div>

				
				</div>
			</div>
		</div>
	</section>
	<!-- ================ Blog section end ================= -->

	</main>
</body>
</html>