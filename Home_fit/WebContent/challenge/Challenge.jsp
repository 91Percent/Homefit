<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 	<div class="text-center">
     <a href="../main/Challenge.jsp" class="btn btn-lg btn-active">전체 도전 목록 </a>
     <a href="../main/Challenge.jsp" class="btn btn-lg btn-primary">참여 중인 도전</a>
	</div>		   
	<div class="row">
	     	<c:forEach var="vo" items="${list}">
	             <div class="col-md-4">
	             <div class="thumbnail">
	               <a href="../challenge/Certified_detail.do?no=${ vo.challenge_no}">
	                 <img src="${vo.poster}" alt="Lights" width=250 height=100>
	                 <div class="caption">
	               	       <p style="font-size:8pt">${ vo.title }</p>
	                 </div>
	               </a>
	             </div>
	           </div>
	    	</c:forEach>
    	
</body>
</html>