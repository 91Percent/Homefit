<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aroma Shop - Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"> 
var i;
$(function(){
      $('.tutor_qna').click(function(){
         var coach_no = $(this).attr("data-value");
         console.log('코치 번호'+coach_no)
         $.ajax({
             type:'post',
             url:'../coach/coach_qna.do?coach_no='+coach_no,
             success:function(result)
             {
                $('.qna_list').html(result);
             }
          })
      });

//       $(function(){
//     	    $.ajax({
//     	       type:'post',
//     	       url:'../coach/listlist.do',
//     	       success:function(result)
//     	       {
//     	          $('.list_info').html(result);
//     	       }
//     	    })
//     });
}); 


setInterval(function(){
	  $(".blinkEle").toggle();
	}, 550);
</script>
<style type="text/css">
.row1 {
   margin: 0px auto;
   width:700px;
}
.btd {
  font-size: 8pt;
}
</style>
</head>
<body>
	<section class="section-margin calc-60px"> 
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>코치에게 <span class="section-intro__style">물어보자!</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
		<c:forEach var="vo" items="${list}">
          <div class="card text-center card-product">
            <div class="card-product__img" style="border:1px solid;" >
                <a href="#" class="tutor_qna" data-value="${vo.coach_no}"><img  src="${vo.coach_poster}" alt="" width="130" height="250" border="5px">
                <strong>${vo.coach_name }</strong>
                </a>
            </div>
            <div class="card-body">
<%--               <h4 class="card-product__title">${c }</h4> --%>
<%--               <p class="card-product__price">${p}</p> --%>
            </div>
          </div>
		</c:forEach>
          </div>
        </div>
<!-- 		<p align="center"><span class="blinkEle">튜터를 클릭해 주세요!</span></p> -->
		
		<div class="qna_list">
		</div>
        </section>
</body>
</html>