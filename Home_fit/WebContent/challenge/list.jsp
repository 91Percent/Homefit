<%@page import="com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <title>Shop Homepage - Start Bootstrap Template</title>
  <style type="text/css">
  .challenge_room_count{
  	font-size: 15px;
  }
  .challinsert {
    float: right;
   }
   .challengebtn {
    margin-bottom: 20px;
	}
 </style>
 <script type="text/javascript">

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

		<p align="center">
			<a href="../member/logout2.do" id=logout
				class="button button-postComment button--active">로그아웃</a> <a
				href="../member/login2.do" id=login
				class="button button-postComment button--active">로그인</a>
		</p>
		<c:if test="${id }!=null">
		${id }님이 로그인 되었습니다.
		</c:if>

	</section>
	<!-- ================ end banner area ================= -->
	
  <!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
     <div class="container">
            <div class="row"> 
            
            <!-- start : 상세 페이지 왼쪽 -->
            <div class="col-xl-3 col-lg-4 col-md-5">
            <div class="sidebar-categories">
            <div class="head">운동 종류</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                   <ul>
                   <li class="filter-list"><input class="pixel-radio" type="radio" id="weight" name="ex" value="1" checked="checked"><label for="weight">근력 운동</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="yoga" name="ex" value="2"><label for="yoga">요가</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="pila" name="ex" value="3" ><label for="pila">필라테스</label></li>
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
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">1~10명<span>(29)</span>
                              </label>
                           </li>
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">11~20명<span>(29)</span>
                              </label>
                           </li>
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">21~30명<span>(29)</span>
                              </label>
                           </li>      
                        </ul>
                     </form>
                  </div>
                  <div class="common-filter">
                     <div class="head">Participants</div>
                     <form action="#">
                        <ul>
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">1~10명<span>(29)</span>
                              </label>
                           </li>
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">11~20명<span>(29)</span>
                              </label>
                           </li>
                           <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand">
                              <label for="apple">21~30명<span>(29)</span>
                              </label>
                           </li>      
                        </ul>
                     </form>
                  </div>
                  <div class="common-filter">
                     <div class="head">Price</div>
                     <div class="price-range-area">
                        <div id="price-range"></div>
                        <div class="value-wrapper d-flex">
                           <div class="price">Price:</div>
                           <span>$</span>
                           <div id="lower-value"></div>
                           <div class="to">to</div>
                           <span>$</span>
                           <div id="upper-value"></div>
                        </div>
                     </div>
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
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          
          <!-- start : 버튼 zone -->
          <div class=challengebtn>
	          <button type="button" class="button button-subscribe mr-auto mb-1 totalchall" onclick="location.href='../challenge/insert.do' ">
	        	전체 도전 목록
	          </button>
	          <button type="button" class="button button-subscribe mr-auto mb-1" onclick="location.href='../challenge/insert.do' ">
	        	참여 중인 도전
	          </button>
	          <button type="button" class="button button-subscribe mr-auto mb-1 challinsert" onclick="location.href='../challenge/insert.do' ">
	        	도전만들기
	          </button>
          </div>
          <!-- end : 버튼 zone -->
          
          <!-- start : 도전방목록list-->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
			 	<c:forEach var="vo" items="${list }">
	          <div class="col-lg-4 col-md-6 mb-4">
			  	<div class="card h-100">
			  																			<!-- 승구야 여기 poster경로 바꿔~! -->
					<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }"><img class="card-img-top" src="/Home_fit/challenge_poster/${vo.poster }" width=300px, height=150px>
					<%-- <a href="../challenge_room/detail.do"><img class="card-img-top" src="/Home_fit2/challenge_poster/${vo.poster }" width=300px, height=150px> --%>
					</a>
					  <div class="card-body">
					     <h4 class="card-title">
					      	<a href="../challenge/Certified_detail.do?challenge_no=${vo.challenge_no }">${vo.title }</a>
					     </h4>
					     <h5 class="challenge_room_count">${vo.challenge_no }명/${vo.limit }명</h5>
					     <p class="card-text"><fmt:formatDate value="${vo.start_day }" pattern="yyyy.MM.dd"/>  ~ <fmt:formatDate value="${vo.end_day }" pattern="yyyy.MM.dd"/></p>
					  </div>
					  <div class="card-footer">
					  	<small class="text-muted">리더: ${vo.id_leader }</small>
					  	<a href="..challenge_room/group_in/.jsp" class="btn btn-sm btn-danger">참여하기</a>
					    <!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
					  </div>
					  <!-- <div style="padding:5px 0px"> -->
	        		  <!-- </div> -->      		
			  	</div>
			  </div>
	</c:forEach>
	        </div>
          </section>
          <!-- end : 도전방목록list-->
					<nav class="blog-pagination justify-content-center d-flex">
						<ul class="pagination">
							<!-- 이전 -->
							<c:if test="${cupage>BLOCK }">
							
							
							<c:if test="$(cate==null)">
							<li class="page-item"><a href="../challenge_room/list.do?page=${startPage-1 }" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>
							
							<c:if test="$(cate!=null)">
								<li class="page-item"><a href="../challenge_room/list.do?cate=${cate }&page=${startPage-1 }" class="page-link"
									aria-label="Previous"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-left"></span>
									</span>
								</a></li>
							</c:if>
							
							
							</c:if>
							<!-- 이전 end -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
							  <c:if test="${i==curpage }">
							  
							  
							  <c:if test="$(cate==null)">
								<li class="page-item active">
									<a href="../challenge_room/list.do?page=${i }" class="page-link">${i }</a>
								</li>
								</c:if>
								
								<c:if test="$(cate!=null)">
								<li class="page-item active">
									<a href="../challenge_room/list.do?cate=${cate }&page=${i }" class="page-link">${i }</a>
								</li>
								</c:if>
							
							  </c:if>
							  <c:if test="${i!=curpage }">
							  
							  
							  
							  <c:if test="$(cate==null)">
								<li class="page-item">
									<a href="../challenge_room/list.do?page=${i }" class="page-link">${i }</a>
								</li>
								</c:if>
								
								<c:if test="$(cate!=null)">
								<li class="page-item">
									<a href="../challenge_room/list.do?cate=${cate }&page=${i }" class="page-link">${i }</a>
								</li>
								</c:if>
								
							  </c:if>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${endpage<totalpage }">
							
							<c:if test="$(cate==null)">
								<li class="page-item"><a href="../challenge_room/list.do?page=${endPage+1 }" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
							<c:if test="$(cate!=null)">
								<li class="page-item"><a href="../challenge_room/list.do?cate=${cate }&page=${endPage+1 }" class="page-link"
									aria-label="Next"> <span aria-hidden="true"> <span
											class="lnr lnr-chevron-right"></span>
									</span>
								</a></li>
							</c:if>
							
							</c:if>
							<!-- 다음 end -->
						</ul>
					</nav>

        </div>
        <!-- end : 상세페이지 오른쪽 -->
        
      </div>
    </div>
  </section>
  <!-- ================ category section end ================= -->	

</body>

</html>