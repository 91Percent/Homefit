<%@page import="com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Shop Homepage - Start Bootstrap Template</title>
<style type="text/css">
.challenge_room_count {
	font-size: 15px;
}

.challinsert {
	float: right;
}

.challengebtn {
	margin-bottom: 20px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
// 카테고리 선택 사항을 [키=name] , [값=id]
// 선택사항[] = {키+=키 , 값+=값}
let cate = $(":input:radio[name=challcate]:checked").val();
$(function () {
	$('.pixel-radio').click(function(){
		console.log('cate:'+cate)		
		cate=$(this).val();
		$.ajax({
			type:'post',
			url:'../challenge/sublist2.do'
			data:{cate:cate}
			success:function(result)
			{
				$('.sublist').html(result);
			}
		});
	});
	
	// 라디오버튼 클릭 안했을땐가?
	$(function(){
		$.ajax({
			type:'post',
			url:'../challenge/sublist2.do',
			success:function(result)
			{
				$('.sublist').html(result);
			}
			
		});
	});
});

</script>
</head>
<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Challenge With Me!</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">함께 도전해요!</a></li>
							<li class="breadcrumb-item active" aria-current="page">Total</li>
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

				<!-- start : 상세 페이지 왼쪽 -->
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">Challenge Category</div>
						<ul class="main-categories">
							<li class="common-filter">
								<form action="#">
									<ul>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="challcateall" name="challcate" value="all"
											checked="checked"><label for="challex">전체 선택</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="challex" name="challcate" value="exercise"><label 
											for="challex">운동 도전</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="challfood" name="challcate" value="food"><label
											for="challfood">식단 도전</label></li>
										<li class="filter-list"><input class="pixel-radio"
											type="radio" id="challetc" name="challcate" value="etc"><label
											for="challetc">기타</label></li>
									</ul>
								</form>
							</li>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">Challenge Filters</div>
						<div class="common-filter">
							<div class="head">Participants</div>
							<form action="#">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="challpartcount" name="challpartcount" checked="checked" value="periodall"> <label
										for="allperiod">전체<span>(29)</span>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="challpartcount" name="challpartcount" value="periodxs"> <label
										for="periodxs">1~10명<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="challpartcount" name="challpartcount" value="periods"> <label
										for="periods">11~50명<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="challpartcount" name="challpartcount" value="periodm"> <label
										for="periodm">51~100명<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="challpartcount" name="challpartcount" value="periodl"> <label
										for="periodl">100명 이상<span>(29)</span>
									</label></li>
								</ul>
							</form>
						</div>
						<div class="common-filter">
							<div class="head">Period</div>
							<form action="#">
								<ul>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="apple" name="brand"> <label
										for="apple">10일 미만<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="apple" name="brand"> <label
										for="apple">30일 미만<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="apple" name="brand"> <label
										for="apple">100일 미만<span>(29)</span>
									</label></li>
									<li class="filter-list"><input class="pixel-radio"
										type="radio" id="apple" name="brand"> <label
										for="apple">100일 이상<span>(29)</span>
									</label></li>
								</ul>
							</form>
						</div>
					</div>
				</div>
				<!-- end : 상세 페이지 왼쪽 -->

				<!-- start : 상세 페이지 오른쪽 -->
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
									<button type="button">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filter Bar -->

					<!-- start : 버튼 zone -->
					<div class=challengebtn>
						<button type="button"
							class="button button-subscribe mr-auto mb-1 totalchall"
							onclick="location.href='../challenge/insert.do' ">전체 도전 목록</button>
						<c:if test="${sessionScope.id!=null }">
							<button type="button" class="button button-subscribe mr-auto mb-1"
								onclick="location.href='../challenge/insert.do' ">참여 중인 도전</button>
							<button type="button"
								class="button button-subscribe mr-auto mb-1 challinsert"
								onclick="location.href='../challenge/insert.do' ">도전만들기
							</button>
						</c:if>
					</div>
					<!-- end : 버튼 zone -->

					<!-- start : 도전방목록list-->
					<section class="lattest-product-area pb-40 category-list">
						<div class="sublist">
							
								<!-- ======================== 도전 목록 출력 위치 ============================= -->
						</div>
					</section>
					<!-- end : 도전방목록list-->
				
					<!-- ////////////// pagination start /////////////////////// -->
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<!-- 이전 -->
								<c:if test="${cupage>BLOCK }">
									<c:if test="$(cate==null)">
										<li class="page-item"><a
											href="../challenge/list.do?page=${startPage-1 }"
											class="page-link" aria-label="Previous"> <span
												aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
											</span>
										</a></li>
									</c:if>
									<c:if test="$(cate!=null)">
										<li class="page-item"><a
											href="../challenge/list.do?page=${startPage-1 }"
											class="page-link" aria-label="Previous"> <span
												aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
											</span>
										</a></li>
									</c:if>
								</c:if>
								<!-- 이전 end -->
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i==curpage }">
	
											<li class="page-item active"><a
												href="../challenge/list.do?page=${i }"
												class="page-link">${i }</a></li>
									</c:if>
									<c:if test="${i!=curpage }">
											<li class="page-item"><a
												href="../challenge/list.do?page=${i }"
												class="page-link">${i }</a></li>
									</c:if>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${endpage<totalpage }">
	
										<li class="page-item"><a
											href="../challenge/list.do?page=${endPage+1 }"
											class="page-link" aria-label="Next"> <span
												aria-hidden="true"> <span
													class="lnr lnr-chevron-right"></span>
											</span>
										</a></li>
	
								</c:if>
								<!-- 다음 end -->
							</ul>
						</nav>
					<!-- ////////////// pagination end /////////////////////// -->
					

				</div>
				<!-- end : 상세페이지 오른쪽 -->

			</div>
		</div>
	</section>
	<!-- ================ category section end ================= -->

</body>

</html>