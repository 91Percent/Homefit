<%@page import="com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="model" class="com.sist.model.ChallengeModel"/>
<c:set var="filepath" value="/Users/haeni/Documents/WebDev/WebDev1/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/challenge_test/challenge_poster/"/>
<%-- <c:set var="start_day" value="start_day"/>
<c:set var="end_day" value="end_day"/>
<fmt:formatDate value="start_day" pattern="yy-MM-dd"/>
<fmt:formatDate value="end_day" pattern="yy-MM-dd"/> --%>

<%
	model.challengeListData(request);
%>    
    

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">함께 도전해요</h1>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
        
        <div style="padding:5px 0px">
        	<a href="../challenge_room/insert.do" class="btn btn-sm btn-success">도전 만들기</a>
        </div>
        

        <div class="row" style="padding:5px 0px">
		 <c:forEach var="vo" items="${list }">
          <div class="col-lg-4 col-md-6 mb-4">
					
		  	<div class="card h-100">
				<a href="../challenge_room/detail.do"><img class="card-img-top" src="${'../challenge_poster/'+=vo.poster }" alt="" width=300px, height=200px></a>
				  <div class="card-body">
				     <h4 class="card-title">
				      	<a href="../challenge_room/detail.do">${vo.title }</a>
				     </h4>
				     <h5>1명/${vo.limit }명</h5>
				     <p class="card-text">${vo.start_day }부터 <br><!-- </p>
				     <p class="card-text"> -->${vo.end_day }까지</p>
				  </div>
				  <div class="card-footer">
				  	<small class="text-muted">리더: ${vo.id_leader }</small>
				  	<a href="..challenge_room/group_in/.jsp" class="btn btn-sm btn-danger">참여하기</a>
				    <!-- <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small> -->
				  </div>
				  <!-- <div style="padding:5px 0px"> -->
        			
        		  <!-- </div> -->
				              
			       		
		  	</div>
			</div>	
		 </c:forEach>	

        </div>
        <!-- /.row -->
        
        <div>
        	<a href="../challenge_room/list.do?cate=${cate }&page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-success">이전</a>
        		${curpage } / ${totalpage }
        	<a href="../challenge_room     /list.do?cate=${cate }&page=${curpage<totalpage?curpage+1:totalpage }" class="btn btn-sm btn-success">다음</a>        	
        </div>

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
     <!--  <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p> -->
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
