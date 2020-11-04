<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let check;
	$(function() {
		$('.check-all').click(function() {
			$('.chk').prop('checked', this.checked);
		});

		$('.chk').click(function() {
			$('.check-all').prop('checked', false);
		});
		$(document).on("click","#allBtn",function(){
			// 체크박스의 선택여부 확인 => radio
			let len = $('.chk:checked').length;
			if (len == 0) {
				alert("승인할 대상을 선택하세요!!");
			} else {
				$('#frm').submit();//submit효과 => form태그의 action에등록 파일로 데이터 전송
			}
		});
});

</script>
<style>
.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 8px 14px;
  font-size: 10px;
  cursor: pointer;
}
#allBtn {
  border-color: #DB7093;
  color: Purple;
}

#allBtn:hover {
  background: #FFB6C1;
  color:Purple;
}
</style>
</head>
<body>
<!-- 	<!-- ================ start banner area ================= -->
<!-- 	<section class="blog-banner-area" id="blog"> -->
<!-- 		<div class="container h-100"> -->
<!-- 			<div class="blog-banner"> -->
<!-- 				<div class="text-center"> -->
<!-- 					<h1>My page</h1> -->
<!-- 					<nav aria-label="breadcrumb" class="banner-breadcrumb"> -->
<!-- 						<ol class="breadcrumb"> -->
<!-- 							<li class="breadcrumb-item"><a href="#">제발</a></li> -->
<!-- 							<li class="breadcrumb-item active" aria-current="page">되라</li> -->
<!-- 						</ol> -->
<!-- 					</nav> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<!-- ================ end banner area ================= -->

<!-- 	<section class="blog_area"> -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-2"> -->
<!-- 				<div class="blog_right_sidebar"> -->
<!-- 					<aside class="single_sidebar_widget post_category_widget"> -->
<!-- 						<div class="section-intro pb-60px"> -->
<!-- 							<h2> -->
<!-- 								<span class="section-intro__style">My Menu</span> -->
<!-- 							</h2> -->
<!-- 						</div> -->
<!-- 						<ul class="list cat-list"> -->
<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
<!-- 									<p>내 정보 수정</p> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
<!-- 									<p>장바구니</p> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
<!-- 									<p>코치 예약</p> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
<!-- 									<p>참여중인 도전</p> -->
<!-- 							</a></li> -->
<!-- 							<li> -->
<!-- 							<a class="d-flex justify-content-between" style="cursor:pointer" onclick="pgchange();" id="soo"> -->
<!-- 									홈트 즐겨찾기 -->
<!-- 							</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</aside> -->

<!-- 				</div> -->
<!-- 			</div> -->
			<div class="col-lg-8">
				<div class="blog_left_sidebar">
					<article class="row blog_item">
						<div class="col-lg-12">
							<div class="blog_post">
								<div class="blog_details">
									<input type="checkbox" name="all" class="check-all"><label>전체선택</label>
										 <input type="button" class="btn" id="allBtn" value="삭제" />
									<form id="frm" method="post" action="../ex/ex_all_ok.do">
										<table class="table">
											<tr>
												<th scope="col">Image</th>
												<th scope="col">level</th>
												<th scope="col"></th>
											</tr>
											<c:forEach var="vo" items="${list }">

												<tbody>
													<tr>
														<td><input type="checkbox" value="${vo.home_no }"
															class="chk" name="chk"> <img src="${vo.poster }"
															alt="" width=120 height=80></td>
														<td>
															<div class="media">
																<ul>
																	<i class="ti-comments-smiley"></i>${vo.home_level }</ul>
																<p><br>
																	<a href="ex_detail.do?home_no=${vo.home_no}">&nbsp;${vo.subject }</a>
																</p>
															</div>
														</td>
														
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</form>
								</div>
							</div>
						</div>
					</article>

				</div>
			</div>
		</div>
	</section>

	<!-- 	<section class="section-margin--small mb-5"> -->
	<!-- 		<div class="container" > -->
	<!-- 				<div class="blog_right_sidebar col-xl-3 col-lg-3 col-md-4" > -->
	<!-- 					<div class="section-intro pb-60px"> -->
	<!-- 						<h2> -->
	<!-- 							<span class="section-intro__style">My Menu</span> -->
	<!-- 						</h2> -->
	<!-- 					</div> -->
	<!-- 					<aside class="single_sidebar_widget post_category_widget" > -->
	<!-- 						<ul class="list cat-list"> -->
	<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
	<!-- 									<p>회원 정보 수정</p> -->
	<!-- 							</a></li> -->
	<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
	<!-- 									<p>장바구니</p> -->
	<!-- 							</a></li> -->
	<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
	<!-- 									<p>예약 정보 확인</p> -->
	<!-- 							</a></li> -->
	<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
	<!-- 									<p>참여한 챌린지</p> -->
	<!-- 							</a></li> -->
	<!-- 							<li><a href="#" class="d-flex justify-content-between"> -->
	<!-- 									<p>즐겨찾기 한 운동</p> -->
	<!-- 							</a></li> -->

	<!-- 						</ul> -->
	<!-- 					</aside> -->
	<!-- 				</div> -->
	<!-- 				</div> -->
	<!-- 			</section> -->

	<!-- 					<div class="container" > -->
	<!-- 							<div class="table-responsive " id="soo3"> -->
	<!-- 								<table class="table"> -->
	<!-- 									<thead> -->
	<!-- 										<tr> -->
	<!-- 											<p> -->
	<!-- 												<input type="checkbox" name="all" class="check-all"><label>전체 -->
	<!-- 													선택</label> -->
	<!-- 											</p> -->
	<!-- 											<th scope="col">&nbsp;&nbsp;&nbsp;Image</th> -->
	<!-- 											<th scope="col">level</th> -->
	<!-- 											<th scope="col"></th> -->
	<!-- 										</tr> -->
	<!-- 									</thead> -->
	<%-- 									<c:forEach var="vo" items="${list }"> --%>

	<!-- 										<tbody> -->
	<!-- 											<tr> -->
	<!-- 												<td> -->
	<%-- 													<input type="checkbox" value="${vo.home_no }" class="chk" name="chk"> --%>
	<%-- 														<img src="${vo.poster }" alt="" width=120 height=80> --%>
	<!-- 												</td> -->
	<!-- 												<td> -->
	<!-- 													<div class="media"> -->
	<%-- 													<ul><i class="ti-comments-smiley"></i>${vo.home_level }</ul> --%>
	<%-- 														<pre><a href="ex_detail.do?home_no=${vo.home_no}">    ${vo.subject }</a></pre> --%>
	<!-- 													</div> -->
	<!-- 												</td> -->
	<!-- 												<td> -->
	<!-- 												<input type="button" class="img_btn" id="allBtn" value="삭제"> -->
	<!-- 												 <form id="frm" method="post" action="../ex/ex_all_ok.do"></form> -->
	<!-- 												</td> -->
	<!-- 											</tr> -->
	<!-- 										</tbody> -->
	<%-- 									</c:forEach> --%>
	<!-- 								</table> -->
	<!-- 							</div> -->
	<!-- 					</div> -->
	<!-- 					</div> -->
	<!-- 				</section> -->

	<!-- 				        <div class="col-xl-9 col-lg-8 col-md-7"> -->
	<!-- 				           <input type="button" class="btn btn-xs btn-primary" id="allBtn" value="전체 삭제"/> -->
	<!-- 				         <input type="button" class="img_btn" id="allBtn" value="삭제"> -->
	<!-- 						  <form id="frm" method="post" action="../ex/ex_all_ok.do"> -->
	<!-- 					        <p><input type="checkbox" name="all" class="check-all"><label>전체 선택</label></p> -->
	<!-- 				        <div class="row"> -->
	<%-- 				        <c:forEach var="vo" items="${list }"> --%>
	<!-- 				          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
	<!-- 				            <div class="card card-blog"> -->
	<!-- 				              <div class="card-blog__img"> -->
	<%-- 				              <input type="checkbox" value="${vo.home_no }" class="chk" name="chk"> --%>
	<%-- 				                <img class="card-img rounded-0" src="${vo.poster }" alt="" width=120 height=250> --%>
	<!-- 				              </div> -->
	<!-- 				              <div class="card-body"> -->
	<!-- 				                <ul class="card-blog__info"> -->
	<%-- 				                  <li>${vo.focus}</li> --%>
	<%-- 				                  <li><i class="ti-comments-smiley"></i>${vo.home_level }</li> --%>
	<!-- 				                </ul> -->
	<%-- 				                <h4 class="card-blog__title"><a href="ex_detail.do?home_no=${vo.home_no}">${vo.subject }</a></h4> --%>
	<!-- 				              </div> -->
	<!-- 				            </div> -->
	<!-- 				          </div> -->
	<!-- 				          <table> -->
	<!-- 					     <tr> -->

	<!-- 				            </tr> -->
	<!-- 				         </table> -->
	<!-- 				         </li> -->
	<%-- 					    </c:forEach> --%>

	<!-- 					    </div> -->
	<!-- 					    </form> -->
	<!-- 				        </div> -->
</body>
</html>