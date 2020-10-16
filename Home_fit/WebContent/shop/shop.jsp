<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.sist.model.ShopModel"/>
<%
    model.shopListData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="row">
    <c:forEach var="vo" items="${list }">
		   <div class="col-md-3">
		    <div class="thumbnail">
		    
		    	<a href="../shop/shop_detail.do?title=${vo.title }" class="btn btn-lg btn-warning">
		        <img src="${vo.poster }" alt="Lights" style="width:25%">
		        </a>
		        
		        <div class="caption">
		          <a href="../shop/shop_detail.do?shop_no=${vo.shop_no }" class="btn btn-lg btn-warning">${vo.title }</a>
		        </div>
		        
		    </div>
		   </div>
		 </c:forEach>
  </div>
  <div class="row">
      <div class="text-right">
        <a href="../shop/shop.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-info">이전</a>
          ${curpage } page / ${totalpage } pages
        <a href="../shop/shop.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
      </div>
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


