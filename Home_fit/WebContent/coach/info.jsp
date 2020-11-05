<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>
		<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>코치정보</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">G반</a></li>
              <li class="breadcrumb-item active" aria-current="page">안치훈</li>
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
							<img class="img-fluid" src="${vo.poster }">
						</div>
						<!--<div class="single-prd-item">
							<img class="img-fluid" src="${vo.coach_poster }">
						</div>
						
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${vo.coach_name }</h3>
						<h3>${vo.subject }</h3>
						<h3>${vo.price }</h3>
						<!-- <div class="col-lg-6"> -->
						<div class="review_box">
						<h4>Add to Review</h4>
						<form action="../coach/reply_insert.do" method="post" class="form-contact form-review mt-3">
						<div class="form-group">
						<textarea class="form-control different-control w-200" name="content" id="textarea" cols="500" rows="5" placeholder="Enter Message"></textarea>
						<input type="hidden" value="${vo.coach_no}" name="coach_no">
						<input type="hidden" value="${vo.cate_no}" name="cate_no">
						</div>
						<div class="form-group text-center text-md-right mt-3">
						<button type="submit" class="button button--active button-review">리뷰남기기</button>
						</div>
						</form>
						</div>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">코치정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">규정</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false">예약정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>${vo.coach_detail }</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<p>${vo.content }</p>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div>
							<div>
								<div class="review_item">
									<table class="table">
										<tr>
											<td><h5>스케쥴번호</h5></td>
											<td><h5>코치번호</h5></td>
											<td><h5>월별</h5></td>
											<td><h5>시간별</h5></td>
											<td><h5>장소</h5></td>
										</tr>
											<form action="../coachreserve/reserve_ok.do">
												<c:forEach var="svo" items="${slist }">
										<tr>
											<td><input type="checkbox" name="schedule_no" value="${svo.schedule_no}">&nbsp;${svo.schedule_no}</td>
											<td><input type="hidden" name="coach_no" value="${svo.coach_no}">${svo.coach_no}</td>
											<td>${svo.month}</td>
											<td>${svo.time}</td>
											<td>${svo.place}</td>
										</tr>
												</c:forEach>
											<input type="submit" value="간편예약">
											</form>
									</table>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
												<div class="row">
													<div class="col-lg-12">
														<div class="row total_rate">
															<div class="col-12">
																<div class="rating_list">
																	<h3>Coach Reviews</h3>
																</div>
															</div>
														</div>	
														<div>
															<table class="table">
															<c:forEach var="vo" items="${coachReply_list}">
															<div style="height: auto; width: 100%; border-top:1px solid;">
																<div class="media">
																	<div class="d-flex">
																		<img src="img/product/review-2.png" alt="">
																	</div>
																	<div class="media-body">
																		<p align="right">
																		<a class="text-left">
																           <c:if test="${rvo.group_tab>0 }">
																             <c:forEach var="i" begin="1" end="${rvo.group_tab }">
																               &nbsp;&nbsp;
																             </c:forEach>
																                             ☞
																           </c:if>
																           &nbsp;${rvo.name }(${rvo.dbday })
																          </a>
																		</p>
																		<p align="right">
																		<c:if test="${sessionScope.id!=rvo.id }">
															             <a href="#" class="btn btn-xs btn-primary">수정</a>
															             <a href="#" class="btn btn-xs btn-success">삭제</a>
															            </c:if>
															             <a href="#" class="btn btn-xs btn-danger">댓글</a>
																		</p>
																	</div>
																</div>
																<c:if test="${rvo.group_tab>0}">
													             <c:forEach var="i" begin="1" end="${vo.group_tab }">
													               &nbsp;&nbsp;
													             </c:forEach>
													           </c:if>
													           <table class="table">
													           <c:forEach var="vo" items="${coachReply_list}">
																	<p>${rvo.Content}</p>
																</c:forEach>
																</table>
																</div>
																</c:forEach>
																</table>
															</div>
														</div>
													</div>
													
													<%-- <div class="col-lg-6">
														<div class="review_box">
															<h4>Add to Review</h4>
															<form action="../coach/reply_insert.do" method="post" class="form-contact form-review mt-3">
																<div class="form-group">
																	<textarea class="form-control different-control w-200" name="content" id="textarea" cols="90" rows="5" placeholder="Enter Message"></textarea>
																	<input type="hidden" value="${vo.coach_no}" name="coach_no">
																	<input type="hidden" value="${vo.cate_no}" name="cate_no">
																</div>
																<div class="form-group text-center text-md-right mt-3">
																	<button type="submit"
																		class="button button--active button-review">Submit
																		Now</button>
																</div>
															</form>
														</div>
												</div> --%>
												</div>
											</div>
										</div>
									</div>
</section>
						
	<!--================End Product Description Area =================-->

</body>
</html>
