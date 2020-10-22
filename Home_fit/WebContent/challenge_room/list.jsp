<%@page import="com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->

</head>

<body>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">


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
				<a href="../challenge_room/detail.do"><img class="card-img-top" src="/Home_fit2/challenge_poster/${vo.poster }" width=300px, height=200px></a>
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
        
    <div class="row">
    <div class="text-center">
       <ul class="pagination">
          <c:if test="${curpage>BLOCK }">
           <li><a href="../challenge_room/list.do?page=${startPage-1 }">&lt;</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i==curpage }">
              <li class="active"><a href="../challenge_room/list.do?page=${i }">${i }</a></li>
            </c:if>
            <c:if test="${i!=curpage }">
              <li><a href="../challenge_room/list.do?page=${i }">${i }</a></li>
            </c:if>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
		    <li><a href="../challenge_room/list.do?page=${endPage+1 }">&gt;</a></li>
		  </c:if>
		</ul>
    </div>
    </div>
      
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
