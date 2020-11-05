<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈핏</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../theme/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../theme/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../theme/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../theme/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../theme/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../theme/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../theme/css/style.css">
<link rel="stylesheet" href="../theme/css/custom.css">
</head>
<body>
	<!--  header  -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	  
	<!--  container -->
	<div class="container-fluid">
	  	<jsp:include page="${main_jsp }" />
	</div>
	
	<!--  footer  -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	 		
	<!-- jquery / js -->
	  <script src="../theme/vendors/jquery/jquery-3.2.1.min.js"></script>
	  <script src="../theme/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	  <script src="../theme/vendors/skrollr.min.js"></script>
	  <script src="../theme/vendors/owl-carousel/owl.carousel.min.js"></script>
	  <script src="../theme/vendors/nice-select/jquery.nice-select.min.js"></script>
	  <script src="../theme/vendors/jquery.ajaxchimp.min.js"></script>
	  <script src="../theme/vendors/mail-script.js"></script>
	  <script src="../theme/js/main.js"></script>
</body>