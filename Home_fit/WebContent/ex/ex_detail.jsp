<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
   <!-- ================ start banner area ================= -->   
   <section class="blog-banner-area" id="blog">
      <div class="container h-100">
         <div class="blog-banner">
            <div class="text-center">
               <h1>${vo.subject }</h1>
               <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">HomeTraining</a></li>
              <li class="breadcrumb-item active" aria-current="page">1조와 함께하는 홈트레이닝 </li>
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
                     <img class="img-fluid" src="${vo.poster }" alt="">
                  </div>
               </div>
            </div>
            
            <div class="col-lg-5 offset-lg-1" >
               <div class="s_product_text" >
                  <h2>${vo.subject}</h2>
                  <h4>${vo.home_level}</h4> 
                  <h5>사용 근육 : ${vo.muscle }</h5>
                  <h5>초점 : ${vo.focus }</h5>
                  <h5>필요한 도구 : ${vo.equipment }</h5>
                  <p>팁: ${vo.tip }</p>
                  	<c:if test="${count==0 }">
					<div class="card_area d-flex align-items-center">
                     <a class="icon_btn" href="../ex/ex_favorite.do?home_no=${vo.home_no }"><i class="ti-heart"></i></a>즐겨찾기 등록
                  </div>
                  </c:if>
                  </div>
					</div>
				</div>
               </div>
            </div>
         </div>
      </div>
   <!--================End Single Product Area =================-->
<!--  <section class="blog"> -->
<!--       <div class="container"> -->
<!--         <div class="section-intro pb-60px"> -->
<!--           <h2>함께 따라해보는 <span class="section-intro__style">자세</span></h2> -->
<%--            <c:forTokens var="c" items="${vo.step_no }" delims="|" varStatus="status" > --%>
<%--            ${c }  --%>
           
<%--              <c:forTokens var="p" items="${vo.step_content }" delims="|"  begin="${status.index }" end="${status.index }">  --%>
<%--              ${p } <br>  --%>
             
<%--              <c:forTokens var="a" items="${vo.step_image }" delims="|"  begin="${status.index }" end="${status.index }">  --%>
<%--              ${a } <br>  --%>
<%--              </c:forTokens> --%>
<%--             </c:forTokens> --%>
<%--         </c:forTokens> --%>
<!--         </div> -->

<%--       <c:forTokens var="c" items="${vo.step_no }" delims="|" varStatus="status" > --%>
<%--         <c:forTokens var="p" items="${vo.step_content }" delims="|"  begin="${status.index }" end="${status.index }"> --%>
<%--         <c:forTokens var="a" items="${vo.step_image }" delims="|"  begin="${status.index }" end="${status.index }"> --%>
<!--         <div class="row"> -->
<!--           <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
<!--             <div class="card card-blog"> -->
<!--               <div class="card-blog__img"> -->
<%--                 <img class="card-img rounded-0" src="https://${a }" alt=""> --%>
<%--              </c:forTokens> --%>
              
<!--               <div class="card-body"> -->
<!--                 <h4 class="card-blog__title"> -->
<%--                       ${c }  </h4> --%>
<%--                 <p> ${p }</p> --%>
<!--                 </div> -->
<!--               </div> -->
<!--           </div> -->
<!--           </div> -->
<!--          </div> -->
<%--           </c:forTokens> --%>
<%--            </c:forTokens> --%>
<!--     </section>  -->

<!-- 이미지 카드 형식 -->
<!-- <section class="section-margin calc-60px"> -->
<!--       <div class="container"> -->
<!--         <div class="section-intro pb-60px"> -->
<!--           <h2>함께 따라하는  <span class="section-intro__style">자세</span></h2> -->
<!--         </div> -->
<!--         <div class="row"> -->
<%--         <c:forTokens var="c" items="${vo.step_no }" delims="|" varStatus="status" > --%>
<%--         <c:forTokens var="p" items="${vo.step_content }" delims="|"  begin="${status.index }" end="${status.index }">  --%>
<%--         <c:forTokens var="a" items="${vo.step_image }" delims="|"  begin="${status.index }" end="${status.index }"> --%>
<!--           <div class="col-md-6 col-lg-4 col-xl-3"> -->
<!--             <div class="card text-center card-product"> -->
<!--               <div class="card-product__img"> -->
<%--                 <img class="card-img" src="https://${a}" alt=""> --%>
<!--               </div> -->
<!--               <div class="card-body"> -->
<%--                 <h4 class="card-product__title">${c }</h4> --%>
<%--                 <p class="card-product__price">${p }</p> --%>
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<%--           </c:forTokens> --%>
<%--          </c:forTokens> --%>
<%--         </c:forTokens> --%>
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->

<!--  <!-- 이미지 무한 루프 -->  
<!--       <section class="section-margin calc-60px"> -->
<!--       <div class="container"> -->
<!--         <div class="section-intro pb-60px"> -->
<!--           <h2>함께 따라하는 <span class="section-intro__style">동작</span></h2> -->
<!--         </div> -->
<!--         <div class="owl-carousel owl-theme" id="bestSellerCarousel"> -->
<%--         <c:forTokens var="c" items="${vo.step_no }" delims="|" varStatus="status" >  --%>
<%--          <c:forTokens var="p" items="${vo.step_content }" delims="|"  begin="${status.index }" end="${status.index }">  --%>
<%--          <c:forTokens var="a" items="${vo.step_image }" delims="|"  begin="${status.index }" end="${status.index }">  --%>
<!--           <div class="card text-center card-product"> -->
<!--             <div class="card-product__img"> -->
<%--               <img class="img-fluid" src="https://${a }" alt=""> --%>
<!--             </div> -->
<!--             <div class="card-body"> -->
<%--               <h4 class="card-product__title">${c }</h4> --%>
<%--               <p class="card-product__price">${p}</p> --%>
<!--             </div> -->
<!--           </div> -->
        
<%--          </c:forTokens> --%>
<%--          </c:forTokens> --%>
<%--         </c:forTokens> --%>
<!--           </div> -->
<!--         </div> -->
<!--         </section> -->

<section class="cart_area">
      <div class="container">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">StepNumber</th>
                              <th scope="col">Content</th>
                              <th scope="col"></th>
                          </tr>
                      </thead>
                     
                       <c:forTokens var="c" items="${vo.step_no }" delims="|" varStatus="status" >
        <c:forTokens var="p" items="${vo.step_content }" delims="|"  begin="${status.index }" end="${status.index }"> 
        <c:forTokens var="a" items="${vo.step_image }" delims="|"  begin="${status.index }" end="${status.index }">
                      <tbody>
                          <tr>
                             <td>
                                 <h5>${c }</h5>
                              </td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${a }" alt="" width=250 height=300>
                                      </div>
                                      <div class="media-body">
                                          <p>${p }</p>
                                      </div>
                                  </div>
                              </td>
                          </tr>
                             </c:forTokens>
                        </c:forTokens>
                       </c:forTokens>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>


</body>
</html>