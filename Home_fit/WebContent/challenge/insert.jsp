<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home Fit - Let's Challenge Together</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
//달력 include
$(function(){
	$.ajax({
		type:'post',
		url:'../challenge/calendar.do',
		success:function(result)
		{
			$('#calendar_table').html(result);
		}
	}); 
})		
</script>
</head>	
<body>	
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>함께 도전해요</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<!-- <li class="breadcrumb-item"><a href="#">Home</a></li> -->
							<li class="breadcrumb-item active" aria-current="page">새로운 도전 만들기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!--================Checkout Area =================-->
	<section class="checkout_area section-margin--small">
		<div class="container">
			<form method="post" action="../challenge/insert_ok.do"
				enctype="multipart/form-data">
				<div class="billing_details">
					<div class="row">
						<table class="table table-hover">
							<tr>
								<th class="danger text-right" width=30%>등록일</th>
								<td width=85%><fmt:formatDate value="${toDay}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<th class="danger text-right" width=30%>아이디</th>
								<td width=85%>${sessionScope.id }</td>
							</tr>
							<tr>
								<th class="danger text-right" width=30%>카테고리</th>
								<td width=85%><select NAME=cate SIZE=1
									class="country_select">
										<option value=food>food</option>
										<option VALUE=exercise>exercise</option>
										<option VALUE=etc>etc</option>
								</select></td>
							</tr>
							<tr>
								<th class="danger text-right" width=30%>대표 사진</th>
								<td width=70%><input type=file name=upload size=20
									class="input-sm" title="사진 파일만 업로드 가능합니다.">
								</td>
							</tr>
							<tr>
								<th class="danger text-right" width=30%>방 제목</th>
								<td width=70%>
									<input type="text" class="form-control title"
										id="title" name="title" placeholder="방제목을 입력하세요" maxlength="50"> 
									<span> * 50자 이내로 입력하세요(<span id='title-length'>0</span>/50)</span>
								</td>
							</tr>
							<div class="row">
							<div id="calendar_table">

							</div>
							</div>
							<tr>
								<th class="danger text-right" width=30%>도전 가능 인원</th>
								<td width=70%><input type="number" class="form-control"
									id="limit" name="limit" min="1" placeholder="제한 인원수를 작성하세요"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /> <span
									style="color: #aaa;" id="counter"> * 숫자만 입력가능합니다. </span></td>
							</tr>


							<tr>
								<th class="danger text-right" width=30%>도전소개글</th>
								<td width=70%><textarea class="form-control" name="content"
										id="content" rows="10" placeholder="소개글을 입력하세요"></textarea></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center"><input type=submit
									value="도전 만들기" class="btn btn-sm btn-primary"> <input
									type=button value="취소하기" class="btn btn-sm btn-primary"
									onclick="javascript:history.back()"></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
		</div>
</body>
</html>