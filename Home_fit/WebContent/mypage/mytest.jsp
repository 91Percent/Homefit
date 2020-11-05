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
function pgchange(){
         $.ajax({
            type:'post',
             url:'../ex/ex_mypage.do',
             success:function(result)
             {
                $('.soo').html(result);
             }
         });
}
function coach(){
   $.ajax({
      type:'post',
       url:'../coachreserve/mypage.do',
       success:function(result)
       {
          $('.soo').html(result);
       }
   });
}
function mychallenge(){
	   $.ajax({
	      type:'post',
	       url:'../challenge/myChallengeRoom.do',
	       success:function(result)
	       {
	          $('.soo').html(result);
	       }
	   });
	}


</script>
</head>
<body>
   <!-- ================ start banner area ================= -->
   <section class="blog-banner-area" id="blog">
      <div class="container h-100">
         <div class="blog-banner">
            <div class="text-center">
               <h1>My page</h1>
               <nav aria-label="breadcrumb" class="banner-breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="#">제발</a></li>
                     <li class="breadcrumb-item active" aria-current="page">되라</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </section>
   <!-- ================ end banner area ================= -->

   <section class="blog_area">
      <div class="row">
         <div class="col-lg-2">
            <div class="blog_right_sidebar">
               <aside class="single_sidebar_widget post_category_widget">
                  <div class="section-intro pb-60px">
                     <h2>
                        <span class="section-intro__style">My Menu</span>
                     </h2>
                  </div>
                  <ul class="list cat-list">
                     <li><a class="d-flex justify-content-between" value="1">
                           <p>테스트 페이지</p>
                     </a></li>
                     <li><a class="d-flex justify-content-between">
                           <p>내 정보 수정</p>
                     </a></li>
                     <li><a class="d-flex justify-content-between">
                           <p>장바구니</p>
                     </a></li>
                     <li><a class="d-flex justify-content-between" style="cursor:pointer" onclick="coach();">
                           <p>코치 예약</p>
                     </a></li>
                     <li><a class="d-flex justify-content-between" style="cursor:pointer" onclick="mychallenge();">
                           <p>참여중인 도전</p>
                     </a></li>
                     <li>
                     <a class="d-flex justify-content-between" style="cursor:pointer" onclick="pgchange();">
                           홈트 즐겨찾기
                     </a>
                     </li>
                  </ul>
               </aside>

            </div>
         </div>
         <div class="col-lg-8">
            <div class="blog_left_sidebar">
               <article class="row blog_item">
                  <div class="col-lg-12">
                     <div class="blog_post">  
                        <div class="blog_details soo">
                           <input type="checkbox" name="all" class="check-all"><label>전체
                              선택</label> <input type="button" class="btn" id="allBtn" value="삭제" />
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
                                                <p>
                                                   <a href="ex_detail.do?home_no=${vo.home_no}">&nbsp;${vo.subject }</a>
                                                </p>
                                             </div>
                                          </td>
                                          <td><input type="button" class="img_btn" id="allBtn" value="삭제">
                                             <form id="frm" method="post" action="../ex/ex_all_ok.do"></form>
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

</body>
</html>