<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.html"><img src="../template/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="index.html">홈핏</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop(한비)</a>
                <ul class="dropdown-menu">
                <!-- category.html -->
                  <li class="nav-item"><a class="nav-link" href="../shop/shop.do?cate_no=11">식단</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">건강간식</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">식사대용</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">단백질보충</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">체지방관리</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">헬스케어</a></li>
                </ul>
			  </li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">코치(치훈)</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">코치소개</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-blog.html">아돈노</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="../challenge/Challenge.do" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">함께도전해요</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../challenge/Challenge.do">도전</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.html">블라블라</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">알아서채움</a></li>
                </ul>
              </li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">홈트</a>
                   <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../ex/total.do">홈트레이닝</a></li>
                  <li class="nav-item"><a class="nav-link" href="../ex/weight.do?cate_no=1">근력</a></li>
                  <li class="nav-item"><a class="nav-link" href="../ex/yoga.do?cate_no=2">요가</a></li>
                  <li class="nav-item"><a class="nav-link" href="../ex/pila.do?cate_no=3">필라</a></li>
                </ul>
              </li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">꿀팁</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="login.html">칼로리</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.html">뉴스</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">게시판</a></li>
                </ul>
              </li>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
              <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
</body>
</html>