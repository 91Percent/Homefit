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
            <div class="row">
            <c:forEach var="vo" items="${list }">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="${vo.poster }" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button onclick="location.href='detail.do?home_no=${vo.home_no }'"><i class="ti-search"></i></button></li>
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
                    <a href="detail.do?home_no=${vo.home_no }"><p>${vo.subject }</p></a>
                  </div>
                </div>
              </div>
              </c:forEach>
              </div>
             
              
 	          </section>
             
</body>
</html>
