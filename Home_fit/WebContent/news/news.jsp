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
  <!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>Health News</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Health</a></li>
              <li class="breadcrumb-item active" aria-current="page">News</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->

<!-- <section class="blog"> -->
<!--       <div class="container"> -->
<!--         <div class="section-intro pb-60px"> -->
<!--           <h2>Health <span class="section-intro__style">News</span></h2> -->
<!--         </div> -->

<!--         <div class="row"> -->
<%--         <c:forEach var="vo" items="${nList }"> --%>
<!--           <div class="col-md-6 col-lg-4 mb-4 mb-lg-0"> -->
<!--             <div class="card card-blog"> -->
<!--               <div class="card-blog__img"> -->
<%--                 <img class="card-img rounded-0" src="${vo.poster }" alt="" width=120 height=250> --%>
<!--               </div> -->
<!--               <div class="card-body"> -->
<!--                 <ul class="card-blog__info"> -->
<%--                   <li>${vo.author }</li> --%>
<%--                   <li><i class="ti-comments-smiley"></i>${vo.news_date }</li> --%>
<!--                 </ul> -->
<%--                 <h4 class="card-blog__title"><a href="detail.do?no=${vo.no}">${vo.title }</a></h4> --%>
<%--                 <p>${vo.content }</p> --%>
<!--                 <a class="card-blog__link" href="detail.do?no=${vo.no}">더 보기..<i class="ti-arrow-right"></i></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<%-- 	    </c:forEach> --%>

<section class="cart_area">
      <div class="container">
      <div class="section-intro pb-60px">
          <h2>Health <span class="section-intro__style">News</span></h2>
        </div>
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">journalist</th>
                              <th scope="col" >cover line</th>
                              <th scope="col"></th>
                          </tr>
                      </thead>
        			 <c:forEach var="vo" items="${nList }">
                      <tbody>
                          <tr>
                         	 <td>
                                 <h5>${vo.author }</h5>
                              </td>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                       <a href="detail.do?no=${vo.no}"><img src="${vo.poster }" alt="" width=180 height=180></a>
                                      </div>
                                      <div class="media-body">
                                          <p>${vo.content }</p>
                                          <a class="card-blog__link" href="detail.do?no=${vo.no}">Read More<i class="ti-arrow-right"></i></a>
                                      </div>
                                  </div>
                              </td>
                          </tr>
                             </c:forEach>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
	    <nav class="blog-pagination justify-content-center d-flex"> 
                          <ul class="pagination" text-align="center">
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item">
                                  <a href="../news/news.do?page=${startPage-1 }" class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="page-item active">
                                  <a href="../news/news.do?page=${i}" class="page-link">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page-item">
                                  <a href="../news/news.do?page=${i} " class="page-link">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li class="page-item">
                                  <a href="../news/news.do?page=${endPage+1 }" class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
                          </ul>
                      </nav>
        </div>
      </div>
    </section>
 
  </div>
</body>
</html>