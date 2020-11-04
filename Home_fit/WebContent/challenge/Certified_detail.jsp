<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../template/vendors/owl-carousel/owl.carousel.min.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/lib/w3.css">
<link rel='stylesheet' href='css/style.css'>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script>
	
</script>
<style>
.seunggu {
	margin: 0px;
	padding: 0px;
}

.btn-basic {
	background: #d3d3d3;
}

.btn-basic2 {
	background: #d3d3d3;
	padding-top: 5px;
	display: inline;
	float: center;
}
</style>
</head>
<body>
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<h3>
							<span class="section-intro__style"><b>${vo.title }</b></span>
						</h3>
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid"
									src="/Home_fit/challenge_poster/${vo.poster}" alt="">
							</div>
						</div>



						<div class="col-lg-12">

							<div class="quotes">
								<div class="feature-img">
									<img class="img-fluid"
										src="../Home_fit/challenge_poster/${vo.poster}" alt="">



								</div>

								<table class="challengeDetailIndex">
									<tr class="challengeDetailIndex2">
										<td width=40%>카테고리</td>
										<td width=60%>${vo.cate }</td>
									</tr>
									<tr>
										<td width=40%>그룹리더</td>
										<td width=60%>${vo.id_leader }</td>
									</tr>

									<tr>
										<td width=40%>등록일</td>
										<td width=60%>${vo.regdate }</td>
									</tr>

									<tr>
										<td width=40%>도전시작일</td>
										<td width=60%>${vo.db_start_day }</td>
									</tr>

									<tr>
										<td width=40%>도전종료일</td>
										<td width=60%>${vo.end_day }</td>
									</tr>
								</table>
								<section class="product_description_area">
									<div class="container">

										<div class="comment-form">
											<c:if test="${count==1 || count==3}">
												<a
													href="../challenge/participation.do?challenge_no=${vo.challenge_no }"
													class="button button-postComment button--active">이미 참여
													중인 도전입니다.</a>
											</c:if>
											<c:if test="${count==0}">
												<a
													href="../challenge/participation.do?challenge_no=${vo.challenge_no }"
													class="button button-postComment button--active">참여하기</a>
											</c:if>
										</div>


										<ul class="nav nav-tabs" id="myTab" role="tablist">
											<li class="nav-item"><a class="nav-link" id="home-tab"
												data-toggle="tab" href="#home" role="tab"
												aria-controls="home" aria-selected="true">방 정보</a></li>
											<li class="nav-item"><a class="nav-link"
												id="profile-tab" data-toggle="tab" href="#profile"
												role="tab" aria-controls="profile" aria-selected="false">내
													정보</a></li>
											<li class="nav-item"><a class="nav-link"
												id="contact-tab" data-toggle="tab" href="#contact"
												role="tab" aria-controls="contact" aria-selected="false">방
													인증 사진</a></li>
											<li class="nav-item"><a class="nav-link active"
												id="review-tab" data-toggle="tab" href="#review" role="tab"
												aria-controls="review" aria-selected="false">소통 하기</a></li>
										</ul>
										<div class="tab-content" id="myTabContent">
											<div class="tab-pane fade" id="home" role="tabpanel">
												<div class="table-responsive">${vo.content }</div>
											</div>
											<div class="tab-pane fade" id="profile" role="tabpanel"
												aria-labelledby="profile-tab">
												
												<c:if test="${id==null }">
													<div>
														<center>
														로그인 정보가 없습니다.
														</center>
													</div>
												</c:if>
												<c:if test="${id!=null }">
												<div class="table-responsive">
													<table class="table">
														<tbody>
															<tr>
																<td>
																	<h5>아이디</h5>
																</td>
																<td>
																	<h5>${sessionScope.id }</h5>
																</td>
															</tr>
															<tr>
																<td>
																	<h5>이름</h5>
																</td>
																<td>
																	<h5>${sessionScope.name}</h5>
																</td>
															</tr>
															<tr>
																<td>
																	<h5>내 참여율</h5>
																</td>
																<td>
																	<h5>${percent }%</h5>
																</td>
															</tr>
															<tr>
																<td>
																	<h5>인증 횟수</h5>
																</td>
																<td>
																	<h5>${id_certified_count }번</h5>
																</td>
															</tr>
															<tr>
																<td>
																	<h5>인증 해야하는 횟수</h5>
																</td>
																<td>
																	<h5>${Period }번</h5>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<h5>진행 상황</h5>
																</td>
															</tr>
															<tr>
														<tbody>

															<td colspan="4">${sessionScope.name }님의인증률 표시
																<div class="w3-light-grey">
																	<div class="w3-container w3-blue w3-center"
																		style="width:${percent}%" width=100>${percent}%</div>
																</div> <br>
															</td>
															<td></td>

															<tr>
																<td colspan="4">과정 진행률 표시 <c:if
																		test="${room_percent_str==0 || room_percent_str==null }">
																		<p align="center">아직 도전이 시작 되지 않았습니다.</p>
																	</c:if> <c:if test="${room_percent_str>0 }">

																		<div class="w3-light-grey">
																			<div class="w3-container w3-red w3-center"
																				style="width:${room_percent_str}%">${room_percent_str}</div>
																		</div>
																		<br>

																	</c:if>
																</td>
																<td></td>
															</tr>

														</tbody>
														</tr>
														<tr>
															<td>
																<h5>목표 인증까지 ${Period-id_certified_count} 번 남았습니다</h5>
															</td>
														</tr>

														</tbody>
													</table>
												</div>
												</c:if>
											</div>
											<div class="tab-pane fade" id="contact" role="tabpanel"
												aria-labelledby="contact-tab">
												<div class="row">
													<c:forEach var="Certifiedvo" items="${Certifiedvo }">
														<div class="col-md-4 col-lg-4 mb-4 mb-lg-0 seunggu">
															<div class="card card-blog">
																<div class="card-blog__img">
																	<img
																		src="/Home_fit/challenge_poster/${Certifiedvo.poster}"
																		alt="" width=200 height=200>
																</div>
																<div class="card-body">
																	<ul class="card-blog__info">
																		<li><i class="ti-comments-smiley"></i>${Certifiedvo.challenge_id}</li>
																		<li>${Certifiedvo.db_Certified_date}</li>
																	</ul>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
												<p align="center">

													<!-- 
														Certifieid_count는 사용자가 인증한 횟수다 ! 테스트를위해서 일단은 주석 처리!!!!!!!
													
													 -->
													<%-- 													<c:if test="${certifeid_count==0 }">	 --%>
													<c:if test="${count==1 || count==3}">
														<a
															href="../challenge/Certified.do?challenge_no=${ vo.challenge_no}"
															class="button button-postComment button--active">인증하기</a>
													</c:if>
													<%-- 													</c:if>					 --%>
													<%-- 													<c:if test="${certifeid_count>=1}"> --%>
													<!-- 														<span class="btn btn-la btn-danger" >오늘은  이미 인증 하셨습니다.</span> -->
													<%-- 													</c:if> --%>
												</p>
											</div>
											<div class="tab-pane fade show active" id="review"
												role="tabpanel" aria-labelledby="review-tab">
												<div class="row">
													<div class="col-lg-12">
														<div class="row total_rate">
															<div class="col-12">
																<div class="rating_list">
																	<h3>Challenge Reviews</h3>
																</div>
															</div>
														</div>
														<div class="review_list">
															<div class="review_item">
																<c:forEach var="rvo" items="${Reply_list}">
																	<div
																		style="height: auto; width: 100%; border-top: 1px solid;">
																		<div class="media">
																			<div class="d-flex">
																				<img src="img/product/review-2.png" alt="">
																			</div>
																			<div class="media-body">
																				<p align="right">
																					<td class="text-left"><c:if
																							test="${rvo.group_tab>0 }">
																							<c:forEach var="i" begin="1"
																								end="${rvo.group_tab }">
																               &nbsp;&nbsp;
																             </c:forEach>
																                             ☞
																           </c:if> <!-- 																           <img src="../board/img.png"> 사용자 이미지 따로 받아서 출력하면 좋을거 같음-->
																						&nbsp;${rvo.name }(${rvo.dbday })</td>
																				</p>
																				<p align="right">
																					<c:if test="${sessionScope.id==rvo.id }">
																						<a href="#" class="btn btn-sm btn-basic">수정</a>
																						<a href="#" class="btn btn-sm btn-basic">삭제</a>
																					</c:if>
																					<a href="#" class="btn btn-sm btn-basic">댓글</a>
																				</p>
																			</div>
																		</div>
																		<c:if test="${rvo.group_tab>0}">
																			<c:forEach var="i" begin="1" end="${vo.group_tab }">
													               &nbsp;&nbsp;
													             </c:forEach>
																		</c:if>
																		<caption class="text-center">
																			<pre
																				style="white-space: pre-wrap; background-color: white; border: none">${rvo.content}</pre>
																		</caption>
																	</div>
																</c:forEach>
															</div>
														</div>
													</div>
													<div class="col-lg-6"></div>
													<div class="review_box">
														<h4>Add to Review</h4>
														<!-- 															String challenge_no = request.getParameter("challenge_no"); -->
														<!-- 			   												String content=request.getParameter("content"); -->
														<form action="../challenge/reply_insert.do" method="post"
															class="form-contact form-review mt-3">
															<div class="form-group">
																<textarea class="form-control different-control w-200"
																	name="content" id="textarea" cols="90" rows="5"
																	placeholder="Enter Message"></textarea>
																<input type="hidden" value="${vo.challenge_no }"
																	name="challenge_no">
															</div>
															<div class="form-group text-center text-md-right mt-3">
																<button type="submit"
																	class="button button--active button-review">Submit
																	Now</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group1">
								
								

								<c:if test="${count==3 && compare<0}">

									<a href="../challenge/challenge_room_update.do?challenge_no=${vo.challenge_no }"
										class="btn btn-basic2 btn-basic2">도전 수정하기</a>&nbsp;
								</c:if>
								<c:if test="${count==3 && compare>=0}">

									<a href="" class="btn btn-basic2">도전 수정 불가</a>&nbsp;
								<h4 align="center">도전이 이미 시작되었습니다.</h4>&nbsp;
								
							</c:if>
								<c:if test="${count==3 && compare<0}">

									<a
										href="../challenge/challenge_room_delete.do?challenge_no=${vo.challenge_no }&poster=${vo.poster}"
										class="btn btn-basic2">도전 삭제하기</a>&nbsp;
								
							</c:if>
								<c:if test="${count==3 && compare>=0}">

									<a href="" class="btn btn-basic2">도전 삭제 불가</a>&nbsp;
								<h4 align="center">도전이 이미 시작되었습니다.</h4>

								</c:if>

							</div>
							<!-- /input-group -->

						</aside>
						<aside class="single_sidebar_widget author_widget">
							<h3 class="widget_title">현재 참여중인 인원</h3>
							<c:forEach var="vo" items="${rank_list}">
								<table class="challengeRankIndex" cellpadding="10">
									<c:if test=""></c:if>
									<tr>
										<td><img src="../challenge/rank1.png" width=40 height=40></td>
										<td>${vo.challenge_id }(횟수:${vo.certified_no})
										<td>
									</tr>
									<tr>
										<td><img src="../challenge/rank2.png" width=40 height=40>
										<td>${vo.challenge_id }(횟수:${vo.certified_no})
										<td></td>
									</tr>
									<tr>
										<td><img src="../challenge/rank3.png" width=40 height=40>
										<td>${vo.challenge_id }(횟수:${vo.certified_no})
										<td></td>
									</tr>
								</table>
							</c:forEach>


							<!-- 									<table cellpadding="10"> -->
							<%-- 										<c:forEach var="vo" items="${rank_list}"> --%>
							<!-- 											<tr> -->
							<%-- 												<td>${vo.challenge_id }(횟수 :${vo.certified_no}) --%>
							<!-- 												<td> -->
							<!-- 											</tr> -->
							<%-- 										</c:forEach> --%>

							<%-- 										<c:if test="${rank_list.size()<3}"> --%>
							<!-- 											<tr> -->
							<%-- 												<c:forEach var="i" begin="${rank_list.size()}" end="2"> --%>
							<!-- 													<td>순위없음</td> -->
							<%-- 												</c:forEach> --%>
							<!-- 											</tr> -->
							<%-- 										</c:if> --%>
							<!-- 									</table> -->
							<!-- 													<h4>Charlie Barber</h4> -->
							<!-- 													<p>Senior blog writer</p> -->
							<!-- 													<div class="social_icon"> -->
							<!--                               <a href="#"> -->
							<!--                                   <i class="fab fa-facebook-f"></i> -->
							<!--                               </a> -->
							<!--                               <a href="#"> -->
							<!--                                   <i class="fab fa-twitter"></i> -->
							<!--                               </a> -        ->
<!--                               <a href="#"> -->
							<!--                                   <i class="fab fa-github"></i> -->
							<!--                               </a> -->
							<!--                               <a href="#"> -->
							<!--                                 <i class="fab fa-behance"></i> -->
							<!--                               </a> -->
							<!--                           </div> -->
							<!-- 													<p>Boot camps have its supporters andit sdetractors. Some people do not understand why you should -->
							<!-- 															have to spend money on boot camp when you can get. Boot camps have itssuppor ters andits -->
							<!-- 															detractors. -->
							<!-- 													</p> -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">현재 참여중인 인원</h3>
							<!-- 방 참여 중인 사람 보여주려는 부분 -->

							<p>
							<div style="overflow-y: auto; height: 200px">
								<c:forEach var="people_list" items="${ people_list}">
									<div class="media post_item">
										<div class="media-body">
											<div>
												<h3>${people_list.challenge_id }</h3>
												<p>02 Hours ago</p>
											</div>
										</div>
										<c:if test="${count==3 }">
											<a
												href="../challenge/kick_out.do?challenge_no=${vo.challenge_no }&challenge_id=${people_list.challenge_id}"
												class="btn btn-sm btn-danger">강퇴하기</a>
										</c:if>
									</div>
								</c:forEach>
							</div>
							<div class="br"></div>
						</aside>
						<!-- 						<aside class="single_sidebar_widget ads_widget"> -->
						<!-- 							<a href="#"> <img class="img-fluid" src="img/blog/add.jpg" -->
						<!-- 								alt=""> -->
						<!-- 							</a> -->
						<!-- 							<div class="br"></div> -->
						<!-- 						</aside> -->
						<!-- 						<aside class="single_sidebar_widget post_category_widget"> -->
						<!-- 							<h4 class="widget_title">Post Catgories</h4> -->
						<!-- 							<ul class="list cat-list"> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Technology</p> -->
						<!-- 										<p>37</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Lifestyle</p> -->
						<!-- 										<p>24</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Fashion</p> -->
						<!-- 										<p>59</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Art</p> -->
						<!-- 										<p>29</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Food</p> -->
						<!-- 										<p>15</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Architecture</p> -->
						<!-- 										<p>09</p> -->
						<!-- 								</a></li> -->
						<!-- 								<li><a href="#" class="d-flex justify-content-between"> -->
						<!-- 										<p>Adventure</p> -->
						<!-- 										<p>44</p> -->
						<!-- 								</a></li> -->
						<!-- 							</ul> -->
						<!-- 							<div class="br"></div> -->
						<!-- 						</aside> -->
						<!-- 						<aside class="single-sidebar-widget newsletter_widget"> -->
						<!-- 							<h4 class="widget_title">Newsletter</h4> -->
						<!-- 							<p>Here, I focus on a range of items and features that we use -->
						<!-- 								in life without giving them a second thought.</p> -->
						<!-- 							<div class="form-group d-flex flex-row"> -->
						<!-- 								<div class="input-group"> -->
						<!-- 									<div class="input-group-prepend"> -->
						<!-- 										<div class="input-group-text"> -->
						<!-- 											<i class="fa fa-envelope" aria-hidden="true"></i> -->
						<!-- 										</div> -->
						<!-- 									</div> -->
						<!-- 									<input type="text" class="form-control" -->
						<!-- 										id="inlineFormInputGroup" placeholder="Enter email address" -->
						<!-- 										onfocus="this.placeholder = ''" -->
						<!-- 										onblur="this.placeholder = 'Enter email'"> -->
						<!-- 								</div> -->
						<!-- 								<a href="#" class="bbtns">Subcribe</a> -->
						<!-- 							</div> -->
						<!-- 							<p class="text-bottom">You can unsubscribe at any time</p> -->
						<!-- 							<div class="br"></div> -->
						<!-- 						</aside> -->
						<aside class="single-sidebar-widget tag_cloud_widget"></aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->


	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="insta_btn">
				<a class="btn theme_btn" href="#">Follow us on instagram</a>
			</div>
			<div class="instagram_image row m0">
				<a href="#"><img src="img/instagram/ins-1.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-2.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-3.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-4.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-5.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-6.jpg" alt=""></a>
			</div>
		</div>
	</section>
</body>
</html>
이게진짜
