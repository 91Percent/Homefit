<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div style="height:30px"></div>
  <div class="row">
    <div class="text-center">
      <a href="../coach/coachlist.do?cateno=71" class="btn btn-sm btn-primary">PT</a>
      <a href="../coach/coachlist.do?cateno=72" class="btn btn-sm btn-success">요가</a>
      <a href="../coach/coachlist.do?cateno=73" class="btn btn-sm btn-danger">필라테스</a>
      <a href="../coach/coachlist.do?cateno=74" class="btn btn-sm btn-danger">G.X</a>
    </div>
  </div>
  <div style="height:10px"></div>
  <div class="row">
    <c:forEach var="vo" items="${list }">
      <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="../coach/info.do?no=${vo.coach_no }">
	        <img src="${vo.poster }" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>${vo.coach_name }</p>
	        </div>
	      </a>
       </div>
     </div>
    </c:forEach>
    <div class="row">
    <div class="text-center">
      <a href="../coach/coachlist.do?cateno=${vo.cate_no }&page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-info">이전</a>
       		${curpage } page / ${totalpage } pages
      <a href="../coach/coachlist.do?cateno=${vo.cate_no }&page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-success">다음</a>
    </div>
  </div>
  </div>
</body>
</html>