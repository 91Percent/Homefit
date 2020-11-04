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
<title>Challenge List</title>
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
let cate ="";
//let state="";
//let sorting="";
var page = $(this).attr("page");
$(function () {

	
	// 검색어 입력 시
	$('#searchbtn').click(function() {
		let keyword=$('#searchtext').val();
		console.log(keyword);
		if(keyword=="")
			{
			alert("검색어를 입력하세요");
			return;
			}
		$.ajax({
			type:'post',
			url:'../challenge/search.do',
			data:{'keyword':keyword},
			success:function(result)
			{
				$('.sublist').html(result);
			}
		});
	});

	
	// 아무것도선택 안했을 때
	$.ajax({
			type:'post',
			url:'../challenge/sublist.do',
			data:{'sorting':'regdate'},
			//data:{'page':page},
 			//data:{'state':state},
			success:function(result)
			{
				$('.sublist').html(result);
			}
	});
	
	// 카테고리 선택 해제
		$('#cate_init').click(function () {
		$('.a').prop('checked',false);
		$.ajax({
			type:'post',
			url:'../challenge/sublist.do',
			data:{'sorting':'regdate'},
			//data:{'cate':cate},
			success:function(result)
			{
				$('.sublist').html(result);
			}
			
		});
		
	});
	
	// 도전 현황 선택 해제
// 	$('#state_init').click(function () {
		
// 		$('.b').prop('checked',false);
// 		$.ajax({
// 			type:'post',
// 			url:'../challenge/sublist.do',
// 			data:{'cate':cate},
// 			success:function(result)
// 			{
// 				$('.sublist').html(result);
// 			}
			
// 		});
		
// 	});
	
	// 카테고리 클릭했을 떄
	$('.pixel-radio').click(function(){
		cate = $(":input:radio[name=challcate]:checked").val();	
 		state = $(":input:radio[name=challengeState]:checked").val();	

 		//console.log(state);
		console.log(cate);

		$.ajax({
			type:'post',
			url:'../challenge/sublist.do',
			data:{'cate':cate},
 			//data:{'state':state},
 			//data:{'page':page},
			success:function(result)
			{
				$('.sublist').html(result);
			}
		});
	});
	
//	정렬 기준 선택했을 때
	$('#sorting').on('change',function(){
		let sorting = $('#sorting option:selected').val();
		if(sorting==null)
			sorting="regdate";
		console.log(sorting);
		$.ajax({
			type:'post',
			url:'../challenge/sublist.do',
			data:{'sorting':sorting},
			//data:{'page':page},
 			//data:{'state':state},
			success:function(result)
			{
				$('.sublist').html(result);
			}
		});
	})
	

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
							<li class="breadcrumb-item active" aria-current="page">Total Challenge List</li>
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
										
										
										<li class="filter-list cate"><input class="pixel-radio a"
											type="radio" id="challex" name="challcate" value="exercise"><label 
											for="challex">운동 도전</label></li>
										<li class="filter-list cate"><input class="pixel-radio a"
											type="radio" id="challfood" name="challcate" value="food"><label
											for="challfood">식단 도전</label></li>
										<li class="filter-list cate"><input class="pixel-radio a"
											type="radio" id="challetc" name="challcate" value="etc"><label
											for="challegecateclear">기타</label></li>
										
										
									</ul>
								</form>
							</li>
							<li class="challengecate">
										<input type="button" class="btn btn-primary btn-sm" id="cate_init" value="선택해제">
										</li>
						</ul>
					</div>
<!-- 					<div class="sidebar-filter"> -->
<!-- 						<div class="top-filter-head">Challenge Filters</div> -->
<!-- 						<div class="common-filter"> -->
<!-- 							<div class="head">도전 현황</div> -->
<!-- 							<form action="#"> -->
<!-- 								<ul> -->
<!-- 									<li class="filter-list state"><input class="pixel-radio b" -->
<!-- 										type="radio" id="challengWaiting" name="challengeState" value="waiting"> <label -->
<!-- 										for="periodxs">도전 대기<span></span> -->
<!-- 									</label></li> -->
<!-- 									<li class="filter-list state"><input class="pixel-radio b" -->
<!-- 										type="radio" id="challengeIng" name="challengeState" value="ing"> <label -->
<!-- 										for="periods">진행중<span></span> -->
<!-- 									</label></li> -->
<!-- 									<li class="filter-list state"><input class="pixel-radio b" -->
<!-- 										type="radio" id="challengeEnd" name="challengeState" value="end"> <label -->
<!-- 										for="periodm">도전 종료<span></span> -->
<!-- 									</label></li> -->
									
<!-- 									<input type="button" class="btn btn-primary btn-xxs" id="state_init" value="선택해제"></button> -->
<!-- 								</ul> -->
<!-- 							</form> -->
<!-- 						</div> -->
			
<!-- 					</div> -->
				</div>
				<!-- end : 상세 페이지 왼쪽 -->

				<!-- start : 상세 페이지 오른쪽 -->
				<div class="col-xl-9 col-lg-8 col-md-7">

					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<select id="sorting">
								<option value="regdate">최신등록순</option>
								<option value="start_day">최신시작순</option>
								<option value="end_day">최신종료순</option>
							</select>
						</div>
						

						<div>
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Search" id="searchtext">
								<div class="input-group-append">
									<button type="button" id="searchbtn">
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
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item" page=${startPage-1 }>
                                  <a class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="page-item active" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page-item" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li class="page-item" page=${endPage+1 }>
                                  <a class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
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