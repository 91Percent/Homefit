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
  .pagination{display:inline-block;padding-left:0;margin:20px 0;border-radius:4px}.pagination>li{display:inline}.pagination>li>a,.pagination>li>span{position:relative;float:left;padding:6px 12px;margin-left:-1px;line-height:1.42857143;color:#337ab7;text-decoration:none;background-color:#fff;border:1px solid #ddd}.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover{z-index:2;color:#23527c;background-color:#eee;border-color:#ddd}.pagination>li:first-child>a,.pagination>li:first-child>span{margin-left:0;border-top-left-radius:4px;border-bottom-left-radius:4px}.pagination>li:last-child>a,.pagination>li:last-child>span{border-top-right-radius:4px;border-bottom-right-radius:4px}.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover{z-index:3;color:#fff;cursor:default;background-color:#337ab7;border-color:#337ab7}.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover{color:#777;cursor:not-allowed;background-color:#fff;border-color:#ddd}.pagination-lg>li>a,.pagination-lg>li>span{padding:10px 16px;font-size:18px;line-height:1.3333333}.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span{border-top-left-radius:6px;border-bottom-left-radius:6px}.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span{border-top-right-radius:6px;border-bottom-right-radius:6px}.pagination-sm>li>a,.pagination-sm>li>span{padding:5px 10px;font-size:12px;line-height:1.5}.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span{border-top-left-radius:3px;border-bottom-left-radius:3px}.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span{border-top-right-radius:3px;border-bottom-right-radius:3px}
  .pager{padding-left:0;margin:20px 0;text-align:center;list-style:none}.pager li{display:inline}.pager li>a,.pager li>span{display:inline-block;padding:5px 14px;background-color:#fff;border:1px solid #ddd;border-radius:15px}.pager li>a:focus,.pager li>a:hover{text-decoration:none;background-color:#eee}.pager .next>a,.pager .next>span{float:right}.pager .previous>a,.pager .previous>span{float:left}.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span{color:#777;cursor:not-allowed;background-color:#fff}
  .pager:after,.pager:before,.panel-body:after,.panel-body:before,.row:after,.row:before{display:table;content:" "}.btn-group-vertical>.btn-group:after,.btn-toolbar:after,.clearfix:after,.container-fluid:after,.container:after,.dl-horizontal dd:after,.form-horizontal .form-group:after,.modal-footer:after,.modal-header:after,.nav:after,.navbar-collapse:after,.navbar-header:after,.navbar:after,.pager:after,.panel-body:after,.row:after{clear:both}
  </style>
  
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
          
		  <!-- start : Pagination -->
		  <div class="row">
		    <div class="text-center">
		       <ul class="pagination">
		          <c:if test="${curpage>BLOCK }">
		           <li><a href="../challenge_room/list.do?page=${startPage-1 }">&lt;</a></li>
		          </c:if>
		          <c:forEach var="i" begin="${startPage }" end="${endPage }">
		            <c:if test="${i==curpage }">
		              <li class="active"><a href="../challenge_room/list.do?page=${i }">${i }</a></li>
		            </c:if>
		            <c:if test="${i!=curpage }">
		              <li><a href="../challenge_room/list.do?page=${i }">${i }</a></li>
		            </c:if>
		          </c:forEach>
		          <c:if test="${endPage<totalpage }">
				    <li><a href="../challenge_room/list.do?page=${endPage+1 }">&gt;</a></li>
				  </c:if>
				</ul>
		    </div>
		    </div>
		    <!-- end : Pagination-->
        </div>
        <!-- end : 상세페이지 오른쪽 -->
        
      </div>
    </div>
  </section>
  <!-- ================ category section end ================= -->	

</body>

</html>
