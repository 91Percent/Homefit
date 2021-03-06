<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
$(function(){
	$('#gogo').click(function(){
		let before_limit=$('#limit').attr("value"); //기존 방 설정 limit
		let limit=$('#limit').val(); //입력받은 limit
		if(limit<before_limit)
		{
			$('#limit').focus();
			$('#limit_text').text('*도전가능인원은 현재 참여하고 있는인원보다 많아야합니다*')
		}
		else
		{
			$('#frm').submit();
		}
	})
});

// $(function(){
// 	$('#gogo').click(function(){
// 		let id=$('#id').val();
// 		if(id.trim()=="")
// 		{
// 			$('#id').focus();
// 			return;
// 		}
		
// 		// 비밀번호
// 		let pwd=$('#pwd').val();
// 		if(pwd.trim()=="")
// 		{
// 			$('#pwd').focus();
// 			return;
// 		}
		
// 		let pwd1=$('#pwd1').val();
// 		if(pwd1.trim()=="")
// 		{
// 			$('#pwd1').focus();
// 			return;
// 		}
		
// 		if(pwd!==pwd1)
// 		{
// 			alert("비밀번호를 다시 입력하세요!!");
// 			$('#pwd1').val("");
// 			$('#pwd1').focus();
// 			return;
// 		}
		
// 		let name=$('#name').val();
// 		if(name.trim()=="")
// 		{
// 			$('#name').focus();
// 			return;
// 		}
		
// 		let birthday=$('#birthday').val();
// 		if(birthday.trim()=="")
// 		{
// 			$('#birthday').focus();
// 			return;
// 		}
		
// 		let post=$('#post').val();
// 		if(post.trim()=="")
// 		{
// 			$('#post').focus();
// 			return;
// 		}
		
// 		let addr1=$('#addr1').val();
// 		if(addr1.trim()=="")
// 		{
// 			$('#addr1').focus();
// 			return;
// 		}
		
// 		let content=$('#content').val();
// 		if(content.trim()=="")
// 		{
// 			$('#content').focus();
// 			return;
// 		}
		
// 		// 데이어 전송 
// 		$('#joinfrm').submit();
// 	});
// });
</script>
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
              <li class="breadcrumb-item active" aria-current="page">도전  수정 만들기</li>
            </ol>
         			</nav>
				</div>
			</div>
    	</div>	
	</section>	
	
  <!--================Checkout Area =================-->
  <section class="checkout_area section-margin--small">
    <div class="container">
  		  <form method="post" action="../challenge_room/update_ok.do" enctype="multipart/form-data" id="frm">
  		<div class="billing_details">
            <div class="row">
	  		<table class="table table-hover">
	  			<tr>
			       <th class="danger text-right" width=30%>등록일</th>
			       <td width=85%>
			         <fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />
			       </td>
			     </tr>
	  			<tr>
			       <th class="danger text-right" width=30%>카테고리</th>
			       <td width=85%> 현재 방의 카테고리 : ${vo.cate }
			         <select NAME=cate SIZE=1 class="country_select">
				        <option value=food>food</option>
				        <option VALUE=exercise>exercise</option>
				        <option VALUE=etc>etc</option>
				    </select>
			       </td>
			     </tr>
	  			<tr>
					<%-- <a href="../challenge/download.jsp?poster=${vo.poster}">${vo.poster }</a> --%>
			       <th class="danger text-right" width=30% >대표 사진</th>
			       <td width=70% >
			         <input type=file name=poster size=20 class="input-sm" id="photopreview" > 
			       </td>
			     </tr>
			  	<tr>
			  		<th class="danger text-right" width=30% >현재 방 대표 사진<p  style="color:gray;">파일 명 : ${vo.poster}</p></th>
					<td class="here">
					 	<img src="/Home_fit/challenge_poster/${vo.poster}" width=300 height=200>
					</td>
			  	</tr>
			     <tr>
			       <th class="danger text-right" width=30%>방 제목</th>
			       <td width=70%>
			         <input type="text" class="form-control" id="title" name="title" value="${vo.title }">
			         <input type="hidden" value="${vo.challenge_no }" name="challenge_no">
			         <input type="hidden" value="${vo.poster }" name=before_poster>
			       </td>
			     </tr>
 
			     <tr>
			       <th class="danger text-right" width=30%>도전 시작일</th>
			       <td width=70%> 
			         <input type=date name=start_day class="input-sm" id="db_stary_inpt" min=<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /> required>
			         * 오늘 보다 이전의 날짜를 선택할 수 없습니다.
			         <!-- <span class="validity"></span> -->
			       </td>
			     </tr>

			     <tr>
			       <th class="danger text-right" width=30%>도전 종료일</th>
			       <td width=70%>
			         <input type=date name=end_day class="input-sm" min=start_day required>
			       </td>
			     </tr>
					
			     <tr>
			       <th class="danger text-right" width=30% >도전 가능 인원</th>
			       <td width=70%>
			       	 <input type="text" class="form-control" id="limit" name="limit" value="${vo.limit }" >
			       	 <p id="limit_text" style="color:red;"></p>
			       </td>
			     </tr>

			     <tr>
			       <th class="danger text-right" width=30%>도전소개글</th>
			       <td width=70%>
			       		<textarea class="form-control" name="content" id="content" rows="10">${vo.content }</textarea>
			       </td>
			     </tr>

			     <tr>
			       <td colspan="2" class="text-center">
			         <input type=button value="도전 수정하기" class="btn btn-sm btn-primary" id="gogo">
			         <input type=button value="취소하기" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
			       </td>
			     </tr>
	   </table>
	   </div>
	   </div>
	  </form>
  	</div>
  </div>
</body>
</html>