<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let request=new Request();
	let strdayParam = request.getParameter("strday");
	
	
});


</script>
<body>
<h3 id="myproofdate">ss</h3>
<c:forEach var="vo" items="${cfList }">
					<table class="table">
                      <thead>
                          <tr>
                          	  <th scope="col" class="mychallengeno1">NO</th>
                              <th scope="col">POSTER</th>
                              <th scope="col">ROOM</th>
                              <th scope="col">DATE</th>
                              <th scope="col" class="mychallengeno2">ID</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                          <!-- NO -->
                          	<td>${vo.mylist_no }</td>
                          <!-- 포스터 -->
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                          <img src="${vo.poster }">
                                      </div>
                                  </div>
                              </td>
                          <!-- date -->
                              <td>
                                  <h5>${vo.certified_date }</h5>
                              </td>
                          <!-- room -->
                              <td>
                                  <div class="product_count">
                                     <h5></h5>
                                  </div>
                              </td>
                          <!-- ID -->
                              <td>
                                  <h5>${vo.challenge_id }</h5>
                              </td>
                          </tr>
                      </tbody>
                  </table>
                  </c:forEach>
</body>
</html>