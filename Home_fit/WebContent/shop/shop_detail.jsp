<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.ShopModel"/>
<%
   model.shopDetailData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="row">
    <h1 class="text-center">&lt;${vo.title }&gt;상세보기</h1>
    
    <table class="table">
      <tr>
        <td width=30% class="text-center" rowspan="3">
          <img src="${vo.poster }" width=50%>
        </td>
        <td colspan="2"><font color=orange>${vo.title }</font></td>
      </tr>
      <tr>
        <td width=10%>상품설명</td>
        <td width=60%>${vo.subtitle }</td>
      </tr>
      <div>
      	
        <a href="../shop/wishlist.do?shop_no=${vo.shop_no }" class="btn btn-lg btn-warning">장바구니</a>/
        <a href="../shop/order.do?shop_no=${vo.shop_no }" class="btn btn-lg btn-warning">바로구매</a>
      </div>
          
       
    </table>
  </div>
  <div class="row">
    <div class="text-right">
      <a href="#" class="btn btn-lg btn-primary">예매하기</a>
      <a href="#" class="btn btn-lg btn-danger">찜하기</a>
      <a href="../shop/shop.do" class="btn btn-lg btn-warning">목록</a>
    </div>
  </div>
</body>
</html>