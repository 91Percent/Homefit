<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.CoachModel"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i;
$(function(){
      $('.pixel-radio').click(function(){
          id_check = $(this).attr("id");
         if(id_check=='YOGA')
            i='72';      
         else if(id_check=='Pilates')
            i='73';
         else if(id_check=='G.X')
            i='74';
         else
            i='71';
         // id값 가져와서 비교하지말고 value 값을 불러와서 그냥 넣어주는게 코드가 더 간결할듯..
         $.ajax({
             type:'post',
             url:'../coach/listlist.do?cateno='+i,
             success:function(result)
             {
                $('.list_info').html(result);
             }
          });
      });
      $(function(){
    	    $.ajax({
    	       type:'post',
    	       url:'../coach/listlist.do',
    	       success:function(result)
    	       {
    	          $('.list_info').html(result);
    	       }
    	    });
    });
     $('#PT').trigger("click");
     $('#keyword').keyup(function(){
 		let k=$('#keyword').val(); 
 		$('#coach-table > div.row > list_info').hide();
 		let temp=$('#coach-table > div.row > list_info:nth-child(2n+2):contains("'+k+'")');
 		$(temp).parent().show();
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

	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">전체 카테고리</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="PT" name="brand"><label for="PT">P.T<span>(89)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="YOGA" name="brand"><label for="YOGA">YOGA<span> (20)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="Pilates" name="brand"><label for="Pilates">Pilates<span> (35)</span></label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="G.X" name="brand"><label for="G.X">G.X<span> (34)</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>

        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div>
              <div class="input-group filter-bar-search">
                <input type=text id="Keyword" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
       	<section class="lattest-product-area pb-40 category-list" id="coach-table">
    	<div class="row">
          <div class="list_info">
          
          	<!--코치 데이터 출력 위치 -->
          
          	</div>
         </div>
     	</section>
          <!-- End Best Seller -->
          </div>
        </div>
      </div>
  </section>
	<!-- ================ category section end ================= -->		  


    
    <!-- 페이지 바 -->

</body>
</html>


