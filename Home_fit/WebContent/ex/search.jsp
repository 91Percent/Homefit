<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
$(function(){
	$('.page-item').click(function(){
		var page = $(this).attr("page");
		var sub=k;
	 $.ajax({
		 type:'post',
		 url:'../ex/search.do?subject='+k+'&page='+page,
		 success:function(result)
		 {
			 $('.category-list').html(result);
		 }
	 });
	 
});
});
</script>
<style>
#sooborder {
 border: 2px dashed ;
 border-color:#ADD8E6;
}
</style>
</head>
<body>
            <div class="row row2">
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.poster }" alt="" id="soofilter">
                    <ul class="card-product__imgOverlay">
                      <li><button onclick="location.href='ex_detail.do?home_no=${vo.home_no }'"><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                  <p>
                  <c:if test="${vo.home_no<365 }">
                   weight
                  </c:if>
                   <c:if test="${vo.home_no<550 && vo.home_no>365}">
                   yoga
                  </c:if>
                   <c:if test="${vo.home_no>550 }">
                   pilates
                  </c:if>
                  </p>
                    <a href="ex_detail.do?home_no=${vo.home_no }"><p>${vo.subject }</p></a>
                  </div>
                </div>
              </div>
              </c:forEach>
              </div>
              <nav class="blog-pagination justify-content-center d-flex">
                          <ul class="pagination">
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item">
                                  <a class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                              </c:if>
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i==curpage }">
                              <li class="page-item active" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              <c:if test="${i!=curpage }">
                              	<li class="page-item" page="${i}">
                                  <a class="page-link">${i }</a>
                              </li>
                              </c:if>
                              </c:forEach>
                              <c:if test="${endPage<totalpage }">
                              <li class="page-item">
                                  <a class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                            </c:if>
                          </ul>
                      </nav>      
                      </div>
              </div>  
</body>
</html>
