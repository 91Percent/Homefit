<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let check;
let lev;
let k;
$(function(){
	$('.pixel-radio').click(function(){
		check = $(this).attr("value");
	 $.ajax({
		 type:'post',
		 url:'../ex/content.do?cate_no='+check,
		 success:function(result)
		 {
			 $('.category-list').html(result);
		 }
	 });
});
	$('.radio').click(function(){
		 lev = $(this).attr("value");
	 $.ajax({
		 type:'post',
		 url:'../ex/level.do?home_level='+lev+"&cate_no="+check,
		 success:function(result)
		 {
			 $('.category-list').html(result);
		 }
	 });
});
	$('.option').click(function(){
		var sel = $(this).attr("data-value");
		console.log(sel);
	 $.ajax({
		 type:'post',
		 url:'../ex/content.do?cate_no='+sel,
		 success:function(result)
		 {
			 $('.category-list').html(result);
		 }
	 });
});
	$('#kkk').click(function(){
		 k=$('#keyword').val();
		$.ajax({
			 type:'post',
			 url:'../ex/search.do?subject='+k,
			 success:function(result)
			 {
				 $('.category-list').html(result);
			 }
		 });
		
// 		let temp=$('#test11 .card-body>a>p:contains("'+k+'")');
// 		$(temp).parent().parent.show();
	})
})

	
// 	$('#keyword').keyup(function(){
// 	let k=$('#keyword').val();// 검색어 입력한 값을 읽어 온다 
// 	$('#movie-table > tbody > tr').hide();
// 	let temp=$('#movie-table > tbody > tr> td:nth-child(2n+2):contains("'+k+'")');
// 	$(temp).parent().show();
// 	// temp ==> td

</script>
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
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="weight" name="ex" value="1"><label for="weight">근력 운동</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="yoga" name="ex" value="2"><label for="yoga">요가</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="pila" name="ex" value="3"><label for="pila">필라테스</label></li>
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
                  <li class="filter-list"><input class="radio" type="radio" id="beginner" name="ex" value="1" ><label for="초급">초급</label></li>
                  <li class="filter-list"><input class="radio" type="radio" id="middle" name="ex" value="2" ><label for="중급">중급</label></li>
                  <li class="filter-list"><input class="radio" type="radio" id="high" name="ex" value="3"><label for="고급">고급</label></li>
                </ul>
              </form>
            </div>
            
            
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
           <div class="filter-bar d-flex flex-wrap align-items-center">
<!--             <div class="sorting"> -->
<!--               <select name="ex_sor" id="ex_sor"> -->
<!--                 <option class="option1" value="1" >근력</option> -->
<!--                 <option class="option1" value="2">요가</option> -->
<!--                 <option class="option1" value="3">필라테스</option> -->
<!--               </select> -->
<!--               <div class="nice-select" tabindex="0"> -->
<!-- 				<span class="current">선택</span> -->
<!-- 				<ul class="list"> -->
<!-- 				<li data-value="1" class="option">근력</li> -->
<!-- 				<li data-value="2" class="option">요가</li> -->
<!-- 				<li data-value="3" class="option">필라테스</li> -->
<!-- 				</ul> -->
<!-- 				</div> -->
<!--             </div> -->
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" id="keyword" name="keyword" placeholder="Search">
                <div class="input-group-append">
                  <button type="button" id="kkk"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list row1" id="test11">
 			<div class="row row2">
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.poster }" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button onclick="location.href='detail.do?home_no=${vo.home_no }'"><i class="ti-search"></i></button></li>
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
<!--                           <ul class="pagination"> -->
<%--                           <c:if test="${curpage>BLOCK }"> --%>
<!--                               <li class="page-item"> -->
<%--                                   <a href="../ex/total.do?page=${startPage-1 }" class="page-link" aria-label="Previous"> --%>
<!--                                     &lt; -->
<!--                                   </a> -->
<!--                               </li> -->
<%--                               </c:if> --%>
<%--                               <c:forEach var="i" begin="${startPage }" end="${endPage }"> --%>
<%--                               <c:if test="${i==curpage }"> --%>
<!--                               <li class="active"> -->
<%--                                   <a href="../ex/total.do?page=${i} " class="page-link">${i }</a> --%>
<!--                               </li> -->
<%--                               </c:if> --%>
<%--                               <c:if test="${i!=curpage }"> --%>
<!--                               	<li class="page-item"> -->
<%--                                   <a href="../ex/total.do?page=${i} " class="page-link">${i }</a> --%>
<!--                               </li> -->
<%--                               </c:if> --%>
<%--                               </c:forEach> --%>
<%--                               <c:if test="${endPage<totalpage }"> --%>
<!--                               <li class="page-item"> -->
<%--                                   <a href="../ex/total.do?page=${endPage+1 }" class="page-link" aria-label="Next"> --%>
<!--                                       &gt; -->
<!--                                   </a> -->
<!--                               </li> -->
<%--                             </c:if> --%>
<!--                           </ul> -->
                      </nav>
              
 	          </section> 
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
</body>
</html>