<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">
<style>
.row1{
font-family: 'Nanum Pen Script',cursive;
}
.p{
font-family: 'Nanum Pen Script',cursive;
}
</style>
</head>
<body>
<section class="blog-banner-area row1" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>HOMETRAINING</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">전체보기</a></li>
              <li class="breadcrumb-item active" aria-current="page">1조와 함께 하는 홈트레이닝</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
 <section class="section-margin--small mb-5 row1">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">운동 종류</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="weight" name="brand"><label for="weight">근력 운동</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="yoga" name="brand"><label for="yoga">요가</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="pila" name="brand"><label for="pila">필라테스</label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head">세부 분류</div>
            <div class="common-filter">
              <div class="head">난이도</div>
              <form action="#">
                <ul>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="beginner">초급</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="intermediate">중급</label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">고급</label></li>
                </ul>
              </form>
            </div>
            
            
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">근력</option>
                <option value="1">기동성</option>
                <option value="1">유연성</option>
                <option value="1">밸런스</option>
                <option value="1">호흡</option>
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
          <section class="lattest-product-area pb-40 category-list row1">
            <div class="row">
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.poster }" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <a href="detail.do?home_no=${vo.home_no }"><p>${vo.subject }</p></a>
                  </div>
                </div>
              </div>
              </c:forEach>
              </div>
              <!-- 페이지 바 -->
                      <nav class="blog-pagination justify-content-center d-flex">
                          <ul class="pagination">
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item">
                                  <a href="../ex/total.do?page=${startPage-1 }" class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="active">
                                  <a href="../ex/total.do?page=${i} " class="page-link">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page-item">
                                  <a href="../ex/total.do?page=${i} " class="page-link">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li class="page-item">
                                  <a href="../ex/total.do?page=${endPage+1 }" class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
                          </ul>
                      </nav>
                  </div>
              </div>
              
 	          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
</body>
</html>