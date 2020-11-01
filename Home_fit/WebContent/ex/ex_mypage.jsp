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

<section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <h2>제발 <span class="section-intro__style">되게해주세요</span></h2>
        </div>

        <div class="row">
        <c:forEach var="vo" items="${list }">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="${vo.poster }" alt="" width=120 height=250>
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li>${vo.focus}</li>
                  <li><i class="ti-comments-smiley"></i>${vo.home_level }</li>
                </ul>
                <h4 class="card-blog__title"><a href="ex_detail.do?home_no=${vo.home_no}">${vo.subject }</a></h4>
              </div>
            </div>
          </div>
	    </c:forEach>
	    </div>
	   </div>
	  </section>

</body>
</html>